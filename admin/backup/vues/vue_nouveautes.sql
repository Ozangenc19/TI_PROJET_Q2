create view public.vue_nouveautes AS
 SELECT nouveaute.id_nouveaute,
 		nouveaute.nom_nouveaute,
		nouveaute.prix_nouveaute,
		nouveaute.description_nouveaute,
		nouveaute.image_nouveaute
 FROM nouveaute;