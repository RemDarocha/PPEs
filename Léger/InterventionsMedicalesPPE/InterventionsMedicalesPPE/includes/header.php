<?php
function afficherHeader($titre)
{
    echo '<head>
    <meta charset=UTF-8" >
    <link rel="stylesheet" href="../CSS/style.css">
    <link rel="stylesheet" href="../CSS/tableau.css">
    <script src="../jquery/jquery-3.2.1.js"></script>
    <title>'. $titre .'</title>
    <div id="bandeau">
        <a href=".."><img src="../img/CHUBordeaux.svg"></a>
        <h1>'. $titre .'</h1>
    </div>
</head>
</html>';
}
?>