<?php
session_start();
require './admin/src/php/utils/liste_includes.php';
?>
<!doctype html>
<html lang="fr">
<head>
    <link rel="shortcut icon" href="//www.deshabitsetnous.be/cdn/shop/files/deshabitsetnousfavicon_32x32.png?v=1643809034" type="image/png">    <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css">


    <title>Easy Clothes</title>
    <meta charset="utf-8">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js" integrity="sha512-v2CJ7UaYy4JwqLDIrZUI/4hqeoQieOmAZNXBeQyjo21dadnwR+8ZaIJVT8EE2iyI61OV8e6M8PP2/4hpQINQ/g==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css">

    <link rel="stylesheet" href="admin/public/css/public.css" type="text/css">
    <script src="./admin/public/js/nouveaute.js" defer></script>
    <script src="./admin/public/js/fonctions.js"></script>
</head>
<body>
<div class="container">
    <header id="header">
    </header>

    <nav id="menu">
        <?php
        if (file_exists('./admin/src/php/utils/menu_public.php')) {
            include './admin/src/php/utils/menu_public.php';
        }
        ?>
    </nav>
    <div id="contenu">
        <?php
        //si aucune variable de session 'page'
        if (!isset($_SESSION['page'])) {
            $_SESSION['page'] = './pages/accueil.php';
        }
        if (isset($_GET['page'])) {
            //print "<br>paramètre page : ".$_GET['page']."<br>";
            $_SESSION['page'] = 'pages/'.$_GET['page'];
        }
        if (file_exists($_SESSION['page'])) {
            include $_SESSION['page'];
        } else {
            include './pages/page404.php';
        }
        ?>
    </div>

</div>

<footer class="footer">

    <div class="footer-container">
        <div class="row">
            <div class="footer-colonne">
                <h4>Contactez-nous</h4>
                <ul>
                    <li>Tél: 0490.10.10.10</li>
                    <li>Email: easyclothes.store@outlook.com</li>
                    <li>Responsable: Ozan Genc</li>
                </ul>
            </div>

            <div class="footer-colonne">
                <h4>Suivez-nous</h4>
                <div class="lien-social">
                    <a id="facebook" href="https://www.facebook.com/Easy.Clothes.MG/"><i class="fab fa-facebook-f"></i></a>
                    <a id="instagram" href="https://www.instagram.com/easyclothesvetements/?hl=fr"><i
                                class="fab fa-instagram"></i></a>
                    <a id="twitter"
                       href="https://twitter.com/EasyClothesUsa?ref_src=twsrc%5Egoogle%7Ctwcamp%5Eserp%7Ctwgr%5Eauthor"><i
                                class="fab fa-twitter"></i></a>
                </div>
            </div>
        </div>
    </div>
</footer>

</body>

</html>
