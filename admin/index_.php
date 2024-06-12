<?php
session_start();
require './src/php/utils/liste_includes.php';
?>
<!doctype html>
<html lang="fr">
<head>
    <link rel="shortcut icon" href="//www.deshabitsetnous.be/cdn/shop/files/deshabitsetnousfavicon_32x32.png?v=1643809034" type="image/png">
    <title>Easy Clothes - Admin</title>
    <meta charset="utf-8">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js" integrity="sha512-v2CJ7UaYy4JwqLDIrZUI/4hqeoQieOmAZNXBeQyjo21dadnwR+8ZaIJVT8EE2iyI61OV8e6M8PP2/4hpQINQ/g==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css">


    <link href="./public/css/admin.css." rel="stylesheet" type="text/css">
    <script src="./public/js/fonctions.js"></script>
    <script src="public/js/contact.js"></script>
</head>
<body>
<div class="container">
    <header id="header">
    </header>

    <nav id="menu">
        <?php
        if (file_exists('./src/php/utils/menu_admin.php')) {
            include './src/php/utils/menu_admin.php';
        }
        ?>

    </nav>
    <div id="contenu">
        <?php
        //si aucune variable de session 'page'
        if (!isset($_SESSION['page'])) {
            $_SESSION['page'] = './pages/accueil_admin.php';
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
    <footer id="footer">&nbsp;</footer>
</div>
</body>



</html>

