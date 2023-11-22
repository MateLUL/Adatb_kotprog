<?php
require "sql_csatlakozas.php";

$ingatlan_azonosito = $_POST['ingatlan_azonosito'];
$azonosito = $_POST['azonosito'];
$tulajdonhanyad = $_POST['tulajdonhanyad'];
$modositas = $_POST['modositas'];

$hibak = [];
if (isset($modositas)) {
    if (strlen($azonosito) > 255) {
        $hibak[] = "Túl hosszú az azonosító. Maximum 255 karakterből kell állnia.";
    }
    if (strlen($tulajdonhanyad) > 255) {
        $hibak[] = "Túl hosszú a tulajdonhányad. Maximum 255 karakterből kell állnia.";
    }

    $azonosito_letezik = "SELECT azonosito FROM felhasznalo WHERE azonosito='$azonosito'";
    $azonosito_letezik_query = $csatlakozas->query($azonosito_letezik);

    if ($azonosito_letezik_query->num_rows == 0) {
        $hibak[] = "Nem létezik ilyen azonosítójú felhasználó.";
    }

    $tulajdonos_ingatlan_letezik = "SELECT azonosito FROM tulajdonos_ingatlan_birtoklas WHERE azonosito='$azonosito' AND ingatlan_azonosito='$ingatlan_azonosito';";
    $tulajdonos_ingatlan_letezik_query = $csatlakozas->query($tulajdonos_ingatlan_letezik);

    if ($tulajdonos_ingatlan_letezik_query->num_rows > 0) {
        $hibak[] = "Ilyen azonosítójú tulajdonos már birtokolja az ingatlant.";
    }

    $tulajdonos_modositas = "UPDATE tulajdonos_ingatlan_birtoklas SET azonosito = '$azonosito', tulajdonhanyad = '$tulajdonhanyad' WHERE ingatlan_azonosito = $ingatlan_azonosito;";

    if (count($hibak) === 0) {
        if ($csatlakozas->query($tulajdonos_modositas) === TRUE) {
            session_start();
            $_SESSION['sikeres_tulajdonos_modositas'] = "sikeres_tulajdonos_modositas";
            header("Location: ./../ingatlan_listazasa_oldal.php");
        } else {
            echo "SQL hiba.";
        }
    } else {
        session_start();
        $_SESSION['hibak'] = $hibak;
        header("Location: ./../ingatlan_listazasa_oldal.php");
    }
}
