<!DOCTYPE html>
<html lang="fr">
<?php
include "../includes/header.php";
include '../includes/db_connect.php';
include  "../app/afficherlisteinterventionpers.php";
afficherHeader('Mes interventions');
?>

<body>

<?php afficherMessageBienvenue($_GET['id'], $bdd)?>
<div class="align-center">
<?php
afficherListeIntervention($_GET['id'],$bdd);

if(isset($_GET['dem']))
{
    echo"<p  style='color:red'>Demande envoyée</p>";
}

?>
</div>

</body>
<?php include "../includes/footer.php";?>

</html>
