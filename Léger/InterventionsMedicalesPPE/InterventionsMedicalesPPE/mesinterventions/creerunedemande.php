<!DOCTYPE html>
<html lang="fr">
<?php
include "../includes/db_connect.php";
include "../includes/header.php";
afficherHeader("Génération d'une demande")
?>
<?php
$idInt = $_GET['idint'];
$idPers = $_GET['idpers'];

?>
<body>
    <form method="POST" action="../app/generationdemande.php">
        <h2>Veuillez détailler votre demande :</h2>
        <textarea name="text" cols="100" rows="8"></textarea><br/>
        <input type="hidden" name="idint" value="<?php echo $idInt ?>" />
        <input type="hidden" name="idpers" value="<?php echo $idPers ?>" />
        <button type="submit">Envoyer</button>
    </form>
</body>

<?php include "../includes/footer.php" ?>

</html>