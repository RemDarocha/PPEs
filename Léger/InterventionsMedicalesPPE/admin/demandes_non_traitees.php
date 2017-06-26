<!DOCTYPE html>
<html lang="fr">
<?php
include "../includes/db_connect.php";
include "../includes/header.php";
include "../includes/check_connexion.php";
afficherHeader("Demandes non-traitées")
?>
<body>
<h1>Demandes non-traitées</h1>
<br/>
<!--Code a changer plus tard-->

<br/><br/><br/>

<div class="demande">
    <h4>LEROUX Hugo | Id intervention : 49</h4>
    <textarea name="text" cols="80" rows="8">21/05/17 - 16h22 | Je ne peux pas assister à cette intervention, pouvez vous me retirer ? Merci d'avance.</textarea>
    <p>Id demande : 5</p>
    <p><a href="#">En cours</a> | <a href="#">Traitée</a></p>
</div>


</body>

<div id="listefooter">
    <h3> Développé par Devatic </h3>
</div>

</html>
