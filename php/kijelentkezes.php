<?php
$kijelentkezes = $_POST['kijelentkezes'];

if (isset($kijelentkezes))
{
    session_start();
    $_SESSION['kijelentkezve'] = "kijelentkezve";
    header("Location: ./../index.php");
}
?>