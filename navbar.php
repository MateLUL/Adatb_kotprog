<?php

if (isset($_SESSION['azonosito']) && isset($_SESSION['szerepkor'])) {
    echo "
    <form action=\"./php/kijelentkezes.php\" method=\"post\">
    <input type=\"submit\" name=\"kijelentkezes\" value=\"Kijelentkezés\">
    </form>
    ";
    if ($_SESSION['szerepkor'] == 1) {
        // Linkek
    } else {
        // Linkek
    }
} else {
    echo "
    <a href=\"bejelentkezes_oldal.php\">Bejelentkezés</a>
    <br>
    <a href=\"regisztracio_oldal.php\">Regisztráció</a>
    ";
}
?>