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

    <p>Tulajdonos módosítása a(z) <?php echo $_POST['helyrajzi_szam']; ?> helyrajzi számú telekhez</p>

    <form action="./php/tulajdonos_telek_modositas.php" method="post">
        <label for="azonosito">Tulajdonos azonosítója</label>
        <input type="text" name="azonosito" id="azonosito" value="<?php echo $_POST['azonosito']; ?>" required>
        <br>

        <label for="tulajdonhanyad">Tulajdonhányad (százalékban)</label>
        <input type="number" name="tulajdonhanyad" id="tulajdonhanyad" value="<?php echo $_POST['tulajdonhanyad']; ?>" required>%
        <br>

        <input type="hidden" name="helyrajzi_szam" value="<?php echo $_POST['helyrajzi_szam']; ?>">
        <input type="hidden" name="eredeti_f_id" value="<?php echo $_POST['f_id']; ?>">
        <input type="hidden" name="ttb_id" value="<?php echo $_POST['ttb_id']; ?>">


        <input type="submit" value="Módosítás" name="modositas">
    </form>
</body>

</html>