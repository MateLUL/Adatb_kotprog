<?php
require "sql_csatlakozas.php";

$helyrajzi_szam = $_POST['helyrajzi_szam'];
$azonosito = $_POST['azonosito'];
$tulajdonhanyad = $_POST['tulajdonhanyad'];
$modositas = $_POST['modositas'];
$eredeti_f_id = $_POST['eredeti_f_id'];
$ttb_id = $_POST['ttb_id'];

$hibak = [];
if (isset($modositas)) {
    if (strlen($azonosito) > 255) {
        $hibak[] = "Túl hosszú az azonosító. Maximum 255 karakterből kell állnia.";
    }
    if (strlen($tulajdonhanyad) > 255) {
        $hibak[] = "Túl hosszú a tulajdonhányad. Maximum 255 karakterből kell állnia.";
    }

    $azonosito_elerheto = "SELECT azonosito, id FROM felhasznalo WHERE azonosito='$azonosito'";
    $azonosito_elerheto_query = $csatlakozas->query($azonosito_elerheto);

    if ($azonosito_elerheto_query->num_rows == 0) {
        $hibak[] = "Nincs ilyen azonosítójú felhasználó.";
    } else {
        foreach ($azonosito_elerheto_query as $row) {
            $f_id = $row['id'];
        }

        if ($f_id != $eredeti_f_id) {
            $tulajdonos_telek_letezik = "SELECT f_id FROM tulajdonos_telek_birtoklas WHERE f_id='$f_id' AND helyrajzi_szam='$helyrajzi_szam';";
            $tulajdonos_telek_letezik_query = $csatlakozas->query($tulajdonos_telek_letezik);
            
            if ($tulajdonos_telek_letezik_query->num_rows > 0) {
                $hibak[] = "Ilyen azonosítójú tulajdonos már birtokolja a telket.";
            }
        }
    }


    $tulajdonos_modositas = "UPDATE tulajdonos_telek_birtoklas SET f_id = '$f_id', tulajdonhanyad = '$tulajdonhanyad' WHERE ttb_id = $ttb_id;";

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
