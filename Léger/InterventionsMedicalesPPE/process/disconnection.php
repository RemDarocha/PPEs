<?php
session_start();
session_destroy();
echo'<script> alert("Vous avez été déconnecté"); </script>';
header('Location: ../')
?>