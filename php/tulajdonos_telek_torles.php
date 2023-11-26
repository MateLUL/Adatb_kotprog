<?php
require "./sql_csatlakozas.php";


if (isset($_POST['tulajdonos_torles'])) {
    $f_id = $_POST['f_id'];
    $torles = "DELETE FROM tulajdonos_telek_birtoklas WHERE f_id='$f_id';";

    if ($csatlakozas->query($torles) === TRUE) {
        session_start();
        $_SESSION['sikeres_torles'] = "sikeres_torles";
        header("Location: ./../telkek_listazasa_oldal.php");
    }
}

disconnect();
?>