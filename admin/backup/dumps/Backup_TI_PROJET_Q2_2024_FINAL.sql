--
-- PostgreSQL database dump
--

-- Dumped from database version 16.2
-- Dumped by pg_dump version 16.2

-- Started on 2024-06-12 22:26:03

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 4 (class 2615 OID 2200)
-- Name: public; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA public;


--
-- TOC entry 4912 (class 0 OID 0)
-- Dependencies: 4
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON SCHEMA public IS 'standard public schema';


--
-- TOC entry 230 (class 1255 OID 24793)
-- Name: ajout_admin(text, text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.ajout_admin(text, text) RETURNS integer
    LANGUAGE plpgsql
    AS '
  declare p_nom alias for $1;
  declare p_password alias for $2;
  declare id integer;
  declare retour integer;
  
  begin
  	select into id id_admin from admin where nom_admin = p_nom and password = p_password;
	if not found
	then
	  insert into admin (nom_admin,password) values (p_nom,p_password);
	  if not found
	  then
	  
	    retour = -1; -- échec insertion
	  else
	    retour = 1; -- insertion réussie
	  end if;
	else
	  retour = 0; --déjà en BD
	end if;
	
	return retour;
end;
';


--
-- TOC entry 237 (class 1255 OID 24838)
-- Name: ajout_client(text, text, text, text, text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.ajout_client(text, text, text, text, text) RETURNS integer
    LANGUAGE plpgsql
    AS '
  declare p_nom alias for $1;
  declare p_prenom alias for $2;
  declare p_email alias for $3;
  declare p_adresse alias for $4;
  declare p_numero alias for $5;
  declare id integer;
  declare retour integer;
  
begin
	select into id id_client from client where email = p_email;
	if not found
	then
	  insert into client (nom_client,prenom_client,email,adresse,numero) values
	    (p_nom,p_prenom,p_email,p_adresse,p_numero);
	  select into id id_client from client where email = p_email;
	  if not found
	  then	
	    retour = -1;  --échec de la requête
	  else
	    retour = 1;   -- insertion ok
	  end if;
	else
	  retour = 0;      -- déjà en BD
	end if;
 return retour;
 end;
';


--
-- TOC entry 232 (class 1255 OID 24896)
-- Name: delete_client(integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.delete_client(integer) RETURNS integer
    LANGUAGE plpgsql
    AS '
	declare p_id alias for $1;
	declare retour integer;
BEGIN
	delete from client where id_client=p_id;
	RETURN 1;
END;
';


--
-- TOC entry 244 (class 1255 OID 24902)
-- Name: delete_clientt(integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.delete_clientt(integer) RETURNS integer
    LANGUAGE plpgsql
    AS '
	declare p_id alias for $1;
	declare retour integer;
BEGIN
	delete from client where id_client=p_id;
	RETURN 1;
END;
';


--
-- TOC entry 246 (class 1255 OID 24901)
-- Name: update_client(integer, text, text, text, text, text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.update_client(integer, text, text, text, text, text) RETURNS integer
    LANGUAGE plpgsql
    AS '
	declare p_id alias for $1;
	declare p_email alias for $2;
	declare p_nom_client alias for $3;
	declare p_prenom_client alias for $4;
	declare p_adresse alias for $5;
	declare p_numero alias for $6;
	
	declare id integer;
	declare retour integer;
begin
	select into id id_client from client where id_client = p_id;
	if found 
	then
		update client
		set nom_client = p_nom_client, 
		prenom_client = p_prenom_client,
		email = p_email,
		adresse = p_adresse,
		numero = p_numero
		where id_client= p_id;
		select into id id_client from client where id_client = p_id;
		if not found
		then	
	    	retour = -1;  --échec de la requête
	  	else
	    	retour = 1;   -- modification ok
	  	end if;
	else
		retour=0;
	end if;
	return retour;
end;
';


--
-- TOC entry 231 (class 1255 OID 24794)
-- Name: verifier_admin(text, text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.verifier_admin(text, text) RETURNS integer
    LANGUAGE plpgsql
    AS '
  DECLARE p_login ALIAS FOR $1;
  DECLARE p_pass ALIAS for $2;
  DECLARE id integer;
  DECLARE retour integer;
BEGIN
  select into id id_admin from admin where nom_admin = p_login and password = p_pass;
  IF NOT FOUND
  THEN
    retour = 0;
  ELSE
    retour = 1;
  END IF;
   return retour;
 end;
  
';


--
-- TOC entry 215 (class 1259 OID 24780)
-- Name: admin_id_admin_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.admin_id_admin_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 217 (class 1259 OID 24795)
-- Name: admin; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.admin (
    id_admin integer DEFAULT nextval('public.admin_id_admin_seq'::regclass) NOT NULL,
    nom_admin text NOT NULL,
    password text NOT NULL
);


--
-- TOC entry 220 (class 1259 OID 24812)
-- Name: article; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.article (
    id_article integer NOT NULL,
    nom_article text NOT NULL,
    prix_article double precision NOT NULL,
    image_article text
);


--
-- TOC entry 219 (class 1259 OID 24811)
-- Name: article_id_article_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.article_id_article_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 4913 (class 0 OID 0)
-- Dependencies: 219
-- Name: article_id_article_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.article_id_article_seq OWNED BY public.article.id_article;


--
-- TOC entry 218 (class 1259 OID 24800)
-- Name: client; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.client (
    id_client integer DEFAULT nextval('public.admin_id_admin_seq'::regclass) NOT NULL,
    nom_client text NOT NULL,
    prenom_client text NOT NULL,
    email text NOT NULL,
    adresse text NOT NULL,
    numero text NOT NULL,
    id_ville integer,
    password text
);


--
-- TOC entry 216 (class 1259 OID 24789)
-- Name: client_id_client_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.client_id_client_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 222 (class 1259 OID 24821)
-- Name: creation; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.creation (
    id_creation integer NOT NULL,
    nom_creation text NOT NULL,
    prix_creation double precision NOT NULL,
    image_creation text
);


--
-- TOC entry 221 (class 1259 OID 24820)
-- Name: creation_id_creation_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.creation_id_creation_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 4914 (class 0 OID 0)
-- Dependencies: 221
-- Name: creation_id_creation_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.creation_id_creation_seq OWNED BY public.creation.id_creation;


--
-- TOC entry 224 (class 1259 OID 24830)
-- Name: nouveaute; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.nouveaute (
    id_nouveaute integer NOT NULL,
    nom_nouveaute text NOT NULL,
    prix_nouveaute double precision NOT NULL,
    description_nouveaute text NOT NULL,
    image_nouveaute text
);


--
-- TOC entry 223 (class 1259 OID 24829)
-- Name: nouveaute_id_nouveaute_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.nouveaute_id_nouveaute_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 4915 (class 0 OID 0)
-- Dependencies: 223
-- Name: nouveaute_id_nouveaute_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.nouveaute_id_nouveaute_seq OWNED BY public.nouveaute.id_nouveaute;


--
-- TOC entry 228 (class 1259 OID 24891)
-- Name: panier; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.panier (
    id_panier integer NOT NULL,
    nom_produit_panier text NOT NULL,
    prix_unitaire double precision,
    description_produit_panier text NOT NULL,
    image_produit_panier text,
    quantite text NOT NULL,
    id_article integer NOT NULL,
    id_creation integer NOT NULL,
    id_nouveaute integer NOT NULL,
    id_client integer NOT NULL
);


--
-- TOC entry 225 (class 1259 OID 24849)
-- Name: vue_articles; Type: VIEW; Schema: public; Owner: -
--

CREATE VIEW public.vue_articles AS
 SELECT id_article,
    nom_article,
    prix_article,
    image_article
   FROM public.article;


--
-- TOC entry 229 (class 1259 OID 24897)
-- Name: vue_clients; Type: VIEW; Schema: public; Owner: -
--

CREATE VIEW public.vue_clients AS
 SELECT id_client,
    nom_client,
    prenom_client,
    email,
    adresse,
    numero
   FROM public.client;


--
-- TOC entry 226 (class 1259 OID 24878)
-- Name: vue_creations; Type: VIEW; Schema: public; Owner: -
--

CREATE VIEW public.vue_creations AS
 SELECT id_creation,
    nom_creation,
    prix_creation,
    image_creation
   FROM public.creation;


--
-- TOC entry 227 (class 1259 OID 24882)
-- Name: vue_nouveautes; Type: VIEW; Schema: public; Owner: -
--

CREATE VIEW public.vue_nouveautes AS
 SELECT id_nouveaute,
    nom_nouveaute,
    prix_nouveaute,
    description_nouveaute,
    image_nouveaute
   FROM public.nouveaute;


--
-- TOC entry 4736 (class 2604 OID 24815)
-- Name: article id_article; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.article ALTER COLUMN id_article SET DEFAULT nextval('public.article_id_article_seq'::regclass);


--
-- TOC entry 4737 (class 2604 OID 24824)
-- Name: creation id_creation; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.creation ALTER COLUMN id_creation SET DEFAULT nextval('public.creation_id_creation_seq'::regclass);


--
-- TOC entry 4738 (class 2604 OID 24833)
-- Name: nouveaute id_nouveaute; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.nouveaute ALTER COLUMN id_nouveaute SET DEFAULT nextval('public.nouveaute_id_nouveaute_seq'::regclass);


--
-- TOC entry 4898 (class 0 OID 24795)
-- Dependencies: 217
-- Data for Name: admin; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.admin (id_admin, nom_admin, password) VALUES (1, 'Ozan', 'Ozan');


--
-- TOC entry 4901 (class 0 OID 24812)
-- Dependencies: 220
-- Data for Name: article; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.article (id_article, nom_article, prix_article, image_article) VALUES (1, 'Robe Belair crème à paillettes', 46, 'image1.jpg');
INSERT INTO public.article (id_article, nom_article, prix_article, image_article) VALUES (2, 'Combinaison Sina - CREATION', 39, 'image2.jpg');
INSERT INTO public.article (id_article, nom_article, prix_article, image_article) VALUES (3, 'Bomber Ivania doré', 64, 'image3.jpg');
INSERT INTO public.article (id_article, nom_article, prix_article, image_article) VALUES (4, 'Veste Masha noire à paillettes argentées', 39, 'image4.jpg');
INSERT INTO public.article (id_article, nom_article, prix_article, image_article) VALUES (5, 'Robe Evolia mauve plissée', 36, 'image5.jpg');
INSERT INTO public.article (id_article, nom_article, prix_article, image_article) VALUES (6, 'Manteau Paul à mouton beige', 65, 'image6.jpg');
INSERT INTO public.article (id_article, nom_article, prix_article, image_article) VALUES (7, 'Gilet Rebecca vert', 39, 'image7.jpg');
INSERT INTO public.article (id_article, nom_article, prix_article, image_article) VALUES (8, 'Veste Kath dorée à paillettes', 45, 'image8.jpg');
INSERT INTO public.article (id_article, nom_article, prix_article, image_article) VALUES (9, 'Sac Irina brillant avec perles noires et écrues', 36, 'acces1.jpg');
INSERT INTO public.article (id_article, nom_article, prix_article, image_article) VALUES (10, 'Cordon de téléphone Flore argenté', 10, 'acces2.jpg');
INSERT INTO public.article (id_article, nom_article, prix_article, image_article) VALUES (11, 'Bonnet Sama rose', 16, 'acces3.jpg');


--
-- TOC entry 4899 (class 0 OID 24800)
-- Dependencies: 218
-- Data for Name: client; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.client (id_client, nom_client, prenom_client, email, adresse, numero, id_ville, password) VALUES (14, 'Dupont', 'Jean', 'jeandupont@gmail.com', 'Rue du pont', '44', NULL, NULL);
INSERT INTO public.client (id_client, nom_client, prenom_client, email, adresse, numero, id_ville, password) VALUES (18, 'Genc', 'Ozan', 'Ozantrb61ziganoylu@gmail.com', '19 Rue de la Gare de Bouvy', '61', NULL, NULL);


--
-- TOC entry 4903 (class 0 OID 24821)
-- Dependencies: 222
-- Data for Name: creation; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.creation (id_creation, nom_creation, prix_creation, image_creation) VALUES (1, 'Boite à bijoux - Petit modèle', 2.5, 'creation1.jpg');
INSERT INTO public.creation (id_creation, nom_creation, prix_creation, image_creation) VALUES (2, 'Boite à bijoux - Grand modèle', 2.5, 'creation2.jpg');
INSERT INTO public.creation (id_creation, nom_creation, prix_creation, image_creation) VALUES (3, 'Pochette Easy Clothes fuchsia en lin - CREATION', 16, 'creation3.jpg');
INSERT INTO public.creation (id_creation, nom_creation, prix_creation, image_creation) VALUES (4, 'Tote bag Easy Clothes à lignes', 5, 'creation4.jpg');
INSERT INTO public.creation (id_creation, nom_creation, prix_creation, image_creation) VALUES (5, 'Sac cabas EASY CLOTHES', 8, 'creation5.jpg');
INSERT INTO public.creation (id_creation, nom_creation, prix_creation, image_creation) VALUES (6, 'Tote bag Easy Clothes gris à coeurs', 7, 'creation6.jpg');
INSERT INTO public.creation (id_creation, nom_creation, prix_creation, image_creation) VALUES (7, 'Parfum - Première rencontre - CREATION EASY CLOTHES', 35, 'creation7.jpg');
INSERT INTO public.creation (id_creation, nom_creation, prix_creation, image_creation) VALUES (8, 'Tote bag " Always with passion"', 5, 'creation8.jpg');
INSERT INTO public.creation (id_creation, nom_creation, prix_creation, image_creation) VALUES (9, 'Emballage cadeau', 1, 'creation9.jpg');


--
-- TOC entry 4905 (class 0 OID 24830)
-- Dependencies: 224
-- Data for Name: nouveaute; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.nouveaute (id_nouveaute, nom_nouveaute, prix_nouveaute, description_nouveaute, image_nouveaute) VALUES (1, 'Manteau Mathias taupe', 65, 'Manteau RÉVERSIBLE Ophélie mesure 1m68 et porte habituellement une taille une taille S', 'nv1.jpg');
INSERT INTO public.nouveaute (id_nouveaute, nom_nouveaute, prix_nouveaute, description_nouveaute, image_nouveaute) VALUES (2, 'Pull Fanchon écru et bleu', 32, 'Col montant Légèrement court Ophélie mesure 1m68 et porte habituellement une taille S', 'nv2.jpg');
INSERT INTO public.nouveaute (id_nouveaute, nom_nouveaute, prix_nouveaute, description_nouveaute, image_nouveaute) VALUES (3, 'Pull Rainbow beige écru', 38, ' Col rond Manches longues Ophélie mesure 1m68 et porte une taille S-M', 'nv3.jpg');
INSERT INTO public.nouveaute (id_nouveaute, nom_nouveaute, prix_nouveaute, description_nouveaute, image_nouveaute) VALUES (4, 'Pull Joe gris à lignes écrues', 36, 'Col rond Légèrement loose Ophélie mesure 1m68 et porte habituellement une taille S Notre modèle', 'nv4.jpg');
INSERT INTO public.nouveaute (id_nouveaute, nom_nouveaute, prix_nouveaute, description_nouveaute, image_nouveaute) VALUES (5, 'Pull Camélia noir Oversize', 37, 'Sweat loose Manches ballons Ophélie mesure 1m68 et porte habituellement une taille S', 'nv5.jpg');
INSERT INTO public.nouveaute (id_nouveaute, nom_nouveaute, prix_nouveaute, description_nouveaute, image_nouveaute) VALUES (6, 'Pull Ayem noir à paillettes', 39, 'Paillettes et perles sur les épaules et buste Col rond Ophélie mesure 1m68 et porte habituellement une taille S Légèrement moulant', 'nv6.jpg');
INSERT INTO public.nouveaute (id_nouveaute, nom_nouveaute, prix_nouveaute, description_nouveaute, image_nouveaute) VALUES (7, 'Manteau Nehuda taupe', 62, 'Manches longues Mouton taupe Ophélie mesure 1m68 et porte une taille S-M Légèrement retroussée dans le bas', 'nv7.jpg');
INSERT INTO public.nouveaute (id_nouveaute, nom_nouveaute, prix_nouveaute, description_nouveaute, image_nouveaute) VALUES (8, 'Blouse Leya écrue et brune', 32, 'Manches longues Motifs écrus et bruns Ophélie mesure 1m68 et porte une taille S Notre modèle porte le jeans Warry bleu', 'nv8.jpg');
INSERT INTO public.nouveaute (id_nouveaute, nom_nouveaute, prix_nouveaute, description_nouveaute, image_nouveaute) VALUES (9, 'Manteau Billy beige et vert', 62, 'Manches longues Effet matelassé vert Mouton beige Ophélie mesure 1m68 et porte une taille S-M Non réversible', 'nv9.jpg');


--
-- TOC entry 4906 (class 0 OID 24891)
-- Dependencies: 228
-- Data for Name: panier; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 4916 (class 0 OID 0)
-- Dependencies: 215
-- Name: admin_id_admin_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.admin_id_admin_seq', 18, true);


--
-- TOC entry 4917 (class 0 OID 0)
-- Dependencies: 219
-- Name: article_id_article_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.article_id_article_seq', 1, false);


--
-- TOC entry 4918 (class 0 OID 0)
-- Dependencies: 216
-- Name: client_id_client_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.client_id_client_seq', 1, false);


--
-- TOC entry 4919 (class 0 OID 0)
-- Dependencies: 221
-- Name: creation_id_creation_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.creation_id_creation_seq', 1, false);


--
-- TOC entry 4920 (class 0 OID 0)
-- Dependencies: 223
-- Name: nouveaute_id_nouveaute_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.nouveaute_id_nouveaute_seq', 1, false);


--
-- TOC entry 4740 (class 2606 OID 24807)
-- Name: admin admin_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.admin
    ADD CONSTRAINT admin_pkey PRIMARY KEY (id_admin);


--
-- TOC entry 4744 (class 2606 OID 24819)
-- Name: article article_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.article
    ADD CONSTRAINT article_pkey PRIMARY KEY (id_article);


--
-- TOC entry 4742 (class 2606 OID 24810)
-- Name: client client_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.client
    ADD CONSTRAINT client_pkey PRIMARY KEY (id_client);


--
-- TOC entry 4746 (class 2606 OID 24828)
-- Name: creation creation_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.creation
    ADD CONSTRAINT creation_pkey PRIMARY KEY (id_creation);


--
-- TOC entry 4748 (class 2606 OID 24837)
-- Name: nouveaute nouveaute_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.nouveaute
    ADD CONSTRAINT nouveaute_pkey PRIMARY KEY (id_nouveaute);


-- Completed on 2024-06-12 22:26:03

--
-- PostgreSQL database dump complete
--

