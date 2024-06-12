$(document).ready(function(){
    $("#FormulaireContact").submit(function(event){
        event.preventDefault();

        // Récupération des valeurs des champs
        var name = $("#name").val();
        var firstname = $("#firstname").val();
        var email = $("#email").val();
        var problemType = $("#problemType").val();
        var message = $("#message").val();


        if(name === '' || email === '' || message === ''){
            $("#reponse").html("Veuillez remplir tous les champs.");
        } else if (!isValidEmail(email)) {
            $("#reponse").html("Veuillez entrer une adresse email valide.");
        } else {
            // Envoi des données via AJAX (simulé ici)
            setTimeout(function(){
                $("#reponse").html("Merci " + name + " " + firstname + ", votre message a été envoyé !<br>" +
                    "Type de problème : " + problemType + "<br>" +
                    "Description du problème : " + message);

                $("#name").val('');
                $("#firstname").val('');
                $("#email").val('');
                $("#problemType").val('Problème de Livraison');
                $("#message").val('');
            }, 1000);
        }
    });

    function isValidEmail(email) {
        var re = /\S+@\S+\.\S+/;
        return re.test(email);
    }
});


