<?php
print "<h1>Données des clients</h1> ";
print "<div id='content-wrapper'>";

print "<section id='textCenter'>";
$json = file_get_contents("./data/json/client.json");
//var_dump(*json); == tableau json
$data = json_decode($json); //conversion de json en php
var_dump($data); //tableau php

print"<div id='nomClient'>";

print "<table>";
print "<tr>";
print "<th> <h2>Nos clients</h2> </th>";
print "</tr>";

print "<tr>";
print "<br><td id='nomClient'>" . $data[0]->nom. " ". $data[0]->prenom. "</td>";
print "</tr>";
print "<tr>";
print "<br><td id='nomClient'>" . $data[1]->nom. " ". $data[1]->prenom. "</td>";
print "</tr>";
print "<tr>";
print "<br><td id='nomClient'>" . $data[2]->nom. " ". $data[2]->prenom. "</td>";
print "</tr>";
print "<tr>";
print "<br><td id='nomClient'>" . $data[3]->nom. " ". $data[3]->prenom. "</td>";
print "</tr>";

print "<br>";
print "</table>";

print "</div>";

print "<div id='details'>";
print "<table id='details'>";
print "<h2 id='details'>Détails des clients</h2>";
$nbr = count($data);

print "<tr id='details'>";
for ($i = 0; $i < $nbr; $i++) {
    print "<br> <td id='details'>" . $data [$i]->nom . "</td>";
    print "<br> <td id='details'>" . $data [$i]->prenom . "</td>";
    print "<br> <td id='details'>" . $data [$i]->date . "</td>";
    print "<br> <td id='details'>" . $data [$i]->code_postal . "</td>";
    print "<br> <td id='details'>" . $data [$i]->ville . "</td>";
    print"</tr>";
}

print "</table>";
print "</div>";

print "</section>";
print "</div>";  // Ajout de cette ligne

?>
