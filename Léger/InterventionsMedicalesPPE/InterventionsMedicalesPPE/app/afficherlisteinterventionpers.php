<?php

function afficherMessageBienvenue($idpers, $bdd)
{
    echo '<h1>Bienvenue '.getNom($idpers, $bdd).' '.getPrenom($idpers, $bdd).'</h1>';
}

function getNom($idpers, $bdd)
{
    $querynom = "SELECT pem_nom FROM personnelMedical WHERE pem_id = '".$idpers."'";
    $Nom = $bdd->prepare($querynom);
    $Nom->execute();
    $nom = $Nom->fetch(PDO::FETCH_ASSOC);
    $retournableNom = strtoupper($nom['pem_nom']);
    return $retournableNom;
}

function getPrenom($idpers, $bdd)
{
    $queryprenom = "SELECT pem_prenom FROM personnelMedical WHERE pem_id = '".$idpers."'";
    $Prenom = $bdd->prepare($queryprenom);
    $Prenom->execute();
    $prenom = $Prenom->fetch(PDO::FETCH_ASSOC);
    $retournablePrenom = $prenom['pem_prenom'];
    return $retournablePrenom;
}


function afficherListeIntervention($idpers, $bdd){


    $query = "
    SELECT int_id, int_date, int_heureEntree, tin_libelle, sai_libelle, pat_nom, pat_prenom
    FROM  personnelIntervention AS persInter
    INNER JOIN interventionMedicale ON  persInter.intervention_id = interventionMedicale.int_id
    INNER JOIN salleIntervention ON interventionMedicale.int_salleId = salleIntervention.sai_id 
    INNER JOIN typeIntervention ON interventionMedicale.int_type = typeIntervention.tin_id 
    INNER JOIN patient ON interventionMedicale.int_patId = patient.pat_id 
    WHERE persInter.personnelMedical_id = ".$idpers."
    ORDER BY interventionMedicale.int_date, interventionMedicale.int_heureEntree, patient.pat_nom, patient.pat_prenom
    ";
    echo "<script>console.log( 'Debug Objects: ".$query." );</script>";
    $results = $bdd->prepare($query);
    $results->execute();

    $Test = $results;
    $test = $Test->fetch(PDO::FETCH_ASSOC);

    echo "<h2>Les interventions :</h2>";
    if (isset($test) and $test != "")
    {
        echo '
            <table>
                <tr>
                   <th>Date</th> 
                   <th>Heure</th> 
                   <th>Type</th> 
                   <th>Salle</th> 
                   <th>Patient</th> 
                   <th>Action</th>
                </tr>  ';
        while ($result = $results->fetch(PDO::FETCH_ASSOC))
        {
            $Date = new DateTime($result["int_date"]);
            $Heure = new DateTime($result["int_heureEntree"]);
            $date = $Date->format('d-m-Y');
            $heure = $Heure->format('H:i');
            echo '  <tr>
                    <td>'.$date.'</td>
                    <td>'.$heure.'</td>
                    <td>'.$result["tin_libelle"].'</td>
                    <td>'.$result["sai_libelle"].'</td>
                    <td>'.$result["pat_nom"].' '.$result["pat_prenom"].'</td>
                    <td><a href="../mesinterventions/creerunedemande.php?idint='.$result["int_id"].'&idpers='.$idpers.'">Demande de suppression</a></td>
                </tr>
        ';
        }
        echo '</table>';
    }
    else
    {
        echo "<p>Pas d'intervention</p>";
    }
}
