<!DOCTYPE html>
<html lang="fr">
<?php
include "../includes/db_connect.php";
include "../includes/header.php";
include "../includes/check_connexion.php";
include  "../app/afficherdemande.php";
afficherHeader("Demandes en cours")
?>
<body>
<h1>Demandes en cours</h1>
<br/>

<?php afficherDemandes($bdd, 2);?>

</body>

<?php include "../includes/footer.php";?>

</html>
