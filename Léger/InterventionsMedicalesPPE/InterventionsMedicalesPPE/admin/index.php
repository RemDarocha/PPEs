<!DOCTYPE html>
<html lang="fr">
<?php
include "../includes/db_connect.php";
include "../includes/header.php";
include "../includes/check_connexion.php";
afficherHeader("Espace administrateur")
?>
<body>
<div id="main-intro">
    <p>
        Veuillez choisir une action.<br/><br/>
    </p>
    <div id="actions">
        <a class="main-action" href="lesinterventions.php">Les interventions</a>
        <a class="main-action" href="lesdemandes.php">Les demandes</a>
        <a class="main-action" href="ChoixType-Salle.php">Type – Bloc/Salle</a>
    </div>

</body>

<?php include "../includes/footer.php";?>

</html>