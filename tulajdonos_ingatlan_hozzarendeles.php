<?php
session_start();

if (!isset($_SESSION['azonosito']) || $_SESSION['szerepkor'] == 2) {
    header("Location: index.php");
}

if (!isset($_GET['ingatlan_azonosito'])) {
    header("Location: index.php");
}

if (isset($_SESSION['sikeres_telek_felvitel'])) {
    echo "Sikeres telek felvitel.<br>";
    unset($_SESSION['sikeres_telek_felvitel']);
}
?>

<!DOCTYPE html>
<html lang="hu">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Tulajdonos hozzárendelése ingatlanhoz - Ingatlan</title>
</head>

<body>
    <?php require "navbar.php"; ?>

    <p>Tulajdonos hozzárendelése a(z) <?php echo $_GET['ingatlan_azonosito']; ?> azonosítójú ingatlanhoz</p>

    <form action="./php/tulajdonos_ingatlan_hozzarendeles.php" method="post">
        <label for="azonosito">Tulajdonos azonosítója</label>
        <input type="text" name="azonosito" id="azonosito" required>
        <br>

        <label for="tulajdonhanyad">Tulajdonhányad (százalékban)</label>
        <input type="number" name="tulajdonhanyad" id="tulajdonhanyad" required>%
        <br>

        <input type="hidden" name="ingatlan_azonosito" value="<?php echo $_GET['ingatlan_azonosito']; ?>">

        <input type="submit" value="Hozzárendelés" name="hozzarendeles">
    </form>
</body>

</html>