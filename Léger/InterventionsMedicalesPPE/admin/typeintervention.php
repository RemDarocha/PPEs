<!DOCTYPE html>
<html lang="fr">
<?php
include "../includes/db_connect.php";
include "../includes/header.php";
include "../includes/check_connexion.php";
afficherHeader("Les types d'intervention")
?>
<body>

<?php include "../app/afficherTypeIntervention.php";
afficherFormulaireType();?>

</body>
<?php include "../includes/footer.php";?>

</html>
