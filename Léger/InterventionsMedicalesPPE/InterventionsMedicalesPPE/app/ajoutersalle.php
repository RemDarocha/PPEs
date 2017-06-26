<?php
include "../includes/db_connect.php";

if ( isset( $_GET['libelle'] ) ){
    $libelle=$_GET['libelle'];
    if ($libelle!= "")
    {
        $querry = "INSERT IGNORE INTO salleIntervention (sai_libelle) VALUES ('".$libelle."')";
        $bdd->exec($querry);
        header('Location: ../admin/ajoutersalle.php');
    }
}
?>
