<?php
require "sql_csatlakozas.php";

$ingatlan_azonosito = $_POST['ingatlan_azonosito'];
$azonosito = $_POST['azonosito'];
$tulajdonhanyad = $_POST['tulajdonhanyad'];
$modositas = $_POST['modositas'];
$eredeti_f_id = $_POST['eredeti_f_id'];
$tib_id = $_POST['tib_id'];

$hibak = [];

if (isset($modositas)) {
    if (strlen($tulajdonhanyad) > 255) {
        $hibak[] = "Túl hosszú a tulajdonhányad. Maximum 255 karakterből kell állnia.";
    }

    $azonosito_letezik = "SELECT azonosito, id FROM felhasznalo WHERE azonosito='$azonosito'";
    $azonosito_letezik_query = $csatlakozas->query($azonosito_letezik);

    if ($azonosito_letezik_query->num_rows == 0) {
        $hibak[] = "Nem létezik ilyen azonosítójú felhasználó.";
    } else {
        foreach ($azonosito_letezik_query as $row) {
            $f_id = $row['id'];
        }

        if ($f_id != $eredeti_f_id) {
            $tulajdonos_ingatlan_letezik = "SELECT f_id FROM tulajdonos_ingatlan_birtoklas WHERE f_id='$f_id' AND ingatlan_azonosito='$ingatlan_azonosito';";
            $tulajdonos_ingatlan_letezik_query = $csatlakozas->query($tulajdonos_ingatlan_letezik);

            if ($tulajdonos_ingatlan_letezik_query->num_rows > 0) {
                $hibak[] = "Ilyen azonosítójú tulajdonos már birtokolja az ingatlant.";
            }
        }
    }

    $tulajdonos_modositas = "UPDATE tulajdonos_ingatlan_birtoklas SET f_id = '$f_id', tulajdonhanyad = '$tulajdonhanyad' WHERE tib_id = $tib_id;";

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
