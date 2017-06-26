<?php

$idpers = $_POST['idpers'];
$idint = $_POST['idint'];
$text=$_POST['text'];

if (!(isset($text) or isset($idpers) or isset($idint)) )
{
    header('Location: ../creerunedemande.php');
}



?>