<?php
require "sql_csatlakozas.php";
connect();

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


//Ha a formon belül minden inputba került adat
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
    if (strlen($hazszam) < 5 || strlen($hazszam) > 255) {
        $hibak[] = "Túl hosszú vagy rövid a házszám. Minimum 5, maximum 255 karakterből kell állnia.";
    }
    if (strlen($anyja_keresztnev) < 2 || strlen($anyja_keresztnev) > 255) {
        $hibak[] = "Túl hosszú vagy rövid az anyja keresztneve. Minimum 2, maximum 255 karakterből kell állnia.";
    }
    if (strlen($anyja_vezeteknev) < 2 || strlen($anyja_vezeteknev) > 255) {
        $hibak[] = "Túl hosszú vagy rövid az anyja vezetékneve. Minimum 2, maximum 255 karakterből kell állnia.";
    }

    $azonosito_elerheto = "SELECT azonosito FROM felhasznalok WHERE azonosito='$azonosito'";
    $azonosito_elerheto_query = $csatlakozas->query($fhnevElerheto);

    if ($azonosito_elerheto_query->num_rows > 0) {
        $hibak[] = "A felhasználónév foglalt.";
    }

    if (count($hibak) === 0) {
        $users = "INSERT INTO users (email, fhnev, jelszo, veznev, kernev, szuldatum, nem) VALUES ('$email', '$fhnev', '$hasheltJelszo', '$veznev', '$kernev', '$szuldatum', '$nem')";
        $userprofile = "INSERT INTO userprofile (userId) VALUES (LAST_INSERT_ID())";

        if ($csatlakozas->query($users) === TRUE && $csatlakozas->query($userprofile) === TRUE) {
            header("Location: ./../bejelentkezes_oldal.php");
        } else {
            echo "Hiba: " . $sqlQuery . "<br>" . $csatlakozas->error;
        }
    } else {
        foreach ($hibak as $hiba) {
            echo $hiba . "<br>";
        }
    }
}

disconnect();
?>