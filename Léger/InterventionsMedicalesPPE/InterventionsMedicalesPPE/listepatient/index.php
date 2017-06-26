<!DOCTYPE html>
<html lang="fr">
    <?php
    include "../includes/db_connect.php";
    include "../app/afficherlistepatient.php";
    include "../includes/header.php";
    afficherHeader("Liste des patients")
    ?>


<body>
<div id="tableaupatient">
    <h1>Liste des patients : </h1>
    <?php afficherPatient($bdd) ?>
</div>
</body>

<div id="listefooter">
<h3> Développé par Devatic </h3>
</div>
