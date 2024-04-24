

<?php
$cat = new ArticleDB($cnx);
$liste = $cat->getAllArticles();
$nbr_cat = count($liste);

?>
<?php
print "<div id='article'>";
    print "<p4>Voici nos articles</p4> ";
    print "</div>";
   ?>
<br>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Liste des Articles</title>
    <link href="./admin/public/css/article.css" rel="stylesheet" type="text/css">
</head>
<body>
<div class="article-grids">
    <?php

    for($i=0; $i < $nbr_cat; $i++){
        ?>
        <div class="article-grid">
            <img src="<?php echo $liste[$i]->image_article; ?>" alt="<?php echo $liste[$i]->nom_article; ?>" class="article-image">
            <h3><?php echo $liste[$i]->nom_article. " pour " .$liste[$i]->prix_article . " € "?></h3>

        </div>
        <?php
    }
    ?>
</div>
</body>
</html>
