<?php
require "sql_csatlakozas.php";

$hozzarendeles = $_POST['hozzarendeles'];
$azonosito = $_POST['azonosito'];
$tulajdonhanyad = $_POST['tulajdonhanyad'];
$helyrajzi_szam = $_POST['helyrajzi_szam'];

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

        $tulajdonos_telek_letezik = "SELECT f_id FROM tulajdonos_telek_birtoklas WHERE f_id='$f_id' AND helyrajzi_szam='$helyrajzi_szam';";
        $tulajdonos_telek_letezik_query = $csatlakozas->query($tulajdonos_telek_letezik);

        if ($tulajdonos_telek_letezik_query->num_rows > 0) {
            $hibak[] = "Ilyen azonosítójú tulajdonos már birtokolja ezt a telket.";
        }
    }

    $tulajdonos_telek = "INSERT INTO tulajdonos_telek_birtoklas (f_id, helyrajzi_szam, tulajdonhanyad) VALUES ('$f_id', '$helyrajzi_szam', '$tulajdonhanyad');";

    if (count($hibak) === 0) {
        if ($csatlakozas->query($tulajdonos_telek) === TRUE) {
            session_start();
            $_SESSION['sikeres_tulajdonos_telek_hozzarendeles'] = "sikeres_tulajdonos_telek_hozzarendeles";
            header("Location: ./../telkek_listazasa_oldal.php");
            exit();
        } else {
            echo "SQL hiba.";
        }
    } else {
        session_start();
        $_SESSION['hibak'] = $hibak;
        header("Location: ./../tulajdonos_telek_hozzarendeles.php?helyrajzi_szam=$helyrajzi_szam");
        exit();
    }
}

disconnect();
?>