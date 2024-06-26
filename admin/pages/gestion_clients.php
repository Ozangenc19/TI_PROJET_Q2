<h2>Gestion des clients</h2>
<a id="ajout_client" href="index_.php?page=ajout_client.php">Nouveau client</a><br>
<?php

$clients = new ClientDB($cnx);
$liste = $clients->getAllClients();
//var_dump($liste);
$nbr = count($liste);

if($nbr == 0){
    print "<br>Aucun client encodé<br>";
}
else{
    ?>
    <table class="table table-striped">
        <thead>

        <tr>
            <th scope="col">Id</th>
            <th scope="col">Nom</th>
            <th scope="col">Prénom</th>
            <th scope="col">Email</th>
            <th scope="col">Adresse</th>
            <th scope="col">Numéro</th>
            <th scope="col">Modifier</th>
            <th scope="col">Supprimer</th>
        </tr>

        </thead>
        <tbody>
        <?php
        for($i=0; $i < $nbr; $i++){
        ?>
        <tr>
            <th><?= $liste[$i]->id_client;?></th>
            <td contenteditable="true" id="<?= $liste[$i]->id_client;?>" name="nom_client"><?= $liste[$i]->nom_client;?></td>
            <td contenteditable="true" id="<?= $liste[$i]->id_client;?>" name="prenom_client"><?= $liste[$i]->prenom_client;?></td>
            <td contenteditable="true" id="<?= $liste[$i]->id_client;?>" name="email"><?= $liste[$i]->email;?></td>
            <td contenteditable="true" id="<?= $liste[$i]->id_client;?>" name="adresse"><?= $liste[$i]->adresse;?></td>
            <td contenteditable="true" id="<?= $liste[$i]->id_client;?>" name="numero"><?= $liste[$i]->numero;?></td>


            <td class="modif_td">
                <button data-id="<?= $liste[$i]->id_client; ?>" class="btn btn_modif"><a href="index_.php?id_client=<?php print $liste[$i]->id_client;?>&page=modifier_client.php"><i class="bi bi-brush modif"></i>Modifier</a></button>
            </td>
            <td class="delete_td">
                <button data-id="<?= $liste[$i]->id_client; ?>" class="btn btn_delete"><i class="bi bi-trash3-fill delete"></i>Supprimer</button>
            </td>
        </tr>



            <?php
        }
        ?>

        </tbody>
    </table>

<?php

}

