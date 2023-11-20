<?php
require "./sql_csatlakozas.php";


if (isset($_POST['tulajdonos_torles'])) {
    $azonosito = $_POST['azonosito'];
    $torles = "DELETE FROM tulajdonos_ingatlan_birtoklas WHERE azonosito='$azonosito';";

    if ($csatlakozas->query($torles) === TRUE) {
        session_start();
        $_SESSION['sikeres_torles'] = "sikeres_torles";
        header("Location: ./../ingatlan_listazasa_oldal.php");
    }
}

disconnect();
