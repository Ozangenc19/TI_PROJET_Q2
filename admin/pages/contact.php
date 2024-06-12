<link href="./public/css/contact.css" rel="stylesheet" type="text/css">

<div class="container">
    <h2>Formulaire de Contact</h2>
    <hr>
    <form id="FormulaireContact">
        <label for="name">Nom:</label>
        <input type="text" id="name" name="name"><br>

        <label for="name">Prenom:</label>
        <input type="text" id="firstname" name="firstname"><br>

        <label for="email">Email:</label>
        <input type="email" id="email" name="email"><br>

        <label for="problemType">Type de Problème:</label>
        <select id="problemType" name="problemType">
            <option value="Problème de Livraison">Problème de Livraison</option>
            <option value="Vêtement défectueux">Vêtement défectueux</option>
            <option value="Autre">Autre</option>
        </select><br>

        <label for="message">Description du Problème :</label><br>
        <textarea id="message" name="message" rows="4" cols="50"></textarea><br>

        <input type="submit" value="Envoyer">
    </form>
    <div id="reponse"></div>
</div>
