<?php
include "../includes/db_connect.php";


if (isset($_GET['libelle'])) {
    $libelle = $_GET['libelle'];
    if (isset($libelle) && $libelle != "") {
        $querry = "INSERT INTO typeIntervention (tin_libelle) VALUES ('" . $libelle . "')";
        $bdd->exec($querry);
        header('Location: ../admin/typeintervention.php');
    }
    else{
        echo 'Erreur';
    }
}

?>