<?php
require "session.php";

if (isset($kijelentkezes))
{
    startSession();
    stopSession();
    header("Location: ./../index.php");
}
?>