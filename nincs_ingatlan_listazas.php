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
    <title>Telkek listázása, ahol nincs ingatlan - Ingatlan</title>
</head>

<body>
    <?php require "navbar.php"; ?>

    <?php
    require_once "./php/sql_csatlakozas.php";

    $query = $csatlakozas->query("SELECT t.helyrajzi_szam FROM telek AS t
    INNER JOIN ingatlan i ON t.helyrajzi_szam != i.helyrajzi_szam;");

    if ($query->num_rows > 0) {
        echo "<h3>Telkek helyrajzi száma, ahol nincs ingatlan</h3>";
        foreach ($query as $telek) {
            echo $telek['helyrajzi_szam'] . "
            <br>
            <a href=\"./telkek_listazasa_oldal.php?helyrajzi_szam=" . $telek['helyrajzi_szam'] . "&helyrajzi_szam_alapjan=Helyrajzi+szám+alapján+keresés\">Telek megtekintése</a>
            <br>
            <br>";
        }
    } else {
        echo "Nincs olyan telek, ahol ne lenne ingatlan.";
    }

    disconnect();
    ?>
</body>

</html>