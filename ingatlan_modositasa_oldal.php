<?php
session_start();

if (!isset($_SESSION['azonosito']) || $_SESSION['szerepkor'] == 2) {
    header("Location: index.php");
}
?>

<!DOCTYPE html>
<html lang="hu">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Ingatlan módosítása - Ingatlan</title>
</head>

<body>
    <?php require "navbar.php"; ?>

    <p>Adatok módosítása a(z) <?php echo $_POST['ingatlan_azonosito']; ?> azonosítójú ingatlanhoz</p>

    <form action="./php/ingatlan_modositasa.php" method="post">
        <label for="ingatlan_azonosito">Ingatlan azonosítója</label>
        <input type="text" name="ingatlan_azonosito" id="ingatlan_azonosito" required value="<?php echo $_POST['ingatlan_azonosito']; ?>">
        <br>

        <label for="jelleg">Jelleg</label>
        <input type="text" name="jelleg" id="jelleg" required value="<?php echo $_POST['jelleg']; ?>">
        <br>

        <label for="epites_eve">Építés éve</label>
        <input type="text" name="epites_eve" id="epites_eve" required value="<?php echo $_POST['epites_eve']; ?>">
        <br>

        <label for="becsult_ertek">Becsült érték</label>
        <input type="number" name="becsult_ertek" id="becsult_ertek" required value="<?php echo $_POST['becsult_ertek']; ?>"> Ft
        <br>

        <label for="helyrajzi_szam">Helyrajzi szám</label>
        <input type="text" name="helyrajzi_szam" id="helyrajzi_szam" required value="<?php echo $_POST['helyrajzi_szam']; ?>">
        <br>

        <label for="iranyitoszam">Irányítószám</label>
        <input type="text" name="iranyitoszam" id="iranyitoszam" required value="<?php echo $_POST['iranyitoszam']; ?>">
        <br>

        <label for="epites_eve">Közterület</label>
        <input type="text" name="kozterulet" id="kozterulet" required value="<?php echo $_POST['kozterulet']; ?>">
        <br>

        <label for="epites_eve">Házszám</label>
        <input type="text" name="hazszam" id="hazszam" required value="<?php echo $_POST['hazszam']; ?>">
        <br>

        <input type="submit" value="Módosítás" name="modositas">
    </form>
</body>

</html>