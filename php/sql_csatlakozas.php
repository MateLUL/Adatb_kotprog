<?php
$csatlakozas = null;

function connect()
{
    $sqlSzerver = "adatb_mysql";
    $sqlFhnev = "root";
    $sqlJelszo = "adatb";
    $sqlAdatbazis = "ingatlan";

    global $csatlakozas;

    $csatlakozas = new mysqli($sqlSzerver, $sqlFhnev, $sqlJelszo, $sqlAdatbazis);

    if ($csatlakozas->connect_error) {
        die("Adatbázis csatlakozási hiba: " . $csatlakozas->connect_error);
    }
}

function disconnect()
{
    global $csatlakozas;

    if ($csatlakozas != null) {
        $csatlakozas->close();
    }
}
?>