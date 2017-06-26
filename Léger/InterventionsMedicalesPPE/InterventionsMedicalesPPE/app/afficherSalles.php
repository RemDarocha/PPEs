<?php
include "../includes/db_connect.php";

function afficherFormulaireSalle()
{

    echo '
    <h4>Ajout d\'une salle</h4>
    <form method="get" action="../app/ajoutersalle.php">
        <input type="text" name="libelle">
        <button type="submit" >Ajouter</button>
    </form>
    ';
}

$querry = "SELECT sai_libelle FROM salleIntervention ORDER BY sai_libelle";

$salles = $bdd->prepare($querry);

$salles->execute();

echo'<h1>Salles : </h1>';

while ($salle = $salles->fetch(PDO::FETCH_ASSOC))
{
    echo'<p>'.$salle["sai_libelle"].'</p>';
}
?>