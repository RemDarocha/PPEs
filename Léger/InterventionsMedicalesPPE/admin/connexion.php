<!DOCTYPE html>
<html lang="fr">
<?php
include "../includes/db_connect.php";
include "../includes/header.php";
afficherHeader("Connexion")
?>
<body>
<form action="../process/signin_check.php" method="POST">
    <div class="form-group">
        <label for="InputUser">Identifiant</label>
        <input type="text" name="login" placeholder="Identifiant">
    </div>
    <div class="form-group">
        <label for="InputPassword">Mot de passe</label>
        <input type="password" name="password" placeholder="Mot de passe">
    </div>
    <button type="submit" >Envoyer</button>
</form>
</body>
<?php include "../includes/footer.php"; ?>

</html>