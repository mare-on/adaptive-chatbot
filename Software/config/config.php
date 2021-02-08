<?php

// Hlavičky bota.
function bot_headers() {
    header("Access-Control-Allow-Headers: X-Requested-With, Content-Type, Origin, Cache-Control, Pragma, Authorization, Accept, Accept-Encoding");
    header("Content-Type: application/json; charset=utf-8");
    header("Access-Control-Allow-Credentials: true");
    header("Access-Control-Allow-Methods: POST");
    header("Access-Control-Allow-Origin: *");
}

// Připojení k databázi.
function db_connect() {
    static $connection;

    $adress = 'localhost';
    $database = 'chatbot';
    $username = 'root';
    $password = '';

    $connection = mysqli_connect($adress, $username, $password, $database);
    if (!$connection) {
        $connection = 0;
    }
    return $connection;
}

// Kontrola textového řetězce.
function string_check($string) {
    return filter_var($string, FILTER_SANITIZE_STRING);
}