# Use official PHP image with Apache
FROM php:8.2-apache

# Set working directory
WORKDIR /var/www/html

# Install system dependencies
RUN apt-get update && apt-get install -y \
    git \
    curl \
    libpng-dev \
    libonig-dev \
    libxml2-dev \
    zip \
    unzip \
    && rm -rf /var/lib/apt/lists/*

# Install PHP extensions
RUN docker-php-ext-install \
    pdo_mysql \
    mysqli \
    mbstring \
    exif \
    pcntl \
    bcmath \
    gd

# Install Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Enable Apache modules
RUN a2enmod rewrite ssl headers

# Copy composer files first for better caching
COPY composer.json composer.lock* /var/www/html/

# Install Composer dependencies
RUN composer install --no-dev --optimize-autoloader --no-interaction

# Copy rest of application files
COPY . /var/www/html/

# Create .env file from example if it doesn't exist
RUN if [ ! -f .env ]; then cp .env.example .env; fi

# Set proper permissions
RUN chown -R www-data:www-data /var/www/html \
    && chmod -R 755 /var/www/html \
    && chmod -R 775 /var/www/html/images

# Configure Apache
RUN echo "ServerName localhost" >> /etc/apache2/apache2.conf

# Update Apache document root and directory configuration
RUN sed -i 's|/var/www/html|/var/www/html|g' /etc/apache2/sites-available/000-default.conf \
    && sed -i 's|AllowOverride None|AllowOverride All|g' /etc/apache2/apache2.conf

# Create a custom Apache configuration for the app
RUN echo '<Directory /var/www/html>\n\
    Options Indexes FollowSymLinks\n\
    AllowOverride All\n\
    Require all granted\n\
    DirectoryIndex index.php index.html\n\
</Directory>' > /etc/apache2/conf-available/app.conf \
    && a2enconf app

# Configure PHP to suppress warnings (temporary fix)
RUN echo "error_reporting = E_ALL & ~E_WARNING & ~E_NOTICE & ~E_DEPRECATED" > /usr/local/etc/php/conf.d/error-reporting.ini \
    && echo "display_errors = On" >> /usr/local/etc/php/conf.d/error-reporting.ini \
    && echo "log_errors = On" >> /usr/local/etc/php/conf.d/error-reporting.ini \
    && echo "error_log = /var/log/apache2/php_errors.log" >> /usr/local/etc/php/conf.d/error-reporting.ini

# Expose port 80
EXPOSE 80

# Health check
HEALTHCHECK --interval=30s --timeout=3s --start-period=5s --retries=3 \
    CMD curl -f http://localhost/ || exit 1

# Create startup script with messages
RUN echo '#!/bin/bash\n\
echo "========================================="\n\
echo "🚀 Roll Call App Starting..."\n\
echo "========================================="\n\
apache2-foreground &\n\
sleep 2\n\
echo "✅ Apache Started"\n\
echo "📱 Website: http://localhost:8080"\n\
echo "📊 PhpMyAdmin: http://localhost:8081"\n\
echo "========================================="\n\
wait' > /start.sh && chmod +x /start.sh

# Use custom startup script
CMD ["/start.sh"]