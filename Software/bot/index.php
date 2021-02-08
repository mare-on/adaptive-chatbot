<?php

require_once '../config/config.php';

// Hlavičky.
bot_headers();

// Získání vstupní zprávy.
$userMsg = string_check(filter_input(INPUT_POST, 'userMsg'));

// Kontrola prázdné zprávy.
if (empty($userMsg)) {
    $userMsg = "undefined";
}

// Výběr odpovědi.
$query = mysqli_query(db_connect(), "SELECT text FROM odpoved WHERE id = (SELECT odpoved_id FROM dotaz WHERE text = '" . $userMsg . "' )");

// Kontrola nalezení odpovědi.
if (mysqli_num_rows($query) > 0) {
    while ($row = mysqli_fetch_assoc($query)) {
        $result = explode("||", $row["text"]);
        $random = rand(0, count($result) - 1);
        $botMsg = $result[$random];
    }
} else {
    $botMsg = 'Nevím co říct, zkus se zeptat na něco jiného :/';
}

// Uložení konverzace do archivu.
mysqli_query(db_connect(), "INSERT INTO historie(message, date, type) VALUES('" . $userMsg . "', '" . date('Y-m-d h:i:s') . "', 'user'), ('" . $botMsg . "', '" . date('Y-m-d h:i:s') . "', 'bot')");

// Odpověď v podobě JSON objektu.
echo json_encode(['botMsg' => $botMsg], JSON_UNESCAPED_UNICODE);