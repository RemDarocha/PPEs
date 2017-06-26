<?php
$query = "
    SELECT int_id, int_date, int_heureEntree, tin_libelle, sai_libelle, pat_nom, pat_prenom
    FROM  interventionMedicale AS im
    INNER JOIN salleIntervention ON im.int_salleId = salleIntervention.sai_id
    INNER JOIN typeIntervention ON im.int_type = typeIntervention.tin_id
    INNER JOIN patient ON im.int_patId = patient.pat_id
    ORDER BY im.int_date, im.int_heureEntree, patient.pat_nom, patient.pat_prenom
    ";

$results = $bdd->prepare($query);
$results->execute();

echo "
<h1>Liste des interventions :</h1>
<table>
    <tr>
       <th>Date</th>
       <th>Heure</th>
       <th>Type</th>
       <th>Salle</th>
       <th>Patient</th>
       <th>Etat</th>
       <th>Supprimer</th>
    </tr>
";
while ($result = $results->fetch(PDO::FETCH_ASSOC))
{
    $Date = new DateTime($result["int_date"]);
    $Heure = new DateTime($result["int_heureEntree"]);
    $date = $Date->format('d-m-Y');
    $heure = $Heure->format('H:i');
    echo '   <tr>
                    <td>'.$date.'</td>
                    <td>'.$heure.'</td>
                    <td>'.$result["tin_libelle"].'</td>
                    <td>'.$result["sai_libelle"].'</td>
                    <td>'.$result["pat_nom"].' '.$result["pat_prenom"].'</td>
                    <td>'.etatInter($date).'</td>
                    <td><a href="supprimerinter.php?idint='.$result["int_id"].'">Supprimer</a></td>
             </tr>
    ';
}

function etatInter($date){
    $etat = "Terminée";

    return $etat;
}
?>