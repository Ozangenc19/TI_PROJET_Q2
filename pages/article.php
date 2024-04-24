

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


<link href="./admin/public/css/article.css" rel="stylesheet" type="text/css">
<div class="article-grids">
    <?php

    for($i=0; $i < $nbr_cat; $i++){
        ?>
        <div class="article-grid">
            <div class="desc_color" id="" >
                <img src="./admin/public/images/<?= $liste[$i]->image_article;?>" alt="">

            </div>
            <?php echo $liste[$i]->nom_article. " pour " .$liste[$i]->prix_article . " € "?>
            
        </div>
        <?php
    }
    ?>
</div>
