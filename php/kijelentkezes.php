<?php
$kijelentkezes = $_POST['kijelentkezes'];

if (isset($kijelentkezes))
{
    session_start();
    $_SESSION['kijelentkezve'] = "kijelentkezve";
    $azonosito = $_SESSION['azonosito'];

    require_once "./sql_csatlakozas.php";
    $bejelentkezett = "UPDATE felhasznalo SET `be_van-e_jelentkezve` = 0 WHERE azonosito = '$azonosito';";
    $bejelentkezett_query = $csatlakozas->query($bejelentkezett);

    if ($bejelentkezett_query === TRUE) {
        header("Location: ./../index.php");
    }
}
?>