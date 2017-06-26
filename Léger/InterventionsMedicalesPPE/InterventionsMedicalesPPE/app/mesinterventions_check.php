<?php

include '../includes/db_connect.php';

if (isset($_GET['nom'])){
    $nom = $_GET['nom'];
}else{
    header('Location: ../mesinterventions/');
}

if (isset($_GET['prenom'])){
    $prenom = $_GET['prenom'];
    $queryAndPrenom = " AND pem_prenom = '".$prenom."'";
    $persPrenom=$bdd->prepare($querypers.$queryAndPrenom);
}

$querypers ="SELECT pem_nom, pem_prenom, pem_id from personnelMedical WHERE pem_nom = '".$nom."'";
$pers=$bdd->prepare($querypers);
$test=$bdd->prepare($querypers);
$pers->execute();
$test->execute();
$Pers=$pers->fetch(PDO::FETCH_ASSOC);
$compteur=0;
while ($Test = $test->fetch(PDO::FETCH_ASSOC))
{
    $compteur++;
}
echo $compteur;
if (isset($Pers) && $Pers["pem_nom"]!= "" && $compteur==1)
{
    header('Location: ../mesinterventions/mesinterventions.php?id='.$Pers[pem_id]);
    //echo '<p>Salut a toi '.$Pers["pem_nom"].' '.$Pers["pem_prenom"].'</p>';
}
elseif (isset($Pers) && $Pers["pem_nom"]!= "" && $compteur>=2)
{
    include "../includes/header.php";
    afficherHeader('Entrer votre Prénom');
    echo '
    <p>Il y a plusieurs personnes ayant comme nom '.$nom.'</p>
    <form action="mesinterventions_check.php?nom='.$nom.'" method="GET" id="mesintervention">
        <p><input type="text" name="nom" value="'.$nom.'"></p>
        <p>Veuillez rentrer votre Prénom<br/>
        <input type="text" name="prenom"></p>
        <p><button type="submit" >Valider</button></p>
    </form>
    ';
    include "../includes/footer.php";
}
else
{
    header('Location: ../mesinterventions/index.php?errname='.$nom);
    //echo $nom." ne fait pas partie du personnel de cet hôpital" ;
}
if (isset($prenom) && isset($nom))
{
    $persPrenom->execute();
    $PersPrenom=$persPrenom->fetch(PDO::FETCH_ASSOC);
    header('Location: ../mesinterventions/mesinterventions.php?id='.$PersPrenom[pem_id]);
}
?>