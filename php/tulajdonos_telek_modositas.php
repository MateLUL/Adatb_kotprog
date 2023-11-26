<?php
require "sql_csatlakozas.php";

$helyrajzi_szam = $_POST['helyrajzi_szam'];
$azonosito = $_POST['azonosito'];
$tulajdonhanyad = $_POST['tulajdonhanyad'];
$modositas = $_POST['modositas'];
$eredeti_azonosito = $_POST['eredeti_azonosito'];

$hibak = [];
if (isset($modositas)) {
    if (strlen($azonosito) > 255) {
        $hibak[] = "Túl hosszú az azonosító. Maximum 255 karakterből kell állnia.";
    }
    if (strlen($tulajdonhanyad) > 255) {
        $hibak[] = "Túl hosszú a tulajdonhányad. Maximum 255 karakterből kell állnia.";
    }

    $azonosito_elerheto = "SELECT azonosito FROM felhasznalo WHERE azonosito='$azonosito'";
    $azonosito_elerheto_query = $csatlakozas->query($azonosito_elerheto);

    if ($azonosito_elerheto_query->num_rows == 0) {
        $hibak[] = "Nincs ilyen azonosítójú felhasználó.";
    }

    if ($eredeti_azonosito != $azonosito) {
        $tulajdonos_telek_letezik = "SELECT azonosito FROM tulajdonos_telek_birtoklas WHERE azonosito='$azonosito' AND helyrajzi_szam='$helyrajzi_szam';";
        $tulajdonos_telek_letezik_query = $csatlakozas->query($tulajdonos_telek_letezik);
        if ($tulajdonos_telek_letezik_query->num_rows > 0) {
            $hibak[] = "Ilyen azonosítójú tulajdonos már birtokolja a telket.";
        }

        $tulajdonos_modositas = "UPDATE tulajdonos_telek_birtoklas SET azonosito = '$azonosito', tulajdonhanyad = '$tulajdonhanyad' WHERE helyrajzi_szam = '$helyrajzi_szam' AND azonosito = $eredeti_azonosito;";
    } else {
        $tulajdonos_modositas = "UPDATE tulajdonos_telek_birtoklas SET azonosito = '$azonosito', tulajdonhanyad = '$tulajdonhanyad' WHERE helyrajzi_szam = '$helyrajzi_szam' AND azonosito = $eredeti_azonosito;";
    }

    $tulajdonos_modositas = "UPDATE tulajdonos_telek_birtoklas SET azonosito = '$azonosito', tulajdonhanyad = '$tulajdonhanyad' WHERE helyrajzi_szam = '$helyrajzi_szam' AND azonosito = $eredeti_azonosito;";

    if (count($hibak) === 0) {
        if ($csatlakozas->query($tulajdonos_modositas) === TRUE) {
            session_start();
            $_SESSION['sikeres_tulajdonos_modositas'] = "sikeres_tulajdonos_modositas";
            header("Location: ./../telkek_listazasa_oldal.php");
        } else {
            echo "SQL hiba.";
        }
    } else {
        session_start();
        $_SESSION['hibak'] = $hibak;
        header("Location: ./../telkek_listazasa_oldal.php");
    }
}
