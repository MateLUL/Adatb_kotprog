<?php
session_start();
if (isset($_SESSION['kijelentkezve'])) {
    echo "Sikeres kijelentkezés.";
    session_unset();
    session_destroy();
}

if (isset($_SESSION['belepett'])) {
    echo "Sikeres bejelentkezés.";
    unset($_SESSION['belepett']);
}
?>
<!DOCTYPE html>
<html lang="hu">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Főoldal - Ingatlan</title>
</head>

<body>
    <a href="bejelentkezes_oldal.php">Bejelentkezés</a>
    <br>
    <a href="regisztracio_oldal.php">Regisztráció</a>
</body>

</html>