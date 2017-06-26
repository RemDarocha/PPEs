<?php
include "../includes/db_connect.php";


function afficherFormulaireType(){

    echo'
    <h4>Ajout d\'un type d\'interventions</h4>
    <form method="GET" action="../app/ajoutertype.php">
        <input type="text" name="libelle">
        <button type="submit" >Ajouter</button>
    </form>
    ';
}

$querry = "select tin_libelle from typeIntervention ORDER BY tin_libelle";

$types = $bdd->prepare($querry);

$types->execute();

echo"<h1>Types d'interventions : </h1>";

while ($type = $types->fetch(PDO::FETCH_ASSOC))
{
    echo'<p>'.$type["tin_libelle"].'</p>';
}
?>