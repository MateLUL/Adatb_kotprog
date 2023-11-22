<?php
session_start();

if (!isset($_SESSION['azonosito']) || $_SESSION['szerepkor'] == 2) {
    header("Location: index.php");
}

if (isset($_SESSION['sikeres_tulajdonos_modositas'])) {
    echo "Sikeres tulajdonos módosítás.<br>";
    unset($_SESSION['sikeres_tulajdonos_modositas']);
}
?>

<!DOCTYPE html>
<html lang="hu">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Tulajdonos módosítása - Ingatlan</title>
</head>

<body>
    <?php require "navbar.php"; ?>

    <p>Tulajdonos módosítása a(z) <?php echo $_POST['ingatlan_azonosito']; ?> azonosítójú ingatlanhoz</p>

    <form action="./php/tulajdonos_ingatlan_modositas.php" method="post">
        <label for="azonosito">Tulajdonos azonosítója</label>
        <input type="text" name="azonosito" id="azonosito" value="<?php echo $_POST['azonosito']; ?>" required>
        <br>

        <label for="tulajdonhanyad">Tulajdonhányad (százalékban)</label>
        <input type="number" name="tulajdonhanyad" id="tulajdonhanyad" value="<?php echo $_POST['tulajdonhanyad']; ?>" required>%
        <br>

        <input type="hidden" name="ingatlan_azonosito" value="<?php echo $_POST['ingatlan_azonosito']; ?>">

        <input type="submit" value="Módosítás" name="modositas">
    </form>
</body>

</html>