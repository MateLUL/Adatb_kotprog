<?php
session_start();
require "sql_csatlakozas.php";

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
$id = $_SESSION['id'];
$azonosito = $_SESSION['azonosito'];
$jelszo_set = false;

if (isset($_POST['jelszo']) && isset($_POST['jelszo_ism']) && $_POST['jelszo'] != '' && $_POST['jelszo_ism'] != '') {
    $jelszo = trim($_POST["jelszo"]);
    $jelszo_ism = trim($_POST["jelszo_ism"]);

    $jelszo_set = true;
}


$hibak = [];


// Hibakezelés
if (isset($vezeteknev) && isset($keresztnev) && isset($szuldatum) && isset($adoszam) && isset($iranyitoszam) && isset($varos) && isset($utca) && isset($hazszam) && isset($telefonszam) && isset($anyja_keresztnev) && isset($anyja_vezeteknev)) {
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
    if ($jelszo_set == true) {
        if (strlen($jelszo) < 6 || strlen($jelszo) > 255) {
            $hibak[] = "Túl hosszú vagy rövid a jelszó. Minimum 6, maximum 255 karakterből kell állnia.";
        }
        if ($jelszo != $jelszo_ism) {
            $hibak[] = "A megadott 2 jelszó nem egyezik meg.";
        }

        $jelszo_hashed = password_hash($jelszo, PASSWORD_DEFAULT);
        $felhasznalo = "UPDATE felhasznalo SET jelszo = '$jelszo_hashed' WHERE id = '$id';";
    }

    // Ha nincs hiba
    if (count($hibak) === 0) {
        // Adatok mentése
        $iranyitoszam_telepules = "INSERT INTO iranyitoszam_telepules (iranyitoszam, telepules) VALUES ('$iranyitoszam', '$varos')";
        $felhasznalo_adoszam = "UPDATE felhasznalo_adoszam SET adoszam = '$adoszam' WHERE id = '$id';";
        $felhasznalo_infok = "UPDATE felhasznalo_infok SET telefonszam = '$telefonszam', szuletesi_datum = '$szuldatum' WHERE id = '$id';";
        $felhasznalo_lakcim = "UPDATE felhasznalo_lakcim SET iranyitoszam = '$iranyitoszam', utca = '$utca', hazszam = '$hazszam' WHERE id = '$id';";
        $felhasznalo_neve = "UPDATE felhasznalo_neve SET vezeteknev = '$vezeteknev', keresztnev = '$keresztnev' WHERE id = '$id';";
        $felhasznalo_anyja_neve = "UPDATE felhasznalo_anyja_neve SET vezeteknev = '$anyja_vezeteknev', keresztnev = '$anyja_keresztnev' WHERE id = '$id';";

        // Irányítószám lekérése
        $telepules_elerheto = "SELECT iranyitoszam, telepules FROM iranyitoszam_telepules WHERE iranyitoszam='$iranyitoszam'";
        $telepules_elerheto_query = $csatlakozas->query($telepules_elerheto);

        // Ha van már ilyen irányítószámú település a táblában, akkor az $iranyitoszam_telepules queryt skipeljük
        if ($telepules_elerheto_query->num_rows > 0) {
            if ($jelszo_set == true) {
                if ($csatlakozas->query($felhasznalo_adoszam) === TRUE && $csatlakozas->query($felhasznalo_infok) === TRUE && $csatlakozas->query($felhasznalo_lakcim) === TRUE && $csatlakozas->query($felhasznalo_neve) === TRUE && $csatlakozas->query($felhasznalo_anyja_neve) === TRUE && $csatlakozas->query($felhasznalo) === TRUE) {
                    $_SESSION['sikeres_modositas'] = "sikeres_modositas";
                    header("Location: ./../szemelyes_adatok_oldal.php");
                } else {
                    echo "SQL hiba.";
                }
            } else {
                if ($csatlakozas->query($felhasznalo_adoszam) === TRUE && $csatlakozas->query($felhasznalo_infok) === TRUE && $csatlakozas->query($felhasznalo_lakcim) === TRUE && $csatlakozas->query($felhasznalo_neve) === TRUE && $csatlakozas->query($felhasznalo_anyja_neve) === TRUE) {
                    $_SESSION['sikeres_modositas'] = "sikeres_modositas";
                    header("Location: ./../szemelyes_adatok_oldal.php");
                } else {
                    echo "SQL hiba.";
                }
            }
        }

        if ($jelszo_set == true) {
            if ($csatlakozas->query($felhasznalo_adoszam) === TRUE && $csatlakozas->query($felhasznalo_infok) === TRUE && $csatlakozas->query($iranyitoszam_telepules) === TRUE && $csatlakozas->query($felhasznalo_lakcim) === TRUE && $csatlakozas->query($felhasznalo_neve) === TRUE && $csatlakozas->query($felhasznalo_anyja_neve) === TRUE && $csatlakozas->query($felhasznalo) === TRUE) {
                $_SESSION['sikeres_modositas'] = "sikeres_modositas";
                $_SESSION['azonosito'] = $azonosito;
                header("Location: ./../szemelyes_adatok_oldal.php");
            } else {
                echo "SQL hiba.";
            }
        } else {
            if ($csatlakozas->query($felhasznalo_adoszam) === TRUE && $csatlakozas->query($felhasznalo_infok) === TRUE && $csatlakozas->query($iranyitoszam_telepules) === TRUE && $csatlakozas->query($felhasznalo_lakcim) === TRUE && $csatlakozas->query($felhasznalo_neve) === TRUE && $csatlakozas->query($felhasznalo_anyja_neve) === TRUE) {
                $_SESSION['sikeres_modositas'] = "sikeres_modositas";
                $_SESSION['azonosito'] = $azonosito;
                header("Location: ./../szemelyes_adatok_oldal.php");
            } else {
                echo "SQL hiba.";
            }
        }
    } else {
        $_SESSION['hibak'] = $hibak;
        header("Location: ./../szemelyes_adatok_oldal.php");
    }
}

disconnect();
