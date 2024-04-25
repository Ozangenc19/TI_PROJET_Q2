
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

<div class="nouveau_grids">
    <?php
    for ($i = 0; $i < $nbr_cat; $i++) {
        ?>
        <div class="nouveau_grid">
            <div class="desc_color" id="" >
                <img src="./admin/public/images/<?= $liste[$i]->image_nouveaute;?>" alt="">

            </div>
            <?php echo $liste[$i]->nom_nouveaute. " pour " . $liste[$i]->prix_nouveaute . " € "?>
            <button class="button_nouveau" onclick="afficherDescription(<?php echo $i; ?>)">Afficher la description</button>
            <div class="desc_color" id="description<?php echo $i; ?>" style="display: none;">
                <?php echo $liste[$i]->description_nouveaute; ?>
            </div>

        </div>
        <?php
    }
    ?>
</div>

