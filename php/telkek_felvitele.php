<?php
require "sql_csatlakozas.php";

$felvitel = $_POST['felvitel'];
$helyrajzi_szam = $_POST['helyrajzi_szam'];
$meret = $_POST['meret'];
$jelleg = $_POST['jelleg'];
$becsult_ertek = $_POST['becsult_ertek'];
$hibak = [];

if (isset($felvitel)) {
    if (strlen($helyrajzi_szam) > 255) {
        $hibak[] = "Túl hosszú a helyrajzi szám. Maximum 255 karakterből kell állnia.";
    }
    if (strlen($meret) > 255) {
        $hibak[] = "Túl hosszú a méret. Maximum 255 karakterből kell állnia.";
    }
    if (strlen($jelleg) > 255) {
        $hibak[] = "Túl hosszú a jelleg. Maximum 255 karakterből kell állnia.";
    }
    if (strlen($becsult_ertek) > 255) {
        $hibak[] = "Túl hosszú a becsült érték. Maximum 255 karakterből kell állnia.";
    }

    $helyrajzi_szam_elerheto = "SELECT helyrajzi_szam FROM telek WHERE helyrajzi_szam='$helyrajzi_szam'";
    $helyrajzi_szam_elerheto_query = $csatlakozas->query($helyrajzi_szam_elerheto);

    if ($helyrajzi_szam_elerheto_query->num_rows > 0) {
        $hibak[] = "Már létezik ilyen helyrajzi számú telek.";
    }

    $telek = "INSERT INTO telek (helyrajzi_szam, meret, jelleg, becsult_ertek) VALUES ('$helyrajzi_szam', '$meret', '$jelleg', '$becsult_ertek');";

    if (count($hibak) === 0) {
        if ($csatlakozas->query($telek) === TRUE) {
            session_start();
            $_SESSION['sikeres_telek_felvitel'] = "sikeres_telek_felvitel";
            header("Location: ./../telkek_felvitele_oldal.php");
        } else {
            echo "SQL hiba.";
        }
    } else {
        session_start();
        $_SESSION['hiba'] = $hibak;
        header("Location: ./../telkek_felvitele_oldal.php");
    }
}

disconnect();
?>