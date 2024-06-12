create view public.vue_creations AS
 SELECT creation.id_creation,
 		creation.nom_creation,
		creation.prix_creation,
		creation.image_creation
 FROM creation;