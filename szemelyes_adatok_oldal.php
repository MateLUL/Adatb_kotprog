<?php
session_start();

if (!isset($_SESSION['azonosito'])) {
    header("Location: index.php");
}

if (isset($_SESSION['sikeres_modositas'])) {
    echo "Sikeres adatmódosítás.<br>";
    unset($_SESSION['sikeres_modositas']);
}

if (isset($_SESSION['hibak'])) {
    foreach ($_SESSION['hibak'] as $hiba) {
        echo $hiba . "<br>";
    }

    unset($_SESSION['hibak']);
}

?>


<!DOCTYPE html>
<html lang="hu">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Saját adatok - Ingatlan</title>
</head>
<body>

<?php

    require_once "navbar.php";

?>

<?php

    require_once "./php/sql_csatlakozas.php";

    $azonosito = $_SESSION['azonosito'];

    $sajat_adatok = "SELECT iranyitoszam_telepules.telepules AS t_varos, iranyitoszam_telepules.iranyitoszam AS t_iranyitoszam, felhasznalo.azonosito, felhasznalo_neve.keresztnev AS f_keresztnev, felhasznalo_neve.vezeteknev AS f_vezeteknev, adoszam, felhasznalo_lakcim.iranyitoszam AS f_iranyitoszam, utca, hazszam, telefonszam, szuletesi_datum, felhasznalo_anyja_neve.vezeteknev AS a_vezeteknev, felhasznalo_anyja_neve.keresztnev AS a_keresztnev
    FROM felhasznalo
    INNER JOIN felhasznalo_lakcim ON felhasznalo_lakcim.id = felhasznalo.id
    INNER JOIN felhasznalo_neve ON felhasznalo_neve.id = felhasznalo.id
    INNER JOIN felhasznalo_infok ON felhasznalo_infok.id = felhasznalo.id
    INNER JOIN felhasznalo_anyja_neve ON felhasznalo_anyja_neve.id = felhasznalo.id
    INNER JOIN felhasznalo_adoszam ON felhasznalo_adoszam.id = felhasznalo.id
    INNER JOIN iranyitoszam_telepules ON felhasznalo_lakcim.iranyitoszam = iranyitoszam_telepules.iranyitoszam
    WHERE felhasznalo.azonosito = \"$azonosito\"";
    
    $sajat_adatok_query = $csatlakozas->query($sajat_adatok);

    if ($sajat_adatok_query->num_rows > 0) {
        foreach ($sajat_adatok_query as $adat) {
            echo "
            <p>Azonosító: " . $adat['azonosito'] . " </p>
            <p>Keresztnév: " . $adat['f_keresztnev'] . " </p>
            <p>Vezetéknév: " . $adat['f_vezeteknev'] . " </p>
            <p>Adószám: " . $adat['adoszam'] . " </p>
            <p>Irányítószám: " . $adat['f_iranyitoszam'] . " </p>
            <p>Város: " . $adat['t_varos'] . " </p>
            <p>Utca: " . $adat['utca'] . " </p>
            <p>Házszám: " . $adat['hazszam'] . " </p>
            <p>Telefonszám: " . $adat['telefonszam'] . " </p>
            <p>Születési dátum: " . $adat['szuletesi_datum'] . " </p>
            <p>Anyja keresztneve: " . $adat['a_keresztnev'] . " </p>
            <p>Anyja vezetékneve: " . $adat['a_vezeteknev'] . " </p>
            ";

            echo "
            <br>
            <p>Adatok frissítése</p>

            <form action=\"./php/szemelyes_adatok_modositasa.php\" method=\"post\">
                <label for=\"keresztnev\">Keresztnév</label>
                <input type=\"text\" name=\"keresztnev\" id=\"keresztnev\" required value=" . $adat['f_keresztnev'] . ">
                <br>

                <label for=\"vezeteknev\">Vezetéknév</label>
                <input type=\"text\" name=\"vezeteknev\" id=\"vezeteknev\" required value=" . $adat['f_vezeteknev'] . ">
                <br>

                <label for=\"jelszo\">Jelszó</label>
                <input type=\"password\" name=\"jelszo\" id=\"jelszo\">
                <br>

                <label for=\"jelszo_ism\">Jelszó ismételve</label>
                <input type=\"password\" name=\"jelszo_ism\" id=\"jelszo_ism\">
                <br>

                <label for=\"adoszam\">Adószám</label>
                <input type=\"text\" name=\"adoszam\" id=\"adoszam\" required value=" . $adat['adoszam'] . ">
                <br>

                <label for=\"iranyitoszam\">Irányítószám</label>
                <input type=\"text\" name=\"iranyitoszam\" id=\"iranyitoszam\" required value=" . $adat['f_iranyitoszam'] . ">
                <br>

                <label for=\"varos\">Város</label>
                <input type=\"text\" name=\"varos\" id=\"varos\" required value=" . $adat['t_varos'] . ">
                <br>

                <label for=\"utca\">Utca</label>
                <input type=\"text\" name=\"utca\" id=\"utca\" required value=" . $adat['utca'] . ">
                <br>

                <label for=\"hazszam\">Házszám</label>
                <input type=\"text\" name=\"hazszam\" id=\"hazszam\" required value=" . $adat['hazszam'] . ">
                <br>

                <label for=\"telefonszam\">Telefonszám</label>
                <input type=\"tel\" name=\"telefonszam\" id=\"telefonszam\" required value=" . $adat['telefonszam'] . ">
                <br>

                <label for=\"szuldatum\">Születési dátum</label>
                <input type=\"date\" name=\"szuldatum\" id=\"szuldatum\" required value=" . $adat['szuletesi_datum'] . ">
                <br>

                <label for=\"anyja_keresztnev\">Anyja keresztneve</label>
                <input type=\"text\" name=\"anyja_keresztnev\" id=\"anyja_keresztnev\" required value=" . $adat['a_keresztnev'] . ">
                <br>

                <label for=\"anyja_vezeteknev\">Anyja vezetékneve</label>
                <input type=\"text\" name=\"anyja_vezeteknev\" id=\"anyja_vezeteknev\" required value=" . $adat['a_vezeteknev'] . ">
                <br>

                <input type=\"submit\" value=\"Frissítés\" name=\"frissites\">
            </form>
            ";

            echo "
            <br>
            <form action=\"./php/fiok_torlese.php\" method=\"post\">
            
            <input type=\"submit\" value=\"Fiók törlése\" name=\"torles\">

            </form>
            ";
        }
    }

    disconnect();
?>
    
</body>
</html>