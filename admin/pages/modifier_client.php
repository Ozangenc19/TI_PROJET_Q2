<?php
require 'src/php/utils/verifier_connexion.php';
$clients = new ClientDB($cnx);
$id_client = $_GET['id_client'];
$liste = $clients->getClientById($id_client);
if ($liste) {
    $id = $liste[0]->id_client;
    $nom = $liste[0]->nom_client;
    $prenom = $liste[0]->prenom_client;
    $email = $liste[0]->email;
    $adresse = $liste[0]->adresse;
    $numero = $liste[0]->numero;
}
?>

<h2>Modifier un client</h2>
<br>
<div class="container">
    <form method="get" id="formulaire_modifierClient" action="">

        <div class="form-group row mb-3">
            <label for="nom" class="col-sm-2 col-form-label">Prenom</label>
            <div class="col-sm-10">
                <input type="hidden" name="id" id="id" value="<?= $id; ?>">
                <input type="text" class="form-control" id="email" name="email" placeholder="email"
                       value="<?= $prenom; ?>">
            </div>
        </div>
        <div class="form-group row mb-3">
            <label for="email" class="col-sm-2 col-form-label">Email</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" id="nom" name="nom" placeholder="nom" value="<?= $email; ?>">
            </div>
        </div>
        <div class="form-group row mb-3">
            <label for="prenom" class="col-sm-2 col-form-label">Nom</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" id="prenom" name="prenom" placeholder="prenom" value="<?= $nom; ?>">
            </div>
        </div>
        <div class="form-group row mb-3">
            <label for="adresse" class="col-sm-2 col-form-label">Adresse</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" id="adresse" name="adresse" placeholder="adresse" value="<?= $adresse; ?>">
            </div>
        </div>
        <div class="form-group row mb-3">
            <label for="numero" class="col-sm-2 col-form-label">Numéro</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" id="numero" name="numero" placeholder="numero" value="<?= $numero; ?>">
            </div>
        </div>
        <br>
        <button type="submit" class="btn btn-outline-success" id="btn_modif">Modifier</button>
        <button type="reset" id="reset" class="btn btn-outline-success">Annuler</button>
    </form>
</div>
