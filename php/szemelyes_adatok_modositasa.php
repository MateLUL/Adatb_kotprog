<?php
session_start();
require "sql_csatlakozas.php";

$azonosito = trim($_POST["azonosito"]);
$vezeteknev = trim($_POST["vezeteknev"]);
$keresztnev = trim($_POST["keresztnev"]);
$szuldatum = trim($_POST["szuldatum"]);
$adoszam = trim($_POST["adoszam"]);
$iranyitoszam = trim($_POST["iranyitoszam"]);
$varos = trim($_POST["varos"]);
$utca = trim($_POST["utca"]);
$hazszam = trim($_POST["hazszam"]);
$telefonszam = trim($_POST["telefonszam"]);
$anyja_keresztnev = trim($_POST["anyja_keresztnev"]);
$anyja_vezeteknev = trim($_POST["anyja_vezeteknev"]);
$regi_azonosito = $_SESSION['azonosito'];

$hibak = [];


// Hibakezelés
if (isset($azonosito) && isset($vezeteknev) && isset($keresztnev) && isset($szuldatum) && isset($adoszam) && isset($iranyitoszam) && isset($varos) && isset($utca) && isset($hazszam) && isset($telefonszam) && isset($anyja_keresztnev) && isset($anyja_vezeteknev)) {
    if (strlen($azonosito) < 3 || strlen($azonosito) > 255) {
        $hibak[] = "Túl hosszú vagy rövid az azonosító. Minimum 3, maximum 255 karakterből kell állnia.";
    }
    if (strlen($vezeteknev) < 2 || strlen($vezeteknev) > 255) {
        $hibak[] = "Túl hosszú vagy rövid a vezetéknév. Minimum 2, maximum 255 karakterből kell állnia.";
    }
    if (strlen($keresztnev) < 2 || strlen($keresztnev) > 255) {
        $hibak[] = "Túl hosszú vagy rövid a keresztnév. Minimum 2, maximum 255 karakterből kell állnia.";
    }
    if (strlen($adoszam) < 2 || strlen($adoszam) > 255) {
        $hibak[] = "Túl hosszú vagy rövid az adószám. Minimum 2, maximum 255 karakterből kell állnia.";
    }
    if (strlen($iranyitoszam) < 2 || strlen($iranyitoszam) > 255) {
        $hibak[] = "Túl hosszú vagy rövid az irányítószám. Minimum 2, maximum 255 karakterből kell állnia.";
    }
    if (strlen($varos) < 2 || strlen($varos) > 255) {
        $hibak[] = "Túl hosszú vagy rövid a város. Minimum 2, maximum 255 karakterből kell állnia.";
    }
    if (strlen($utca) < 2 || strlen($utca) > 255) {
        $hibak[] = "Túl hosszú vagy rövid az utca. Minimum 2, maximum 255 karakterből kell állnia.";
    }
    if (strlen($hazszam) > 255) {
        $hibak[] = "Túl hosszú a házszám. Maximum 255 karakterből kell állnia.";
    }
    if (strlen($anyja_keresztnev) < 2 || strlen($anyja_keresztnev) > 255) {
        $hibak[] = "Túl hosszú vagy rövid az anyja keresztneve. Minimum 2, maximum 255 karakterből kell állnia.";
    }
    if (strlen($anyja_vezeteknev) < 2 || strlen($anyja_vezeteknev) > 255) {
        $hibak[] = "Túl hosszú vagy rövid az anyja vezetékneve. Minimum 2, maximum 255 karakterből kell állnia.";
    }

    if ($regi_azonosito != $azonosito) {
        $azonosito_elerheto = "SELECT azonosito FROM felhasznalo WHERE azonosito='$azonosito'";
        $azonosito_elerheto_query = $csatlakozas->query($azonosito_elerheto);

        if ($azonosito_elerheto_query->num_rows > 0) {
            $hibak[] = "Az azonosító foglalt.";
        }

        $foreign_key_drop = "";
    }

    // Ha nincs hiba
    if (count($hibak) === 0) {
        // Adatok mentése
        $iranyitoszam_telepules = "INSERT INTO iranyitoszam_telepules (iranyitoszam, telepules) VALUES ('$iranyitoszam', '$varos')";
        $felhasznalo_adoszam = "UPDATE felhasznalo_adoszam SET azonosito = '$azonosito', adoszam = '$adoszam' WHERE azonosito = '$regi_azonosito';";
        $felhasznalo_infok = "UPDATE felhasznalo_infok SET azonosito = '$azonosito', telefonszam = '$telefonszam', szuletesi_datum = '$szuldatum' WHERE azonosito = '$regi_azonosito';";
        $felhasznalo_lakcim = "UPDATE felhasznalo_lakcim SET azonosito = '$azonosito', iranyitoszam = '$iranyitoszam', utca = '$utca', hazszam = '$hazszam' WHERE azonosito = '$regi_azonosito';";
        $felhasznalo_neve = "UPDATE felhasznalo_neve SET azonosito = '$azonosito', vezeteknev = '$vezeteknev', keresztnev = '$keresztnev' WHERE azonosito = '$regi_azonosito';";
        $felhasznalo_anyja_neve = "UPDATE felhasznalo_anyja_neve SET azonosito = '$azonosito', vezeteknev = '$anyja_vezeteknev', keresztnev = '$anyja_keresztnev' WHERE azonosito = '$regi_azonosito';";
        $felhasznalo = "UPDATE felhasznalo SET azonosito = '$azonosito' WHERE azonosito = '$regi_azonosito';";

        // Irányítószám lekérése
        $telepules_elerheto = "SELECT iranyitoszam, telepules FROM iranyitoszam_telepules WHERE iranyitoszam='$iranyitoszam'";
        $telepules_elerheto_query = $csatlakozas->query($telepules_elerheto);

        // Ha van már ilyen irányítószámú település a táblában, akkor az $iranyitoszam_telepules queryt skipeljük
        if ($telepules_elerheto_query->num_rows > 0) {
            if ($csatlakozas->query($felhasznalo_adoszam) === TRUE && $csatlakozas->query($felhasznalo_infok) === TRUE && $csatlakozas->query($felhasznalo_lakcim) === TRUE && $csatlakozas->query($felhasznalo_neve) === TRUE && $csatlakozas->query($felhasznalo_anyja_neve) === TRUE && $csatlakozas->query($felhasznalo) === TRUE) {
                $_SESSION['sikeres_modositas'] = "sikeres_modositas";
                header("Location: ./../szemelyes_adatok_oldal.php");
            } else {
                echo "SQL hiba.";
            }
        }
        if ($csatlakozas->query($felhasznalo_adoszam) === TRUE && $csatlakozas->query($felhasznalo_infok) === TRUE && $csatlakozas->query($iranyitoszam_telepules) === TRUE && $csatlakozas->query($felhasznalo_lakcim) === TRUE && $csatlakozas->query($felhasznalo_neve) === TRUE && $csatlakozas->query($felhasznalo_anyja_neve) === TRUE && $csatlakozas->query($felhasznalo) === TRUE) {
            $_SESSION['sikeres_modositas'] = "sikeres_modositas";
            $_SESSION['azonosito'] = $azonosito;
            header("Location: ./../szemelyes_adatok_oldal.php");
        } else {
            echo "SQL hiba.";
        }
    } else {
        $_SESSION['hibak'] = $hibak;
        header("Location: ./../szemelyes_adatok_oldal.php");
    }
}

disconnect();
