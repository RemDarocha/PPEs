<!DOCTYPE html>
<html lang="fr">
<?php
include "../includes/db_connect.php";
include "../includes/header.php";
include "../includes/check_connexion.php";
afficherHeader("Les salles d'intervention")
?>
<body>

<?php include "../app/afficherSalles.php";
afficherFormulaireSalle()?>

</body>
<?php include "../includes/footer.php";?>

</html>
