
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



<div class="creation_grids">
    <?php

    for($i=0; $i < $nbr_cat; $i++){
        ?>
        <div class="creation_grid">
            <div class="desc_color" id="" >
                <img src="./admin/public/images/<?= $liste[$i]->image_creation;?>" alt="">

            </div>
            <?php echo $liste[$i]->nom_creation. " pour " .$liste[$i]->prix_creation . " € " ?>

        </div>
        <?php
    }
    ?>
</div>

