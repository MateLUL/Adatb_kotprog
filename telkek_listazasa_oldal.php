<?php
session_start();

if (!isset($_SESSION['azonosito']) || $_SESSION['szerepkor'] == 2) {
    header("Location: index.php");
}

if (isset($_SESSION['sikeres_telek_felvitel'])) {
    echo "Sikeres telek felvitel.<br>";
    unset($_SESSION['sikeres_telek_felvitel']);
}
?>

<?php
require "./php/sql_csatlakozas.php";

$helyrajzi_szam_alapjan = $_POST['helyrajzi_szam_alapjan'];
$osszes = $_POST['osszes'];
$helyrajzi_szam = $_POST['helyrajzi_szam'];
$hibak = [];

if (isset($osszes) || isset($helyrajzi_szam_alapjan)) {
    if (strlen($helyrajzi_szam) > 255) {
        $hibak[] = "Túl hosszú a helyrajzi szám. Maximum 255 karakterből kell állnia.";
    }

    if (count($hibak) === 0) {
        if (isset($osszes)) {
            $osszes_query = $csatlakozas->query("SELECT * FROM telek;");

            if ($osszes_query->num_rows > 0) {
                foreach ($osszes_query as $telek) {
                    echo "
                    <p>Helyrajzi szám: ". $telek['helyrajzi_szam'] . "</p>
                    <p>Méret: " . $telek['meret'] . "</p>
                    <p>Jelleg: " . $telek['jelleg'] . "</p>
                    <p>Becsült érték: " . $telek['becsult_ertek'] . "</p>
                    <br>
                    ";

                    $tulajdonos_vizsgalat = "SELECT * FROM tulajdonos_telek_birtoklas WHERE helyrajzi_szam = " . $telek['helyrajzi_szam'] . ";";
                    $tulajdonos_vizsgalat_query = $csatlakozas->query($tulajdonos_vizsgalat);

                    if ($tulajdonos_vizsgalat_query->num_rows > 0) {
                        echo "<p>Tulajdonosok:</p>";

                        foreach($tulajdonos_vizsgalat_query as $tulajdonos) {
                            echo "<p>Azonosító: " . $tulajdonos['azonosito'] . "</p>";
                            echo "<p>Tulajdonba kerülés: " . $tulajdonos['tulajdonba_kerules'] . "</p>";
                            echo "<p>Tulajdonhányad százalékban: " . $tulajdonos['tulajdonhanyad'] . "</p>";
                        }
                    } else {
                        echo "
                        <p>A teleknek nincs tulajdonosa.</p>
                        <a href=\"tulajdonos_telek_hozzarendeles.php\">Tulajdonos hozzárendelése a telekhez</a>
                        <br>
                        ";
                    }
                }
            }
        }


        if ($csatlakozas->query($telek) === TRUE) {
            session_start();
            $_SESSION['sikeres_telek_felvitel'] = "sikeres_telek_felvitel";
            header("Location: ./../telkek_listazasa_oldal.php");
        } else {
            echo "SQL hiba.";
        }
    } else {
        session_start();
        $_SESSION['hiba'] = $hibak;
        header("Location: ./../telkek_listazasa_oldal.php");
    }
}

disconnect();
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

    <form action="" method="post">
        <label for="helyrajzi_szam">Helyrajzi szám</label>
        <input type="text" name="helyrajzi_szam" id="helyrajzi_szam">
        <br>

        <input type="submit" value="Helyrajzi szám alapján keresés" name="helyrajzi_szam_alapjan">
        <br>
        <input type="submit" value="Összes telek listázása" name="osszes">
    </form>
</body>

</html>