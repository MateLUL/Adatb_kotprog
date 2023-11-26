<?php
session_start();

if (!isset($_SESSION['azonosito'])) {
    header("Location: index.php");
}

if (isset($_SESSION['sikeres_ingatlan_felvitel'])) {
    echo "Sikeres ingatlan felvitel.<br>";
    unset($_SESSION['sikeres_ingatlan_felvitel']);
}

if (isset($_SESSION['sikeres_ingatlan_modositas'])) {
    echo "Sikeres ingatlan módosítás.<br>";
    unset($_SESSION['sikeres_ingatlan_modositas']);
}

if (isset($_SESSION['sikeres_tulajdonos_ingatlan_hozzarendeles'])) {
    echo "Sikeres tulajdonos hozzárendelés.<br>";
    unset($_SESSION['sikeres_tulajdonos_ingatlan_hozzarendeles']);
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
    <title>Ingatlanok listázása - Ingatlan</title>
</head>

<body>
    <?php require "navbar.php"; ?>

    <form action="" method="get">
        <label for="ingatlan_azonosito">Ingatlan azonosító</label>
        <input type="text" name="ingatlan_azonosito" id="ingatlan_azonosito" required>
        <br>

        <input type="submit" value="Ingatlan azonosító alapján keresés" name="ingatlan_azonosito_alapjan">
    </form>

    <form action="" method="get">
        <input type="submit" value="Összes telek listázása" name="osszes">
    </form>


    <?php
    require_once "./php/sql_csatlakozas.php";

    if (isset($_GET['osszes']) || isset($_GET['ingatlan_azonosito_alapjan'])) {
        if (isset($_GET['osszes']) && $_SESSION['szerepkor'] == 1) {
            $query = $csatlakozas->query("SELECT * FROM ingatlan
            INNER JOIN ingatlan_cim ON ingatlan.ingatlan_azonosito = ingatlan_cim.ingatlan_azonosito;");
        }

        if (isset($_GET['ingatlan_azonosito_alapjan']) && $_SESSION['szerepkor'] == 1) {
            $ingatlan_azonosito = $_GET['ingatlan_azonosito'];
            $query = $csatlakozas->query("SELECT * FROM ingatlan
            INNER JOIN ingatlan_cim ON ingatlan.ingatlan_azonosito = ingatlan_cim.ingatlan_azonosito AND ingatlan.ingatlan_azonosito = '$ingatlan_azonosito';");
        }

        if (isset($_GET['osszes']) && $_SESSION['szerepkor'] == 2) {
            $query = $csatlakozas->query("SELECT * FROM ingatlan
            INNER JOIN ingatlan_cim ON ingatlan.ingatlan_azonosito = ingatlan_cim.ingatlan_azonosito
            INNER JOIN tulajdonos_ingatlan_birtoklas AS tib ON tib.ingatlan_azonosito = ingatlan.ingatlan_azonosito AND tib.azonosito = '" . $_SESSION['azonosito'] . "'");
        }


        if (isset($_GET['ingatlan_azonosito_alapjan']) && $_SESSION['szerepkor'] == 2) {
            $ingatlan_azonosito = $_GET['ingatlan_azonosito'];
            $query = $csatlakozas->query("SELECT * FROM ingatlan
            INNER JOIN ingatlan_cim ON ingatlan.ingatlan_azonosito = ingatlan_cim.ingatlan_azonosito AND ingatlan.ingatlan_azonosito = '$ingatlan_azonosito'
            INNER JOIN tulajdonos_ingatlan_birtoklas AS tib ON tib.ingatlan_azonosito = ingatlan.ingatlan_azonosito AND ingatlan.ingatlan_azonosito = '$ingatlan_azonosito' AND tib.azonosito = '" . $_SESSION['azonosito'] . "'");
        }


        if ($query->num_rows > 0) {
            foreach ($query as $ingatlan) {
                echo "
            <br>
            <br>
            <h3>Ingatlan:</h3>
            <p>Ingatlan azonosító: " . $ingatlan['ingatlan_azonosito'] . "</p>
            <p>Jelleg: " . $ingatlan['jelleg'] . "</p>
            <p>Építés éve: " . $ingatlan['epites_eve'] . "</p>
            <p>Becsült érték: " . $ingatlan['becsult_ertek'] . " Ft</p>
            <p>Helyrajzi szám: " . $ingatlan['helyrajzi_szam'] . "</p>
            <p>Irányítószám: " . $ingatlan['iranyitoszam'] . "</p>
            <p>Közterület: " . $ingatlan['kozterulet'] . "</p>
            <p>Házszám: " . $ingatlan['hazszam'] . "</p>

            <br>";

            if ($_SESSION['szerepkor'] == 1) {
                echo "
                <form action=\"./ingatlan_modositasa_oldal.php\" method=\"post\">
                    <input type=\"hidden\" name=\"ingatlan_azonosito\" value=\"" . $ingatlan['ingatlan_azonosito'] . "\">
                    <input type=\"hidden\" name=\"jelleg\" value=\"" . $ingatlan['jelleg'] . "\">
                    <input type=\"hidden\" name=\"epites_eve\" value=\"" . $ingatlan['epites_eve'] . "\">
                    <input type=\"hidden\" name=\"becsult_ertek\" value=\"" . $ingatlan['becsult_ertek'] . "\">
                    <input type=\"hidden\" name=\"helyrajzi_szam\" value=\"" . $ingatlan['helyrajzi_szam'] . "\">
                    <input type=\"hidden\" name=\"iranyitoszam\" value=\"" . $ingatlan['iranyitoszam'] . "\">
                    <input type=\"hidden\" name=\"kozterulet\" value=\"" . $ingatlan['kozterulet'] . "\">
                    <input type=\"hidden\" name=\"hazszam\" value=\"" . $ingatlan['hazszam'] . "\">

                    <input type=\"submit\" value=\"Ingatlan módosítása\" name=\"ingatlan_modositas\">
                </form>";
            }

                $tulajdonos_vizsgalat = "SELECT * FROM tulajdonos_ingatlan_birtoklas
                INNER JOIN felhasznalo ON felhasznalo.id = tulajdonos_ingatlan_birtoklas.f_id
                WHERE ingatlan_azonosito = \"" . $ingatlan['ingatlan_azonosito'] . "\";";
                $tulajdonos_vizsgalat_query = $csatlakozas->query($tulajdonos_vizsgalat);

                if ($tulajdonos_vizsgalat_query->num_rows > 0) {
                    echo "<p><i>Tulajdonosok:</i></p>";

                    if ($_SESSION['szerepkor'] == 1) {
                        echo "<a href=\"tulajdonos_ingatlan_hozzarendeles_oldal.php?ingatlan_azonosito=" . $ingatlan['ingatlan_azonosito'] . "\">Új tulajdonos hozzárendelése az ingatlanhoz</a>";
                    }

                    foreach ($tulajdonos_vizsgalat_query as $tulajdonos) {
                        echo "<p>Azonosító: " . $tulajdonos['azonosito'] . "</p>";
                        echo "<p>Tulajdonba kerülés: " . $tulajdonos['tulajdonba_kerules'] . "</p>";
                        echo "<p>Tulajdonhányad százalékban: " . $tulajdonos['tulajdonhanyad'] . "%</p>";

                        if ($_SESSION['szerepkor'] == 1) {
                            echo "
                            <form action=\"./php/tulajdonos_ingatlan_torles.php\" method=\"post\">
                                <input type=\"hidden\" name=\"f_id\" value=\"" . $tulajdonos['f_id'] . "\">
                                <input type=\"submit\" value=\"Tulajdonos törlése\" name=\"tulajdonos_torles\">
                            </form>

                            <form action=\"./tulajdonos_ingatlan_modositas_oldal.php\" method=\"post\">
                                <input type=\"hidden\" name=\"ingatlan_azonosito\" value=\"" . $ingatlan['ingatlan_azonosito'] . "\">
                                <input type=\"hidden\" name=\"azonosito\" value=\"" . $tulajdonos['azonosito'] . "\">
                                <input type=\"hidden\" name=\"tulajdonhanyad\" value=\"" . $tulajdonos['tulajdonhanyad'] . "\">
                                <input type=\"hidden\" name=\"tib_id\" value=\"" . $tulajdonos['tib_id'] . "\">
                                <input type=\"hidden\" name=\"f_id\" value=\"" . $tulajdonos['f_id'] . "\">

                                <input type=\"submit\" value=\"Tulajdonos módosítása\" name=\"modositas\">
                            </form>
                            <br>";
                        }
                    }
                } else {
                    echo "
                    <p>Az ingatlannak nincs tulajdonosa.</p>
                    <a href=\"tulajdonos_ingatlan_hozzarendeles_oldal.php?ingatlan_azonosito=" . $ingatlan['ingatlan_azonosito'] . "\">Tulajdonos hozzárendelése az ingatlanhoz</a>
                    ";
                }
            }
        } else {
            echo "Nincs megjeleníthető ingatlan.";
        }
    }


    disconnect();
    ?>
</body>

</html>