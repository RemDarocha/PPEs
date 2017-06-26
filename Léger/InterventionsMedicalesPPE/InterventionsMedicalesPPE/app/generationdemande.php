<?php

include "../includes/db_connect.php";

// Récupérationd des variables
$idpers= $_POST['idpers'];
$idint = $_POST['idint'];
$text  = $_POST['text'];


$date = date("d/m/y");
setlocale(LC_TIME, 'fr', 'fr_FR', 'fr_FR.ISO8859-1');
$heure =strftime("%R");

$text = $date." - ".$heure." | ".$text;


$req = $bdd->prepare('INSERT INTO demande (dem_text, dem_pers, dem_inter, dem_etat) VALUES ("'.$text.'","'.$idpers.'","'.$idint.'","1")');
$req->execute();

header('Location: ../mesinterventions/mesinterventions.php?id='.$idpers.'&dem=1');


?>