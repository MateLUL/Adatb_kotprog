<?php
require "sql_csatlakozas.php";

$azonosito = trim($_POST['azonosito']);
$jelszo = trim($_POST['jelszo']);

if (isset($azonosito) && isset($jelszo)) {
    $sqlQuery = "SELECT azonosito, jelszo, szerepkor FROM felhasznalo WHERE azonosito='$azonosito'";
    $eredmeny = $csatlakozas->query($sqlQuery);

    if ($eredmeny->num_rows == 1) {
        while ($user = $eredmeny->fetch_assoc()) {
            if (password_verify($jelszo, $user['jelszo'])) {
                session_start();
                $_SESSION['azonosito'] = $azonosito;
                $_SESSION['belepett'] = "belepett";
                $_SESSION['szerepkor'] = $user['szerepkor'];

                header("Location: ./../index.php");
            } else {
                session_start();
                $_SESSION['login_hiba'] = "login_hiba";
                header("Location: ./../bejelentkezes_oldal.php");
            }
        }
    } else {
        session_start();
        $_SESSION['login_hiba'] = "login_hiba";
        header("Location: ./../bejelentkezes_oldal.php");
    }
}

disconnect();
?>