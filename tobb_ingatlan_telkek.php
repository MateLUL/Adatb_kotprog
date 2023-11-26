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
    <title>Telkek és tulajdonosok, ahol egynél több ingatlan található - Ingatlan</title>
</head>

<body>
    <?php require "navbar.php"; ?>

    <?php
    require_once "./php/sql_csatlakozas.php";

    $query = $csatlakozas->query("SELECT ttb.helyrajzi_szam, felhasznalo.azonosito
    FROM tulajdonos_telek_birtoklas AS ttb
    INNER JOIN felhasznalo ON ttb.f_id = felhasznalo.id
    INNER JOIN telek AS t ON t.helyrajzi_szam = ttb.helyrajzi_szam
    INNER JOIN ingatlan AS i ON i.helyrajzi_szam = t.helyrajzi_szam
    GROUP BY ttb.helyrajzi_szam, felhasznalo.azonosito
    HAVING COUNT(i.helyrajzi_szam) > 1
    ORDER BY ttb.helyrajzi_szam ASC;");

    $elozo_helyrajzi_szam = "";

    if ($query->num_rows > 0) {
        echo "<h3>Telkek és tulajdonosok, ahol egynél több ingatlan található</h3>";
        foreach ($query as $telek) {
            if ($elozo_helyrajzi_szam != $telek['helyrajzi_szam']) {
                echo "<br><a href=\"./telkek_listazasa_oldal.php?helyrajzi_szam=" . $telek['helyrajzi_szam'] . "&helyrajzi_szam_alapjan=Helyrajzi+szám+alapján+keresés\">Telek és tulajdonos(ok) megtekintése</a><br>";
                echo "Helyrajzi szám: " . $telek['helyrajzi_szam'] . "<br>" . "Tulajdonos: " . $telek['azonosito'] .
                "<br>";
            } else {
                echo "Tulajdonos: " . $telek['azonosito'] . "<br>";
            }

            $elozo_helyrajzi_szam = $telek['helyrajzi_szam'];
        }
    } else {
        echo "Nincs ingatlan több tulajdonossal.";
    }

    disconnect();
    ?>
</body>

</html>