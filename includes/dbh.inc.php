<?php
// Include the main functions to load env variables
require_once 'main.function.inc.php';

$serverName = env('DB_HOST', 'localhost');
$DBusername = env('DB_USER', 'root');
$DBpass = env('DB_PASSWORD', '');
$DBname = env('DB_NAME', 'attendancewebapp');
$protocol = isset($_SERVER['HTTPS']) && $_SERVER['HTTPS'] === 'on' ? 'https://' : 'http://';
$domain = $_SERVER['HTTP_HOST'];
$websiteUrl = $protocol . $domain;

$myMail = env('ADMIN_EMAIL');

$conn = mysqli_connect($serverName,$DBusername,$DBpass,$DBname);

if(!$conn){
    die("connection failed". mysqli_connect_error());
}
?>