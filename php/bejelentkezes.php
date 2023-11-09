<?php
require "sql_csatlakozas.php";

$azonosito = trim($_POST['azonosito']);
$jelszo = trim($_POST['jelszo']);

if (isset($azonosito) && isset($jelszo)) {
    $sqlQuery = "SELECT azonosito, jelszo FROM users WHERE azonosito='$azonosito'";
    $eredmeny = $csatlakozas->query($sqlQuery);

    if ($eredmeny->num_rows == 1) {
        while ($user = $eredmeny->fetch_assoc()) {
            if (password_verify($jelszo, $user['jelszo'])) {
                header("Location: ./../index.php");
                //session
            } else {
                echo "Hibás jelszó.";
            }
        }
    } else {
        echo "Hibás felhasználónév.";
    }
}

disconnect();
?>