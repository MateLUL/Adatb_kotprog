<?php
require "./sql_csatlakozas.php";
session_start();

if (isset($_POST['torles'])) {
    $azonosito = $_SESSION['azonosito'];
    $felhasznalo_adoszam = "DELETE FROM felhasznalo_adoszam WHERE azonosito = '$azonosito';";
    $felhasznalo_infok = "DELETE FROM felhasznalo_infok WHERE azonosito = '$azonosito';";
    $felhasznalo_lakcim = "DELETE FROM felhasznalo_lakcim WHERE azonosito = '$azonosito';";
    $felhasznalo_neve = "DELETE FROM felhasznalo_neve WHERE azonosito = '$azonosito';";
    $felhasznalo_anyja_neve = "DELETE FROM felhasznalo_anyja_neve WHERE azonosito = '$azonosito';";
    $felhasznalo = "DELETE FROM felhasznalo WHERE azonosito = '$azonosito';";

    if ($csatlakozas->query($felhasznalo_adoszam) === TRUE && $csatlakozas->query($felhasznalo_infok) === TRUE && $csatlakozas->query($felhasznalo_lakcim) === TRUE && $csatlakozas->query($felhasznalo_neve) === TRUE && $csatlakozas->query($felhasznalo_anyja_neve) === TRUE && $csatlakozas->query($felhasznalo) === TRUE) {
        $_SESSION['sikeres_torles'] = "sikeres_torles";
        header("Location: ./../index.php");
    }
}

disconnect();
