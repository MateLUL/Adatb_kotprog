<?php
require "sql_csatlakozas.php";

$hozzarendeles = $_POST['hozzarendeles'];
$azonosito = $_POST['azonosito'];
$tulajdonhanyad = $_POST['tulajdonhanyad'];
$ingatlan_azonosito = $_POST['ingatlan_azonosito'];
$hibak = [];

if (isset($hozzarendeles)) {
    if (strlen($azonosito) < 3 || strlen($azonosito) > 255) {
        $hibak[] = "Túl hosszú vagy rövid az azonosító. Minimum 3, maximum 255 karakterből kell állnia.";
    }
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

        $tulajdonos_ingatlan_letezik = "SELECT f_id FROM tulajdonos_ingatlan_birtoklas WHERE f_id='$f_id' AND ingatlan_azonosito='$ingatlan_azonosito';";
        $tulajdonos_ingatlan_letezik_query = $csatlakozas->query($tulajdonos_ingatlan_letezik);

        if ($tulajdonos_ingatlan_letezik_query->num_rows > 0) {
            $hibak[] = "Ilyen azonosítójú tulajdonos már birtokolja ezt az ingatlant.";
        }
    }

    $tulajdonos_ingatlan = "INSERT INTO tulajdonos_ingatlan_birtoklas (f_id, ingatlan_azonosito, tulajdonhanyad) VALUES ('$f_id', '$ingatlan_azonosito', '$tulajdonhanyad');";

    if (count($hibak) === 0) {
        if ($csatlakozas->query($tulajdonos_ingatlan) === TRUE) {
            session_start();
            $_SESSION['sikeres_tulajdonos_ingatlan_hozzarendeles'] = "sikeres_tulajdonos_ingatlan_hozzarendeles";
            header("Location: ./../ingatlan_listazasa_oldal.php");
        } else {
            echo "SQL hiba.";
        }
    } else {
        session_start();
        $_SESSION['hibak'] = $hibak;
        header("Location: ./../tulajdonos_ingatlan_hozzarendeles.php?ingatlan_azonosito=$ingatlan_azonosito");
    }
}

disconnect();
