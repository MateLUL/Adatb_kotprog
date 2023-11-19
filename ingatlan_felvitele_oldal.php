<?php
session_start();

if (!isset($_SESSION['azonosito']) || $_SESSION['szerepkor'] == 2) {
    header("Location: index.php");
}

if (isset($_SESSION['sikeres_ingatlan_felvitel'])) {
    echo "Sikeres ingatlan felvitel.<br>";
    unset($_SESSION['sikeres_telek_felvitel']);
}

if (isset($_SESSION['hiba'])) {
    echo "Sikertelen ingatlan felvitel.<br>";

    foreach ($_SESSION['hiba'] as $hiba) {
        echo $hiba . "<br>";
    }

    unset($_SESSION['hiba']);
}
?>

<!DOCTYPE html>
<html lang="hu">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Ingatlan felvitele - Ingatlan</title>
</head>

<body>
    <?php require "navbar.php"; ?>

    <form action="./php/ingatlan_felvitele.php" method="post">
        <label for="ingatlan_azonosito">Ingatlan azonosítója</label>
        <input type="text" name="ingatlan_azonosito" id="ingatlan_azonosito" required>
        <br>

        <label for="jelleg">Jelleg</label>
        <input type="text" name="jelleg" id="jelleg" required>
        <br>

        <label for="epites_eve">Építés éve</label>
        <input type="text" name="epites_eve" id="epites_eve" required>
        <br>

        <label for="becsult_ertek">Becsült érték</label>
        <input type="number" name="becsult_ertek" id="becsult_ertek" required> Ft
        <br>

        <label for="helyrajzi_szam">Helyrajzi szám</label>
        <input type="text" name="helyrajzi_szam" id="helyrajzi_szam" required>
        <br>

        <label for="iranyitoszam">Irányítószám</label>
        <input type="text" name="iranyitoszam" id="iranyitoszam" required>
        <br>

        <label for="epites_eve">Közterület</label>
        <input type="text" name="kozterulet" id="kozterulet" required>
        <br>

        <label for="epites_eve">Házszám</label>
        <input type="text" name="hazszam" id="hazszam" required>
        <br>

        <input type="submit" value="Felvitel" name="felvitel">
    </form>
</body>

</html>