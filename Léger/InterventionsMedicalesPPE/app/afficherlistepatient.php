<?php

function age($ddn){
    $datedenaissance = date_create($ddn);
    return date_diff( $datedenaissance , date_create('today'))->y;
}

function getAdresse($adrId, $bdd)
{
    $adresseQuery = "select * from adresse where adr_id=".$adrId;
    $adresses=$bdd->prepare($adresseQuery);
    $adresses->execute();
    while ($adresse = $adresses->fetch(PDO::FETCH_ASSOC))
    {
        $adressecomplete = $adresse["adr_ligne1"] . $adresse["adr_ligne2"] .' '. $adresse["adr_cp"] .' '. $adresse["adr_ville"];
    }
    return $adressecomplete;
}

function afficherPatient($bdd)
{
    $query = "
        SELECT pat_id, pat_nom, pat_prenom, pat_adrId, pat_ddn 
        FROM patient 
        ORDER BY pat_nom, pat_prenom
        ";

        $patients = $bdd->prepare($query);

        $patients->execute();

        echo '
        <table>
            <tr>
                <th>Nom</th>
                <th>Prénom</th>
                <th>Adresse</th>
                <th>Age</th>
            </tr>';

        while ($patient = $patients->fetch(PDO::FETCH_ASSOC)) {
            echo '
            <tr>
                <td> ' . $patient["pat_nom"] . '</td>
                <td> ' . $patient["pat_prenom"] . '</td>
                <td> ' . getAdresse($patient["pat_adrId"], $bdd) . '</td>
                <td style="text-align:center"> ' . age($patient["pat_ddn"]) . '</td>
            </tr>
          ';
        }
        echo '</table>';
}

?>