<?php
session_start();

if (!isset($_SESSION['azonosito'])) {
    header("Location: index.php");
}

if (isset($_SESSION['sikeres_telek_felvitel'])) {
    echo "Sikeres telek felvitel.<br>";
    unset($_SESSION['sikeres_telek_felvitel']);
}

if (isset($_SESSION['sikeres_tulajdonos_telek_hozzarendeles'])) {
    echo "Sikeres tulajdonos hozzárendelés.<br>";
    unset($_SESSION['sikeres_tulajdonos_telek_hozzarendeles']);
}

if (isset($_SESSION['sikeres_tulajdonos_modositas'])) {
    echo "Sikeres tulajdonos módosítás.<br>";
    unset($_SESSION['sikeres_tulajdonos_modositas']);
}

if (isset($_SESSION['sikeres_torles'])) {
    echo "Sikeres tulajdonos törlés.<br>";
    unset($_SESSION['sikeres_torles']);
}

if (isset($_SESSION['hibak'])) {
    foreach ($_SESSION['hibak'] as $hiba) {
        echo $hiba . "<br>";
    }

    unset($_SESSION['hibak']);
}
?>

<!DOCTYPE html>
<html lang="hu">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Telkek listázása - Ingatlan</title>
</head>

<body>
    <?php require "navbar.php"; ?>

    <form action="" method="get">
        <label for="helyrajzi_szam">Helyrajzi szám</label>
        <input type="text" name="helyrajzi_szam" id="helyrajzi_szam" required>
        <br>

        <input type="submit" value="Helyrajzi szám alapján keresés" name="helyrajzi_szam_alapjan">
    </form>

    <form action="" method="get">
        <input type="submit" value="Összes telek listázása" name="osszes">
    </form>


    <?php
    require_once "./php/sql_csatlakozas.php";

    if (isset($_GET['osszes']) || isset($_GET['helyrajzi_szam'])) {
        if (isset($_GET['osszes']) && $_SESSION['szerepkor'] == 1) {
            $query = $csatlakozas->query("SELECT * FROM telek;");
        }
        if (isset($_GET['helyrajzi_szam']) && $_SESSION['szerepkor'] == 1) {
            $helyrajzi_szam = $_GET['helyrajzi_szam'];
            $query = $csatlakozas->query("SELECT * FROM telek WHERE helyrajzi_szam=\"" . $helyrajzi_szam . "\";");
        }
        if (isset($_GET['osszes']) && $_SESSION['szerepkor'] == 2) {
            $query = $csatlakozas->query(
                "SELECT * FROM telek
            INNER JOIN tulajdonos_telek_birtoklas AS ttb ON telek.helyrajzi_szam = ttb.helyrajzi_szam AND ttb.azonosito = \"" . $_SESSION['azonosito'] . "\"");
        }
        if (isset($_GET['helyrajzi_szam']) && $_SESSION['szerepkor'] == 2) {
            $helyrajzi_szam = $_GET['helyrajzi_szam'];
            $query = $csatlakozas->query("SELECT * FROM telek
            INNER JOIN tulajdonos_telek_birtoklas AS ttb ON telek.helyrajzi_szam = ttb.helyrajzi_szam AND ttb.azonosito = \"" . $_SESSION['azonosito'] . "\" AND ttb.helyrajzi_szam = \"$helyrajzi_szam\";");
        }

        if ($query->num_rows > 0) {
            foreach ($query as $telek) {
                echo "
        <br>
        <br>
        <h3>Telek:</h3>
        <p>Helyrajzi szám: " . $telek['helyrajzi_szam'] . "</p>
        <p>Méret: " . $telek['meret'] . "m<sup>2</sup></p>
        <p>Jelleg: " . $telek['jelleg'] . "</p>
        <p>Becsült érték: " . $telek['becsult_ertek'] . " Ft</p>
        ";

                $tulajdonos_vizsgalat = "SELECT * FROM tulajdonos_telek_birtoklas
                INNER JOIN felhasznalo ON felhasznalo.id = tulajdonos_telek_birtoklas.f_id
                WHERE helyrajzi_szam = \"" . $telek['helyrajzi_szam'] . "\";";
                $tulajdonos_vizsgalat_query = $csatlakozas->query($tulajdonos_vizsgalat);

                if ($tulajdonos_vizsgalat_query->num_rows > 0) {
                    echo "<br><p><i>Tulajdonosok:</i></p>";

                    if ($_SESSION['szerepkor'] == 1) {
                        echo "<a href=\"tulajdonos_telek_hozzarendeles.php?helyrajzi_szam=" . $telek['helyrajzi_szam'] . "\">Új tulajdonos hozzárendelése a telekhez</a>";
                    }

                    foreach ($tulajdonos_vizsgalat_query as $tulajdonos) {
                        echo "<p>Azonosító: " . $tulajdonos['azonosito'] . "</p>";
                        echo "<p>Tulajdonba kerülés: " . $tulajdonos['tulajdonba_kerules'] . "</p>";
                        echo "<p>Tulajdonhányad százalékban: " . $tulajdonos['tulajdonhanyad'] . "%</p>";

                        if ($_SESSION['szerepkor'] == 1) {
                            echo "<form action=\"./php/tulajdonos_telek_torles.php\" method=\"post\">
                            <input type=\"submit\" value=\"Tulajdonos törlése\" name=\"tulajdonos_torles\">
                            <input type=\"hidden\" name=\"azonosito\" value=\"" . $tulajdonos['azonosito'] . "\">
                            </form>

                            <form action=\"./tulajdonos_telek_modositas_oldal.php\" method=\"post\">
                                <input type=\"hidden\" name=\"helyrajzi_szam\" value=\"" . $telek['helyrajzi_szam'] . "\">
                                <input type=\"hidden\" name=\"azonosito\" value=\"" . $tulajdonos['azonosito'] . "\">
                                <input type=\"hidden\" name=\"tulajdonhanyad\" value=\"" . $tulajdonos['tulajdonhanyad'] . "\">
                                <input type=\"hidden\" name=\"f_id\" value=\"" . $tulajdonos['f_id'] . "\">
                                <input type=\"hidden\" name=\"ttb_id\" value=\"" . $tulajdonos['ttb_id'] . "\">

                                <input type=\"submit\" value=\"Tulajdonos módosítása\" name=\"modositas\">
                            </form>
                            ";
                        }
                    }
                } else {
                    echo "
                <p>A teleknek nincs tulajdonosa.</p>
                <a href=\"tulajdonos_telek_hozzarendeles.php?helyrajzi_szam=" . $telek['helyrajzi_szam'] . "\">Tulajdonos hozzárendelése a telekhez</a>
                ";
                }
            }
        } else {
            echo "Nincs megjeleníthető telek.";
        }
    }


    disconnect();
    ?>
</body>

</html>