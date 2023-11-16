<?php
session_start();
if (isset($_SESSION['sikeres_regisztracio'])) {
    echo "Sikeres regisztráció!";
    session_unset();
    session_destroy();
}

if (isset($_SESSION['login_hiba'])) {
    echo "Hibás felhasználónév vagy jelszó.";
    session_unset();
    session_destroy();
}

if (isset($_SESSION['azonosito'])) {
    header("Location: index.php");
}
?>

<!DOCTYPE html>
<html lang="hu">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Bejelentkezés - Ingatlan</title>
</head>

<body>

    <div>
        <form action="./php/bejelentkezes.php" method="post">
            <label for="azonosito">Azonosító</label>
            <input type="text" name="azonosito" id="azonosito">
            <br>

            <label for="jelszo">Jelszó</label>
            <input type="password" name="jelszo" id="jelszo">
            <br>

            <input type="submit" value="Bejelentkezés">
        </form>
    </div>
</body>

</html>