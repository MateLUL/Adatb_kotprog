<?php
session_start();

if (!isset($_SESSION['azonosito']) || $_SESSION['szerepkor'] == 2) {
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

    <form action="" method="post">
        <label for="helyrajzi_szam">Helyrajzi szám</label>
        <input type="text" name="helyrajzi_szam" id="helyrajzi_szam" required>
        <br>

        <input type="submit" value="Helyrajzi szám alapján keresés" name="helyrajzi_szam_alapjan">
    </form>

    <form action="" method="post">
        <input type="submit" value="Összes telek listázása" name="osszes">
    </form>


    <?php
    require_once "./php/sql_csatlakozas.php";

    $hibak = [];

    if (isset($_POST['osszes'])) {
        $osszes_query = $csatlakozas->query("SELECT * FROM telek;");

        if ($osszes_query->num_rows > 0) {
            foreach ($osszes_query as $telek) {
                echo "
            <p>Helyrajzi szám: " . $telek['helyrajzi_szam'] . "</p>
            <p>Méret: " . $telek['meret'] . "m<sup>2</sup></p>
            <p>Jelleg: " . $telek['jelleg'] . "</p>
            <p>Becsült érték: " . $telek['becsult_ertek'] . " Ft</p>
            <br>
            ";

                $tulajdonos_vizsgalat = "SELECT * FROM tulajdonos_telek_birtoklas WHERE helyrajzi_szam = " . $telek['helyrajzi_szam'] . ";";
                $tulajdonos_vizsgalat_query = $csatlakozas->query($tulajdonos_vizsgalat);

                if ($tulajdonos_vizsgalat_query->num_rows > 0) {
                    echo "<p>Tulajdonosok:</p>
                    <a href=\"tulajdonos_telek_hozzarendeles.php?helyrajzi_szam=" . $telek['helyrajzi_szam'] . "\">Új tulajdonos hozzárendelése a telekhez</a>
                    ";

                    foreach ($tulajdonos_vizsgalat_query as $tulajdonos) {
                        echo "<p>Azonosító: " . $tulajdonos['azonosito'] . "</p>";
                        echo "<p>Tulajdonba kerülés: " . $tulajdonos['tulajdonba_kerules'] . "</p>";
                        echo "<p>Tulajdonhányad százalékban: " . $tulajdonos['tulajdonhanyad'] . "%</p>";
                        echo "<form action=\"./php/tulajdonos_telek_torles.php\" method=\"post\">
                        <input type=\"submit\" value=\"Tulajdonos törlése\" name=\"tulajdonos_torles\">
                        <input type=\"hidden\" name=\"azonosito\" value=\"" . $tulajdonos['azonosito'] . "\">
                        </form>

                        <form action=\"./tulajdonos_telek_modositas.php\" method=\"post\">
                            <input type=\"hidden\" name=\"helyrajzi_szam\" value=\"" . $telek['helyrajzi_szam'] . "\">
                            <input type=\"hidden\" name=\"azonosito\" value=\"" . $tulajdonos['azonosito'] . "\">
                            <input type=\"hidden\" name=\"tulajdonhanyad\" value=\"" . $tulajdonos['tulajdonhanyad'] . "\">

                            <input type=\"submit\" value=\"Tulajdonos módosítása\" name=\"modositas\">
                        </form>
                        <br>";
                    }
                } else {
                    echo "
                    <p>A teleknek nincs tulajdonosa.</p>
                    <a href=\"tulajdonos_telek_hozzarendeles.php?helyrajzi_szam=" . $telek['helyrajzi_szam'] . "\">Tulajdonos hozzárendelése a telekhez</a>
                    <br>
                    ";
                }
            }
        }
    }

    if (isset($_POST['helyrajzi_szam_alapjan'])) {
        $helyrajzi_szam = $_POST['helyrajzi_szam'];

        if (strlen($helyrajzi_szam) > 255) {
            $hibak[] = "Túl hosszú a helyrajzi szám. Maximum 255 karakterből kell állnia.";
        }

        if (count($hibak) === 0) {
            $helyrajzi_szam_alapjan_query = $csatlakozas->query("SELECT * FROM telek WHERE helyrajzi_szam=" . $helyrajzi_szam . ";");

            if ($helyrajzi_szam_alapjan_query->num_rows > 0) {
                foreach ($helyrajzi_szam_alapjan_query as $telek) {
                    echo "
            <p>Helyrajzi szám: " . $telek['helyrajzi_szam'] . "</p>
            <p>Méret: " . $telek['meret'] . "m<sup>2</sup></p>
            <p>Jelleg: " . $telek['jelleg'] . "</p>
            <p>Becsült érték: " . $telek['becsult_ertek'] . " Ft</p>
            <br>
            ";

                    $tulajdonos_vizsgalat = "SELECT * FROM tulajdonos_telek_birtoklas WHERE helyrajzi_szam = " . $telek['helyrajzi_szam'] . ";";
                    $tulajdonos_vizsgalat_query = $csatlakozas->query($tulajdonos_vizsgalat);

                    if ($tulajdonos_vizsgalat_query->num_rows > 0) {
                        echo "<p>Tulajdonosok:</p>
                        <a href=\"tulajdonos_telek_hozzarendeles.php?helyrajzi_szam=" . $telek['helyrajzi_szam'] . "\">Új tulajdonos hozzárendelése a telekhez</a>
                        ";

                        foreach ($tulajdonos_vizsgalat_query as $tulajdonos) {
                            echo "<p>Azonosító: " . $tulajdonos['azonosito'] . "</p>";
                            echo "<p>Tulajdonba kerülés: " . $tulajdonos['tulajdonba_kerules'] . "</p>";
                            echo "<p>Tulajdonhányad százalékban: " . $tulajdonos['tulajdonhanyad'] . "%</p>";
                            echo "<form action=\"./php/tulajdonos_telek_torles.php\" method=\"post\">
                            <input type=\"submit\" value=\"Tulajdonos törlése\" name=\"tulajdonos_torles\">
                            <input type=\"hidden\" name=\"azonosito\" value=\"" . $tulajdonos['azonosito'] . "\">
                            </form>

                            <form action=\"./tulajdonos_telek_modositas.php\" method=\"post\">
                                <input type=\"hidden\" name=\"helyrajzi_szam\" value=\"" . $telek['helyrajzi_szam'] . "\">
                                <input type=\"hidden\" name=\"azonosito\" value=\"" . $tulajdonos['azonosito'] . "\">
                                <input type=\"hidden\" name=\"tulajdonhanyad\" value=\"" . $tulajdonos['tulajdonhanyad'] . "\">

                                <input type=\"submit\" value=\"Tulajdonos módosítása\" name=\"modositas\">
                            </form>
                            <br>";
                        }
                    } else {
                        echo "
                        <p>A teleknek nincs tulajdonosa.</p>
                        <a href=\"tulajdonos_telek_hozzarendeles.php?helyrajzi_szam=" . $telek['helyrajzi_szam'] . "\">Tulajdonos hozzárendelése a telekhez</a>
                        <br>
                        ";
                    }
                }
            } else {
                echo "Nincs ilyen helyrajzi számú telek.";
            }
        } else {
            session_start();
            $_SESSION['hibak'] = $hibak;
            header("Location: ./telkek_listazasa_oldal.php");
        }
    }

    disconnect();
    ?>
</body>

</html>