<!DOCTYPE html>
<html lang="hu">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Regisztráció - Ingatlan</title>
</head>

<body>
    <div>
        <form action="./php/regisztracio.php" method="post">
            <label for="azonosito">Azonosító</label>
            <input type="text" name="azonosito" id="azonosito">
            <br>

            <label for="jelszo">Jelszó</label>
            <input type="password" name="jelszo" id="jelszo">
            <br>

            <label for="jelszo_ism">Jelszó ismételve</label>
            <input type="password" name="jelszo_ism" id="jelszo_ism">
            <br>

            <label for="keresztnev">Keresztnév</label>
            <input type="text" name="keresztnev" id="keresztnev">
            <br>

            <label for="vezeteknev">Vezetéknév</label>
            <input type="text" name="vezeteknev" id="vezeteknev">
            <br>

            <label for="adoszam">Adószám</label>
            <input type="text" name="adoszam" id="adoszam">
            <br>

            <label for="iranyitoszam">Irányítószám</label>
            <input type="text" name="iranyitoszam" id="iranyitoszam">
            <br>

            <label for="varos">Város</label>
            <input type="text" name="varos" id="varos">
            <br>

            <label for="utca">Utca</label>
            <input type="text" name="utca" id="utca">
            <br>

            <label for="hazszam">Házszám</label>
            <input type="text" name="hazszam" id="hazszam">
            <br>

            <label for="telefonszam">Telefonszám</label>
            <input type="tel" name="telefonszam" id="telefonszam">
            <br>

            <label for="szuldatum">Születési dátum</label>
            <input type="date" name="szuldatum" id="szuldatum">
            <br>

            <label for="anyja_keresztnev">Anyja keresztneve</label>
            <input type="text" name="anyja_keresztnev" id="anyja_keresztnev">
            <br>

            <label for="anyja_vezeteknev">Anyja vezetékneve</label>
            <input type="text" name="anyja_vezeteknev" id="anyja_vezeteknev">
            <br>

            <input type="submit" value="Regisztráció">
        </form>
    </div>
</body>

</html>