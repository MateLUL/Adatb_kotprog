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
    <title>Telkek felvitele - Ingatlan</title>
</head>

<body>
    <?php require "navbar.php"; ?>
</body>
</html>