<?php
session_start();

if (!isset($_SESSION['azonosito']) || $_SESSION['szerepkor'] == 2) {
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

if (isset($_SESSION['sikeres_torles'])) {
    echo "Sikeres tulajdonos törlés.<br>";
    unset($_SESSION['sikeres_torles']);
}

if (isset($_SESSION['sikeres_tulajdonos_ingatlan_hozzarendeles'])) {
    echo "Sikeres tulajdonos hozzárendelés.<br>";
    unset($_SESSION['sikeres_tulajdonos_ingatlan_hozzarendeles']);
}

if (isset($_SESSION['hiba'])) {
    foreach ($_SESSION['hiba'] as $hiba) {
        echo $hiba . "<br>";
    }

    unset($_SESSION['hiba']);
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

    <form action="" method="post">
        <label for="ingatlan_azonosito">Ingatlan azonosító</label>
        <input type="text" name="ingatlan_azonosito" id="ingatlan_azonosito" required>
        <br>

        <input type="submit" value="Ingatlan azonosító alapján keresés" name="ingatlan_azonosito_alapjan">
    </form>

    <form action="" method="post">
        <input type="submit" value="Összes telek listázása" name="osszes">
    </form>


    <?php
    require_once "./php/sql_csatlakozas.php";

    $hibak = [];

    if (isset($_POST['osszes'])) {
        $osszes_query = $csatlakozas->query("SELECT * FROM ingatlan INNER JOIN ingatlan_cim ON ingatlan.ingatlan_azonosito = ingatlan_cim.ingatlan_azonosito;");

        if ($osszes_query->num_rows > 0) {
            foreach ($osszes_query as $ingatlan) {
                echo "
            <p>Ingatlan azonosító: " . $ingatlan['ingatlan_azonosito'] . "</p>
            <p>Jelleg: " . $ingatlan['jelleg'] . "</p>
            <p>Építés éve: " . $ingatlan['epites_eve'] . "</p>
            <p>Becsült érték: " . $ingatlan['becsult_ertek'] . "</p>
            <p>Helyrajzi szám: " . $ingatlan['helyrajzi_szam'] . "</p>
            <p>Irányítószám: " . $ingatlan['iranyitoszam'] . "</p>
            <p>Közterület: " . $ingatlan['kozterulet'] . "</p>
            <p>Házszám: " . $ingatlan['hazszam'] . "</p>

            <br>

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
            </form>
            <br>
            ";

                $tulajdonos_vizsgalat = "SELECT * FROM tulajdonos_ingatlan_birtoklas WHERE ingatlan_azonosito = " . $ingatlan['ingatlan_azonosito'] . ";";
                $tulajdonos_vizsgalat_query = $csatlakozas->query($tulajdonos_vizsgalat);

                if ($tulajdonos_vizsgalat_query->num_rows > 0) {
                    echo "<p>Tulajdonosok:</p>";

                    foreach ($tulajdonos_vizsgalat_query as $tulajdonos) {
                        echo "<p>Azonosító: " . $tulajdonos['azonosito'] . "</p>";
                        echo "<p>Tulajdonba kerülés: " . $tulajdonos['tulajdonba_kerules'] . "</p>";
                        echo "<p>Tulajdonhányad százalékban: " . $tulajdonos['tulajdonhanyad'] . "</p>";
                        echo "
                        <form action=\"./php/tulajdonos_ingatlan_torles.php\" method=\"post\">
                            <input type=\"hidden\" name=\"azonosito\" value=\"" . $tulajdonos['azonosito'] . "\">
                            <input type=\"submit\" value=\"Tulajdonos törlése\" name=\"tulajdonos_torles\">
                        </form>
                        <br>";
                    }
                } else {
                    echo "
                    <p>Az ingatlannak nincs tulajdonosa.</p>
                    <a href=\"tulajdonos_ingatlan_hozzarendeles.php?ingatlan_azonosito=" . $ingatlan['ingatlan_azonosito'] . "\">Tulajdonos hozzárendelése az ingatlanhoz</a>
                    <br>
                    ";
                }
            }
        }
    }

    if (isset($_POST['ingatlan_azonosito_alapjan'])) {
        $ingatlan_azonosito = $_POST['ingatlan_azonosito'];

        if (strlen($ingatlan_azonosito) > 255) {
            $hibak[] = "Túl hosszú a helyrajzi szám. Maximum 255 karakterből kell állnia.";
        }

        if (count($hibak) === 0) {
            $ingatlan_azonosito_alapjan_query = $csatlakozas->query("SELECT * FROM ingatlan INNER JOIN ingatlan_cim ON ingatlan.ingatlan_azonosito = ingatlan_cim.ingatlan_azonosito AND ingatlan.ingatlan_azonosito = $ingatlan_azonosito;");

            if ($ingatlan_azonosito_alapjan_query->num_rows > 0) {
                foreach ($ingatlan_azonosito_alapjan_query as $ingatlan) {
                    echo "
            <p>Ingatlan azonosító: " . $ingatlan['ingatlan_azonosito'] . "</p>
            <p>Jelleg: " . $ingatlan['jelleg'] . "</p>
            <p>Építés éve: " . $ingatlan['epites_eve'] . "</p>
            <p>Becsült érték: " . $ingatlan['becsult_ertek'] . "</p>
            <p>Helyrajzi szám: " . $ingatlan['helyrajzi_szam'] . "</p>
            <p>Irányítószám: " . $ingatlan['iranyitoszam'] . "</p>
            <p>Közterület: " . $ingatlan['kozterulet'] . "</p>
            <p>Házszám: " . $ingatlan['hazszam'] . "</p>

            <br>

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
            </form>
            <br>
            ";

                    $tulajdonos_vizsgalat = "SELECT * FROM tulajdonos_ingatlan_birtoklas WHERE ingatlan_azonosito = " . $ingatlan['ingatlan_azonosito'] . ";";
                    $tulajdonos_vizsgalat_query = $csatlakozas->query($tulajdonos_vizsgalat);

                    if ($tulajdonos_vizsgalat_query->num_rows > 0) {
                        echo "<p>Tulajdonosok:</p>";

                        foreach ($tulajdonos_vizsgalat_query as $tulajdonos) {
                            echo "<p>Azonosító: " . $tulajdonos['azonosito'] . "</p>";
                            echo "<p>Tulajdonba kerülés: " . $tulajdonos['tulajdonba_kerules'] . "</p>";
                            echo "<p>Tulajdonhányad százalékban: " . $tulajdonos['tulajdonhanyad'] . "</p>";
                            echo "
                        <form action=\"./php/tulajdonos_ingatlan_torles.php\" method=\"post\">
                            <input type=\"hidden\" name=\"azonosito\" value=\"" . $tulajdonos['azonosito'] . "\">
                            <input type=\"submit\" value=\"Tulajdonos törlése\" name=\"tulajdonos_torles\">
                        </form>
                        <br>";
                        }
                    } else {
                        echo "
                    <p>Az ingatlannak nincs tulajdonosa.</p>
                    <a href=\"tulajdonos_ingatlan_hozzarendeles.php?ingatlan_azonosito=" . $ingatlan['ingatlan_azonosito'] . "\">Tulajdonos hozzárendelése az ingatlanhoz</a>
                    <br>
                    ";
                    }
                }
            }
        } else {
            session_start();
            $_SESSION['hiba'] = $hibak;
            header("Location: ./ingatlan_listazasa_oldal.php");
        }
    }

    disconnect();
    ?>
</body>

</html>