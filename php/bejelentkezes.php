<?php
require "sql_csatlakozas.php";

$azonosito = trim($_POST['azonosito']);
$jelszo = trim($_POST['jelszo']);

if (isset($azonosito) && isset($jelszo)) {
    $sqlQuery = "SELECT id, azonosito, jelszo, szerepkor FROM felhasznalo WHERE azonosito='$azonosito'";
    $eredmeny = $csatlakozas->query($sqlQuery);

    if ($eredmeny->num_rows == 1) {
        while ($user = $eredmeny->fetch_assoc()) {
            if (password_verify($jelszo, $user['jelszo'])) {
                session_start();
                $_SESSION['azonosito'] = $azonosito;
                $_SESSION['belepett'] = "belepett";
                $_SESSION['szerepkor'] = $user['szerepkor'];
                $_SESSION['id'] = $user['id'];

                $bejelentkezett = "UPDATE felhasznalo SET `be_van-e_jelentkezve` = 1, utolso_belepes_idopontja = now() WHERE azonosito = '$azonosito';";
                $bejelentkezett_query = $csatlakozas->query($bejelentkezett);

                if ($bejelentkezett_query === TRUE) {
                    header("Location: ./../index.php");
                }
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