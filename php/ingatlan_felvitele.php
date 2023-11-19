<?php
require "sql_csatlakozas.php";

$felvitel = $_POST['felvitel'];
$ingatlan_azonosito = $_POST['ingatlan_azonosito'];
$epites_eve = $_POST['epites_eve'];
$jelleg = $_POST['jelleg'];
$becsult_ertek = $_POST['becsult_ertek'];
$helyrajzi_szam = $_POST['helyrajzi_szam'];
$iranyitoszam = $_POST['iranyitoszam'];
$kozterulet = $_POST['kozterulet'];
$hazszam = $_POST['hazszam'];
$hibak = [];

if (isset($felvitel)) {
    if (strlen($helyrajzi_szam) > 255) {
        $hibak[] = "Túl hosszú a helyrajzi szám. Maximum 255 karakterből kell állnia.";
    }
    if (strlen($ingatlan_azonosito) > 255) {
        $hibak[] = "Túl hosszú az ingatlan azonosítója. Maximum 255 karakterből kell állnia.";
    }
    if (strlen($epites_eve) > 255) {
        $hibak[] = "Túl hosszú az építés éve. Maximum 255 karakterből kell állnia.";
    }
    if (strlen($jelleg) > 255) {
        $hibak[] = "Túl hosszú a jelleg. Maximum 255 karakterből kell állnia.";
    }
    if (strlen($becsult_ertek) > 255) {
        $hibak[] = "Túl hosszú a becsült érték. Maximum 255 karakterből kell állnia.";
    }
    if (strlen($iranyitoszam) < 2 || strlen($iranyitoszam) > 255) {
        $hibak[] = "Túl hosszú vagy rövid az irányítószám. Minimum 2, maximum 255 karakterből kell állnia.";
    }
    if (strlen($kozterulet) < 2 || strlen($kozterulet) > 255) {
        $hibak[] = "Túl hosszú vagy rövid a közterület. Minimum 2, maximum 255 karakterből kell állnia.";
    }
    if (strlen($hazszam) > 255) {
        $hibak[] = "Túl hosszú a házszám. Maximum 255 karakterből kell állnia.";
    }

    $helyrajzi_szam_elerheto = "SELECT helyrajzi_szam FROM telek WHERE helyrajzi_szam='$helyrajzi_szam'";
    $helyrajzi_szam_elerheto_query = $csatlakozas->query($helyrajzi_szam_elerheto);

    if ($helyrajzi_szam_elerheto_query->num_rows == 0) {
        $hibak[] = "Nincs ilyen helyrajzi számú telek.";
    }

    $ingatlan_azonosito_elerheto = "SELECT ingatlan_azonosito FROM ingatlan WHERE ingatlan_azonosito='$ingatlan_azonosito'";
    $ingatlan_azonosito_elerheto_query = $csatlakozas->query($ingatlan_azonosito_elerheto);

    if ($ingatlan_azonosito_elerheto_query->num_rows > 0) {
        $hibak[] = "Van már ilyen azonosítójú ingatlan.";
    }

    $ingatlan = "INSERT INTO ingatlan (ingatlan_azonosito, jelleg, epites_eve, becsult_ertek, helyrajzi_szam) VALUES ('$ingatlan_azonosito', '$jelleg', '$epites_eve', '$becsult_ertek', '$helyrajzi_szam');";
    $ingatlan_cim = "INSERT INTO ingatlan_cim (ingatlan_azonosito, iranyitoszam, kozterulet, hazszam) VALUES ('$ingatlan_azonosito', $iranyitoszam, '$kozterulet', $hazszam);";


    if (count($hibak) === 0) {
        if ($csatlakozas->query($ingatlan) === TRUE && $csatlakozas->query($ingatlan_cim) === TRUE) {
            session_start();
            $_SESSION['sikeres_ingatlan_felvitel'] = "sikeres_ingatlan_felvitel";
            header("Location: ./../ingatlan_felvitele_oldal.php");
        } else {
            echo "SQL hiba.";
        }
    } else {
        session_start();
        $_SESSION['hiba'] = $hibak;
        header("Location: ./../ingatlan_felvitele_oldal.php");
    }
}

disconnect();
