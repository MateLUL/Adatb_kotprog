<?php
session_start();

if (!isset($_SESSION['azonosito']) || $_SESSION['szerepkor'] == 2) {
    header("Location: index.php");
}

if (isset($_SESSION['sikeres_telek_felvitel'])) {
    echo "Sikeres telek felvitel.<br>";
    unset($_SESSION['sikeres_telek_felvitel']);
}

if (isset($_SESSION['hiba'])) {
    echo "Sikertelen telek felvitel.<br>";

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
    <title>Telkek felvitele - Ingatlan</title>
</head>

<body>
    <?php require "navbar.php"; ?>

    <form action="./php/telkek_felvitele.php" method="post">
        <label for="helyrajzi_szam">Helyrajzi szám</label>
        <input type="text" name="helyrajzi_szam" id="helyrajzi_szam" required>
        <br>

        <label for="meret">Méret</label>
        <input type="text" name="meret" , id="meret" required> m<sup>2</sup>
        <br>

        <label for="jelleg">Jelleg</label>
        <input type="text" name="jelleg" id="jelleg" required>
        <br>

        <label for="becsult_ertek">Becsült érték</label>
        <input type="number" name="becsult_ertek" id="becsult_ertek" required> Ft
        <br>

        <input type="submit" value="Felvitel" name="felvitel">
    </form>
</body>

</html>