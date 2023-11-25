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
    <title>Ingatlanok listázása, ahol több tulajdonos van - Ingatlan</title>
</head>

<body>
    <?php require "navbar.php"; ?>

    <?php
    require_once "./php/sql_csatlakozas.php";

    $query = $csatlakozas->query("SELECT tib.ingatlan_azonosito FROM tulajdonos_ingatlan_birtoklas AS tib
        INNER JOIN ingatlan i ON i.ingatlan_azonosito = tib.ingatlan_azonosito
        GROUP BY tib.ingatlan_azonosito
        HAVING COUNT(tib.ingatlan_azonosito) > 1;");

    if ($query->num_rows > 0) {
        echo "<h3>Ingatlanok azonosítói, ahol több tulajdonos van</h3>";
        foreach ($query as $ingatlan) {
            echo $ingatlan['ingatlan_azonosito'] . "
            <br>
            <a href=\"./ingatlan_listazasa_oldal.php?ingatlan_azonosito=" . $ingatlan['ingatlan_azonosito'] . "&ingatlan_azonosito_alapjan=Ingatlan+azonosító+alapján+keresés\">Ingatlan megtekintése</a>
            <br>
            <br>";
        }
    } else {
        echo "Nincs ingatlan több tulajdonossal.";
    }

    disconnect();
    ?>
</body>

</html>