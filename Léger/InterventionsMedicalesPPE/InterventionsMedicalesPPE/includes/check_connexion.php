<?php
session_start();

if(isset($_SESSION["login"])) {
    //Si une variable de session est renseignée le membre continue sa visite
    echo
    '
    <div id="connected">
        <h5>
            Connecté en tant que '.$_SESSION["nom"].'
            <a href ="../process/disconnection.php">Déconnexion</a>
        </h5>
    </div>
    ';
}
else {
    //Sinon redirection vers la page de connexion du portail
    header('Location: connexion.php');
}
?>