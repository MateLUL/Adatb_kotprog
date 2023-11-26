<?php
require "./sql_csatlakozas.php";
session_start();

if (isset($_POST['torles'])) {
    $id = $_SESSION['id'];
    $felhasznalo_adoszam = "DELETE FROM felhasznalo_adoszam WHERE id = '$id';";
    $felhasznalo_infok = "DELETE FROM felhasznalo_infok WHERE id = '$id';";
    $felhasznalo_lakcim = "DELETE FROM felhasznalo_lakcim WHERE id = '$id';";
    $felhasznalo_neve = "DELETE FROM felhasznalo_neve WHERE id = '$id';";
    $felhasznalo_anyja_neve = "DELETE FROM felhasznalo_anyja_neve WHERE id = '$id';";
    $tulajdonos_telek = "DELETE FROM tulajdonos_telek_birtoklas WHERE f_id = '$id'";
    $tulajdonos_ingatlan = "DELETE FROM tulajdonos_ingatlan_birtoklas WHERE f_id = '$id'";
    $felhasznalo = "DELETE FROM felhasznalo WHERE id = '$id';";

    if ($csatlakozas->query($felhasznalo_adoszam) === TRUE && $csatlakozas->query($felhasznalo_infok) === TRUE && $csatlakozas->query($felhasznalo_lakcim) === TRUE && $csatlakozas->query($felhasznalo_neve) === TRUE && $csatlakozas->query($felhasznalo_anyja_neve) === TRUE && $csatlakozas->query($tulajdonos_telek) === TRUE && $csatlakozas->query($tulajdonos_ingatlan) === TRUE && $csatlakozas->query($felhasznalo) === TRUE) {
        $_SESSION['sikeres_torles'] = "sikeres_torles";
        header("Location: ./../index.php");
    }
}

disconnect();
