<?php
try
{
	// On se connecte à MySQL
	$bdd = new PDO('mysql:host=154.49.212.121;dbname=devatic;charset=utf8', 'devatic-bdd', '8dMwn3~9');
}
catch(Exception $e)
{
	// En cas d'erreur, on affiche un message et on arrête tout
        die('Erreur : '.$e->getMessage());
}
?>