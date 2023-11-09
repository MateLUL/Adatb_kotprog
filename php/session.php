<?php
function startSession()
{
    session_start();
}

function setSessionData($azonosito)
{
    $_SESSION['azonosito'] = $azonosito;
}

function stopSession()
{
    session_unset();
    session_destroy();
}

function checkSession()
{
    if (!isset($_SESSION['azonosito'])) {
        header("Location: ./loginPage.php");
    }
    else
    {
        header("Location: ./hirek.php");
    }
}
?>