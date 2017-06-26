<!DOCTYPE html>
<html lang="fr">
<?php
include "../includes/header.php";
afficherHeader('Mes interventions');
?>
<body>

<?php
if (isset ($_GET['errname']) && $_GET['errname']!="")
{
    echo "<p>".strtoupper($_GET['errname'])." ne fait pas partie du personnel de cet hôpital </p>" ;
}
?>
<form action="../app/mesinterventions_check.php" method="GET" id="mesintervention">
    <p>Veuillez rentrer votre nom</p>
    <input type="text" name="nom">
    <p><button type="submit" >Valider</button></p>
</form>

</body>
<?php include "../includes/footer.php";?>

</html>
