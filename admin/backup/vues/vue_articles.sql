create view public.vue_articles AS
 SELECT article.id_article,
 		article.nom_article,
		article.prix_article,
		article.image_article
 FROM public.article;