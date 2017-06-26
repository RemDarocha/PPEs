<?php

include '../includes/db_connect.php';

// Hachage du mot de passe

$pass_hache = hash("sha512", $_POST['password'].$_POST['login']);

$login = $_POST['login'];

// Vérification des identifiants
$req = $bdd->prepare('SELECT * FROM utilisateurs  WHERE uti_user = :login AND uti_mdp = :pass');
$req->execute(array(
    'login' => $login,
    'pass' => $pass_hache
));

$resultat = $req->fetch();

if (!$resultat)
{
    echo 'Mauvais identifiant ou mot de passe !';
}
else
{
    session_start();

    $_SESSION['id'] = $resultat['uti_id'];
    $_SESSION['id_personnel'] = $resultat['uti_personnelId'];
    $_SESSION['login'] = $login;
    $_SESSION['avatar'] = $resultat['uti_avatar_url'];

    // On récupère toutes les infos de l'utilisateur
    $req = $bdd->prepare('SELECT * FROM personnelMedical WHERE pem_id = :id');
    $req->execute(array(
        'id' => $_SESSION['id_personnel']
    ));

    $reponse = $req->fetch();

    $_SESSION['nom'] = $reponse['pem_nom'].' '.$reponse['pem_prenom'];

    $req = $bdd->prepare('UPDATE personnelMedical SET pem_active = :active WHERE pem_id = :id');
    $req->execute(array(
        'active' => 1,
        'id' => $_SESSION['id_personnel']
    ));

    //Redirection vers la version public du site internet
    header('Location: ../admin');

}
?>