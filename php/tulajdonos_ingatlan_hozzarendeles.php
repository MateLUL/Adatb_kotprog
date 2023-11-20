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

    $azonosito_letezik = "SELECT azonosito FROM felhasznalo WHERE azonosito='$azonosito'";
    $azonosito_letezik_query = $csatlakozas->query($azonosito_letezik);

    if ($azonosito_letezik_query->num_rows == 0) {
        $hibak[] = "Nem létezik ilyen azonosítójú felhasználó.";
    }

    $tulajdonos_ingatlan = "INSERT INTO tulajdonos_ingatlan_birtoklas (azonosito, ingatlan_azonosito, tulajdonhanyad) VALUES ('$azonosito', '$ingatlan_azonosito', '$tulajdonhanyad');";

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
        $_SESSION['hiba'] = $hibak;
        header("Location: ./../ingatlan_listazasa_oldal.php");
    }
}

disconnect();
