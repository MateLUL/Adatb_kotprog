<?php
session_start();
if (isset($_SESSION['kijelentkezve'])) {
    echo "Sikeres kijelentkezés.<br>";
    session_unset();
    session_destroy();
}

if (isset($_SESSION['belepett'])) {
    echo "Sikeres bejelentkezés.<br>";
    unset($_SESSION['belepett']);
}

if (isset($_SESSION['sikeres_torles'])) {
    echo "Fiók sikeresen törölve.<br>";
    session_unset();
    session_destroy();
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
    <?php require "navbar.php"; ?>
</body>

</html>