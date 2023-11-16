<?php

if (isset($kijelentkezes))
{
    session_start();
    $_SESSION['kijelentkezve'] = "kijelentkezve";
    header("Location: ./../index.php");
}
?>