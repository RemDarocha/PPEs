<?php
function getName($idpers, $bdd)
{
    $querynom = "SELECT pem_nom, pem_prenom FROM personnelMedical WHERE pem_id = '".$idpers."'";
    $res = $bdd->prepare($querynom);
    $res->execute();
    $name = $res->fetch(PDO::FETCH_ASSOC);
    $prenom = $name['pem_prenom'];
    $nom = strtoupper($name['pem_nom']);
    return $nom." ".$prenom;
}

function afficherDemandes($bdd, $etat){

    $compteur=0;
    $query = "
    SELECT *
    FROM  demande
    WHERE dem_etat =".$etat."
    ";

    $results = $bdd->prepare($query);
    $results->execute();


    while ($result = $results->fetch(PDO::FETCH_ASSOC)) {
        echo '
        <br/>
        <div class="demande">
        <h4>'.getName($result["dem_pers"], $bdd).' | Id intervention : '.$result["dem_inter"].'</h4>
        <textarea name="text" cols="80" rows="6">'.$result["dem_text"].'</textarea>
        <p>Demande n°'.$result["dem_id"].'</p>';
        if ($etat == 1)
        {
            echo '<p><a href="../app/demande_en_cours.php?idDemande='.$result["dem_id"].'">En cours</a> | <a href="../app/demande_terminee.php?idDemande='.$result["dem_id"].'">Traitée</a></p>';
        }
        elseif ($etat == 2)
        {
            echo '<a href="../app/demande_terminee.php?idDemande='.$result["dem_id"].'">Traitée</a></p>';
        }
        echo'
        </div>
        <br/>';

    $compteur++;
    }

    if($compteur == 0){
        echo "<h2>Aucune demandes</h2><br/>
        <h4><a href='lesdemandes.php'>Retour</a></h4>
        ";
    }
}


?>