<!DOCTYPE html>
<html lang="fr">
<?php
include "../includes/db_connect.php";
include "../includes/header.php";
include "../includes/check_connexion.php";
afficherHeader("Liste des interventions")
?>
<body>
<?php include "../app/afficher_liste_intervention.php" ?>
</body>
<div id="listefooter">
    <h3> Développé par Devatic </h3>
</div>

</html>
