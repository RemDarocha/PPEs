<?php
include "../includes/db_connect.php";

$id = $_GET['idDemande'];

$req = $bdd->prepare('UPDATE demande SET dem_etat = "3" WHERE dem_id = '.$id);
$req->execute();

header("Location: ../admin/demandes_non_traitees.php")
?>