<?php

if (isset($_SESSION['azonosito']) && isset($_SESSION['szerepkor'])) {
    echo "
    <form action=\"./php/kijelentkezes.php\" method=\"post\">
    <input type=\"submit\" name=\"kijelentkezes\" value=\"Kijelentkezés\">
    </form>
    <br>
    ";
    if ($_SESSION['szerepkor'] == 1) {
        echo "
        <a href=\"telkek_listazasa_oldal.php\">Telek listázása</a>
        <br>
        <a href=\"telkek_felvitele_oldal.php\">Telek felvitele</a>
        <br>
        <a href=\"ingatlan_felvitele_oldal.php\">Ingatlan felvitele</a>
        <br>
        ";
    }

    echo "<br>";
} else {
    echo "
    <a href=\"bejelentkezes_oldal.php\">Bejelentkezés</a>
    <br>
    <a href=\"regisztracio_oldal.php\">Regisztráció</a>
    <br>
    <br>
    ";
}
?>