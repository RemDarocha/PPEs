<!DOCTYPE html>
<html lang="fr">
<?php
include "../includes/db_connect.php";
include "../includes/header.php";
include "../includes/check_connexion.php";
include  "../app/afficherdemande.php";
afficherHeader("Demandes non-traitées")
?>
<body>
<h1>Demandes non-traitées</h1>
<br/>

<?php afficherDemandes($bdd, 1);?>

</body>

<div id="listefooter">
    <h3> Développé par Devatic </h3>
</div>

</html>
