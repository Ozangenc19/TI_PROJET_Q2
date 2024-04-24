
<?php
$cat = new NouveauteDB($cnx);
$liste = $cat->getAllNouveautes();
$nbr_cat = count($liste);

?>
<?php
print "<div id='nouveaute'>";
print "<p3>Voici nos nouveautés</p3> ";
print "</div>";
?>
<br>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Liste des Nouveautes</title>
    <link href="./admin/public/css/nouveaute.css" rel="stylesheet" type="text/css">
    <script src="./admin/public/js/nouveaute.js" defer></script>
</head>
<body>
<div class="nouveau_grids">
    <?php
    for ($i = 0; $i < $nbr_cat; $i++) {
        ?>
        <div class="nouveau_grid">
            <img src="<?php echo $liste[$i]->image_nouveaute; ?>" alt="<?php echo $liste[$i]->nom_nouveaute; ?>" class="article-image">
            <h3><?php echo $liste[$i]->nom_nouveaute . " pour " . $liste[$i]->prix_nouveaute . " € "?></h3>
            <button class="button_nouveau" onclick="afficherDescription(<?php echo $i; ?>)">Afficher la description</button>
            <div class="desc_color" id="description<?php echo $i; ?>" style="display: none;">
                <?php echo $liste[$i]->description_nouveaute; ?>
            </div>
        </div>
        <?php
    }
    ?>
</div>
</body>
</html>
