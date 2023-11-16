<?php
session_start();
if (isset($_SESSION['hiba'])) {
    echo "Sikertelen regisztráció<br>";

    foreach ($_SESSION['hiba'] as $hiba) {
        echo $hiba . "<br>";
    }
}

session_unset();
session_destroy();
?>



<!DOCTYPE html>
<html lang="hu">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Regisztráció - Ingatlan</title>
</head>

<body>
    <div>
        <form action="./php/regisztracio.php" method="post">
            <label for="azonosito">Azonosító</label>
            <input type="text" name="azonosito" id="azonosito" required>
            <br>

            <label for="jelszo">Jelszó</label>
            <input type="password" name="jelszo" id="jelszo" required>
            <br>

            <label for="jelszo_ism">Jelszó ismételve</label>
            <input type="password" name="jelszo_ism" id="jelszo_ism" required>
            <br>

            <label for="keresztnev">Keresztnév</label>
            <input type="text" name="keresztnev" id="keresztnev" required>
            <br>

            <label for="vezeteknev">Vezetéknév</label>
            <input type="text" name="vezeteknev" id="vezeteknev" required>
            <br>

            <label for="adoszam">Adószám</label>
            <input type="text" name="adoszam" id="adoszam" required>
            <br>

            <label for="iranyitoszam">Irányítószám</label>
            <input type="text" name="iranyitoszam" id="iranyitoszam" required>
            <br>

            <label for="varos">Város</label>
            <input type="text" name="varos" id="varos" required>
            <br>

            <label for="utca">Utca</label>
            <input type="text" name="utca" id="utca" required>
            <br>

            <label for="hazszam">Házszám</label>
            <input type="text" name="hazszam" id="hazszam" required>
            <br>

            <label for="telefonszam">Telefonszám</label>
            <input type="tel" name="telefonszam" id="telefonszam" required>
            <br>

            <label for="szuldatum">Születési dátum</label>
            <input type="date" name="szuldatum" id="szuldatum" required>
            <br>

            <label for="anyja_keresztnev">Anyja keresztneve</label>
            <input type="text" name="anyja_keresztnev" id="anyja_keresztnev" required>
            <br>

            <label for="anyja_vezeteknev">Anyja vezetékneve</label>
            <input type="text" name="anyja_vezeteknev" id="anyja_vezeteknev" required>
            <br>

            <input type="submit" value="Regisztráció">
        </form>
    </div>
</body>

</html>