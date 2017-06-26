<!DOCTYPE html>
<html lang="fr">
<?php
include "../includes/db_connect.php";
include "../includes/header.php";
include "../includes/check_connexion.php";
afficherHeader("Choix des demandes")
?>
<body>
<div id="main-intro">
    <p>
        Veuillez choisir un type de demande.<br/><br/>
    </p>
    <div id="actions">
        <a class="main-action" href="demandes_non_traitees.php">Non traitées</a>
        <a class="main-action" href="demandes_en_cours.php">En cours </a>
        <a class="main-action" href="demandes_traitees.php">Traitées</a>
    </div>

</body>

<?php include "../includes/footer.php";?>

</html>