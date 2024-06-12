<?php
require 'src/php/utils/verifier_connexion.php';
$clients = new ClientDB($cnx);
$liste = $clients->getClientByEmail($_GET['email']);

?>
