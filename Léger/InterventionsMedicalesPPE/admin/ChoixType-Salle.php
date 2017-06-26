<!DOCTYPE html>
<html lang="fr">
<?php
include "../includes/db_connect.php";
include "../includes/header.php";
include "../includes/check_connexion.php";
afficherHeader("Type ou Salle d'intervention")
?>
<body>
<div id="main-intro">
    <p>
        Veuillez choisir une action.<br/><br/>
    </p>
    <div id="actions">
        <a class="main-action" style="width: 48%" href="typeintervention.php">Types d'interventions</a>
        <a class="main-action" style="width: 48%" href="salles.php">Bloc/Salle d’intervention</a>
    </div>

</body>
<?php include "../includes/footer.php";?>

</html>