<?php
require "sql_csatlakozas.php";

$azonosito = trim($_POST["azonosito"]);
$jelszo = trim($_POST["jelszo"]);
$jelszo_ism = trim($_POST["jelszo_ism"]);
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

$hibak = [];


// Hibakezelés
if (isset($azonosito) && isset($jelszo) && isset($jelszo_ism) && isset($vezeteknev) && isset($keresztnev) && isset($szuldatum) && isset($adoszam) && isset($iranyitoszam) && isset($varos) && isset($utca) && isset($hazszam) && isset($telefonszam) && isset($anyja_keresztnev) && isset($anyja_vezeteknev)) {
    $hasheltJelszo = password_hash($jelszo, PASSWORD_DEFAULT);

    if (strlen($azonosito) < 3 || strlen($azonosito) > 255) {
        $hibak[] = "Túl hosszú vagy rövid az azonosító. Minimum 3, maximum 255 karakterből kell állnia.";
    }
    if (strlen($jelszo) < 6 || strlen($jelszo) > 255) {
        $hibak[] = "Túl hosszú vagy rövid a jelszó. Minimum 6, maximum 255 karakterből kell állnia.";
    }
    if ($jelszo != $jelszo_ism) {
        $hibak[] = "A megadott 2 jelszó nem egyezik meg.";
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

    $azonosito_elerheto = "SELECT azonosito FROM felhasznalo WHERE azonosito='$azonosito'";
    $azonosito_elerheto_query = $csatlakozas->query($azonosito_elerheto);

    if ($azonosito_elerheto_query->num_rows > 0) {
        $hibak[] = "Az azonosító foglalt.";
    }

    // Ha nincs hiba
    if (count($hibak) === 0) {
        // Adatok mentése
        $felhasznalo = "INSERT INTO felhasznalo (azonosito, jelszo) VALUES ('$azonosito', '$hasheltJelszo');";
        $felhasznalo_adoszam = "INSERT INTO felhasznalo_adoszam (azonosito, adoszam) VALUES ('$azonosito', '$adoszam');";
        $felhasznalo_infok = "INSERT INTO felhasznalo_infok (azonosito, telefonszam, szuletesi_datum) VALUES ('$azonosito', '$telefonszam', '$szuldatum');";
        $iranyitoszam_telepules = "INSERT INTO iranyitoszam_telepules (iranyitoszam, telepules) VALUES ('$iranyitoszam', '$varos')";
        $felhasznalo_lakcim = "INSERT INTO felhasznalo_lakcim (azonosito, iranyitoszam, utca, hazszam) VALUES ('$azonosito', '$iranyitoszam', '$utca', '$hazszam');";
        $felhasznalo_neve = "INSERT INTO felhasznalo_neve (azonosito, vezeteknev, keresztnev) VALUES ('$azonosito', '$vezeteknev', '$keresztnev');";
        $felhasznalo_anyja_neve = "INSERT INTO felhasznalo_anyja_neve (azonosito, vezeteknev, keresztnev) VALUES ('$azonosito', '$anyja_vezeteknev', '$anyja_keresztnev');";

        // Irányítószám lekérése
        $telepules_elerheto = "SELECT iranyitoszam, telepules FROM iranyitoszam_telepules WHERE iranyitoszam='$iranyitoszam'";
        $telepules_elerheto_query = $csatlakozas->query($telepules_elerheto);

        // Ha van már ilyen irányítószámú település a táblában, akkor az $iranyitoszam_telepules queryt skipeljük
        if ($telepules_elerheto_query->num_rows > 0) {
            if ($csatlakozas->query($felhasznalo) === TRUE && $csatlakozas->query($felhasznalo_adoszam) === TRUE && $csatlakozas->query($felhasznalo_infok) === TRUE && $csatlakozas->query($felhasznalo_lakcim) === TRUE && $csatlakozas->query($felhasznalo_neve) === TRUE && $csatlakozas->query($felhasznalo_anyja_neve) === TRUE) {
                session_start();
                $_SESSION['sikeres_regisztracio'] = "sikeres_regisztracio";
                header("Location: ./../bejelentkezes_oldal.php");
            } else {
                echo "SQL hiba.";
            }
        }

        // Queryk futtatása
        if ($csatlakozas->query($felhasznalo) === TRUE && $csatlakozas->query($felhasznalo_adoszam) === TRUE && $csatlakozas->query($felhasznalo_infok) === TRUE && $csatlakozas->query($iranyitoszam_telepules) === TRUE && $csatlakozas->query($felhasznalo_lakcim) === TRUE && $csatlakozas->query($felhasznalo_neve) === TRUE && $csatlakozas->query($felhasznalo_anyja_neve) === TRUE) {
            session_start();
            $_SESSION['sikeres_regisztracio'] = "sikeres_regisztracio";
            header("Location: ./../bejelentkezes_oldal.php");
        } else {
            echo "SQL hiba.";
        }
    } else {
        session_start();
        $_SESSION['hiba'] = $hibak;
        header("Location: ./../regisztracio_oldal.php");
    }
}

disconnect();
?>