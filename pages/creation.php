
<?php
$cat = new CreationDB($cnx);
$liste = $cat->getAllCreations();
$nbr_cat = count($liste);

?>

<?php
print "<div id='creation'>";
print "<p4>Voici nos créations</p4> ";
print "</div>";
?>
<br>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Liste des Creations</title>
    <link href="./admin/public/css/article.css" rel="stylesheet" type="text/css">
</head>
<body>
<div class="creation_grids">
    <?php

    for($i=0; $i < $nbr_cat; $i++){
        ?>
        <div class="creation_grid">
            <img src="<?php echo $liste[$i]->image_creation; ?>" alt="<?php echo $liste[$i]->nom_creation; ?>" class="article-image">
            <h3><?php echo $liste[$i]->nom_creation. " pour " .$liste[$i]->prix_creation . " € "?></h3>

        </div>
        <?php
    }
    ?>
</div>
</body>
</html>
