<!DOCTYPE html>
<html lang="fr">
<?php
include "../includes/db_connect.php";
include "../includes/header.php";
afficherHeader("Connexion")
?>
<body>
<?php

if (isset($_GET['err']))
    echo "<p>Mauvais identifiant ou mot de passe !</p>"

?>
<form action="../process/signin_check.php" method="POST">
    <h2>
    <label>Identifiant</label>
    <input type="text" name="login" placeholder="Identifiant">
    </h2>

    <h2>
    <label>Mot de passe</label>
    <input type="password" name="password" placeholder="Mot de passe">
    </h2>

    <button type="submit" >Envoyer</button>
</form>

</body>
<?php include "../includes/footer.php"; ?>

</html>