$(document).ready(function () {

    $('#texte_bouton_submit').text("Insérer ou mettre à jour");


    //quand une balise contient des atttributs,
    //cette balise est un tableau
    $("td[id]").click(function () {
        //trim : supprimer les blancs avant et après
        let valeur1 = $.trim($(this).text());
        let id = $(this).attr('id');
        let name = $(this).attr('name');
        console.log(valeur1 + " id = " + id + " name = " + name);
        $(this).blur(function () {
            let valeur2 = $.trim($(this).text());
            if (valeur1 != valeur2) {
                let parametre = "id=" + id + "&name=" + name + "&valeur=" + valeur2;
                let retour = $.ajax({
                    type: 'get',
                    dataType: 'json',
                    data: parametre,
                    url: './src/php/ajax/ajaxUpdateClient.php',
                    success: function (data) {//data = retour du # php
                        console.log(data);
                    }
                })
            }
        })
    })


    $('#texte_bouton_submit').text("Ajouter ou mettre à jour");

    $('#reset').click(function () {
        $('#texte_bouton_submit').text("Ajouter ou mettre à jour");
    })


    $('#texte_bouton_submit').click(function (e) { //e = formulaire
        e.preventDefault(); //empêcher l'attribut action de form
        let email = $('#email').val();
        let nom = $('#nom').val();
        let prenom = $('#prenom').val();
        let adresse = $('#adresse').val();
        let numero = $('#numero').val();
        let param = 'email=' + email + '&nom=' + nom + '&prenom=' + prenom + '&adresse=' + adresse + '&numero=' + numero;
        let retour = $.ajax({
            type: 'get',
            dataType: 'json',
            data: param,
            url: './src/php/ajax/ajaxAjoutClient.php',
            success: function (data) {//data = retour du # php
                console.log(data);
            }
        })
    })

    $('#email').blur(function () {
        let email = $(this).val();
        console.log("email : " + email);
        let parametre = 'email=' + email;
        let retour = $.ajax({
            type: 'get',
            dataType: 'json',
            data: parametre,
            url: './src/php/ajax/ajaxRechercheClient.php',
            success: function (data) {//data = retour du # php
                console.log(data);

                $('#nom').val(data[0].nom_client);
                $('#prenom').val(data[0].prenom_client);
                $('#adresse').val(data[0].adresse);
                $('#numero').val(data[0].numero);
                $('#texte_bouton_submit').text("Mettre à jour");

                let nom2 = $('#nom').val();
                if (nom2 === '') {
                    $('#texte_bouton_submit').text("Ajouter");
                }

            }
        })
    })


    $('#vie').hide();
    $('#para1').hide();
    $('#deuxieme').hide();
    $('#troisieme').hide();
    $('#quatrieme').hide();
    $('#cinquieme').hide();
    $('#cacher').hide();
    $('#montrer_image').hide();

    $('h1').click(function () {
        $('#vie').show();
        $(this).css('color', 'white');
    })

    $('#vie').mouseover(function () {
        $(this).css({
            'font-weight': 'bold',
            'font-style': 'italic',
            'color': '#606368'
        });
        $(this).mouseout(function () {
            $('#para1').show();
        })
    })

    $('#para1').click(function () {
        $('#deuxieme').slideDown('slow');


    })

    $('#para2').click(function () {
        $('#troisieme').fadeIn('slow');
    })

    $('#para3').click(function () {
        $('#quatrieme').fadeIn('fast');
    })

    $('#quatrieme').click(function () {
        $('#cinquieme').fadeIn(5000);
        $('#cacher').show();
    })

    $('#cacher').click(function () {
        $('#montrer_image').fadeIn(2000);
    })

    $('.btn_delete').click(function () {
        let id = $(this).data('id');
        $(this).closest('tr').remove();
        let param = {id: id};
        let retour = $.ajax({
            type: 'get',
            dataType: 'json',
            data: param,
            url: './src/php/ajax/ajaxDeleteClient.php',
            success: function (data) {
                console.log(data);
                console.log('Client supprimé avec succès');
            },
            error: function (data) {
                console.log(data);
                alert('Problème lors de la suppression');
            }
        });
    });


    $('#btn_modif').off('click').on('click', function (e) {
        e.preventDefault()
        let email = $('#email').val();
        let nom = $('#nom').val();
        let prenom = $('#prenom').val();
        let adresse = $('#adresse').val();
        let numero = $('#numero').val();

        let id = $('#id').val();
        let param = {id: id,nom: nom , prenom: prenom, email: email,adresse: adresse, numero: numero};
        console.log(param);
        let retour = $.ajax({
            type: 'get',
            dataType: 'json',
            data: param,
            url: './src/php/ajax/ajaxUpdateClient.php',
            success: function (data) {
                console.log(data);
                if (data.success) {
                    console.log('Client modifié avec succès');
                    window.location.href = 'index_.php?page=gestion_client.php';
                } else {
                    alert('Erreur lors de la modification: ' + data.message);
                }
            },
            error: function (data) {
                console.log(data);
                alert('Problème lors de la modification');
            }
        });
    });
});
