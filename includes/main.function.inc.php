<?php
$StudentHOME = "../student";
$TeacherHOME = "../teacher";

$DOMAIN = $_SERVER['HTTP_HOST'];

function redirect($url, $message = NULL)
{
    if ($message === NULL) {
        header("location: " . $url);
    } else {
        $_SESSION["error"] = $message;
        header("location: " . $url);
    }
    exit();
}

function isLoged($user_type="")
{
    if (!isset($_SESSION["id"])) {
        if($_SESSION["userType"]!=="" && $_SESSION["userType"]!==$user_type) redirect("../auth.php", "user on wrong page");
        redirect("../auth.php", "Please login first");
    } else {
        return true;
    }
}

function loadEnv($path) {
    if (!file_exists($path)) {
        // Don't throw exception if .env file doesn't exist
        // System environment variables might be used instead
        return;
    }
    
    $lines = file($path, FILE_IGNORE_NEW_LINES | FILE_SKIP_EMPTY_LINES);
    
    foreach ($lines as $line) {
        if (strpos(trim($line), '#') === 0) {
            continue; // Skip comments
        }
        
        if (strpos($line, '=') === false) {
            continue; // Skip lines without =
        }
        
        list($name, $value) = explode('=', $line, 2);
        $name = trim($name);
        $value = trim($value);
        
        // Only set if not already in environment (system env vars take priority)
        if (!array_key_exists($name, $_ENV) && getenv($name) === false) {
            $_ENV[$name] = $value;
            putenv("$name=$value"); // Also set in putenv for getenv() compatibility
        }
    }
}

// Load environment variables from .env file
loadEnv(__DIR__ . '/../.env');

// Helper function to get environment variables
// Priority: 1. System environment variables, 2. .env file, 3. default value
function env($key, $default = null) {
    // Check system environment variables first
    $value = getenv($key);
    if ($value !== false) {
        return $value;
    }
    
    // Check $_ENV array (from .env file)
    if (isset($_ENV[$key])) {
        return $_ENV[$key];
    }
    
    // Check $_SERVER superglobal
    if (isset($_SERVER[$key])) {
        return $_SERVER[$key];
    }
    
    // Return default value
    return $default;
}