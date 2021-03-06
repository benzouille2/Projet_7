toc.dat                                                                                             0000600 0004000 0002000 00000105402 13622375451 0014451 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        PGDMP                            x            biblioc_bdd    10.3    11.2 �    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                       false         �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                       false         �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                       false         �           1262    69881    biblioc_bdd    DATABASE     �   CREATE DATABASE biblioc_bdd WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'French_France.1252' LC_CTYPE = 'French_France.1252';
    DROP DATABASE biblioc_bdd;
             postgres    false         �           0    0    DATABASE biblioc_bdd    ACL     F   GRANT ALL ON DATABASE biblioc_bdd TO admin_biblioc WITH GRANT OPTION;
                  postgres    false    2952         �            1255    78013     reservationexpire(date, boolean)    FUNCTION     �   CREATE FUNCTION public.reservationexpire(date_debut date, extens boolean) RETURNS date
    LANGUAGE plpgsql
    AS $$
DECLARE
BEGIN
	if extens = true then return date_debut+56;
	else return date_debut+28;
	end if;
END
$$;
 I   DROP FUNCTION public.reservationexpire(date_debut date, extens boolean);
       public       postgres    false         �            1259    69895    adresse    TABLE     �   CREATE TABLE public.adresse (
    id_adresse integer NOT NULL,
    code_postal character varying NOT NULL,
    rue character varying NOT NULL,
    num character varying NOT NULL,
    commune character varying NOT NULL
);
    DROP TABLE public.adresse;
       public         postgres    false         �           0    0    TABLE adresse    ACL     F   GRANT ALL ON TABLE public.adresse TO admin_biblioc WITH GRANT OPTION;
            public       postgres    false    199         �            1259    69893    adresse_id_adresse_seq_2    SEQUENCE     �   CREATE SEQUENCE public.adresse_id_adresse_seq_2
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.adresse_id_adresse_seq_2;
       public       postgres    false    199         �           0    0    adresse_id_adresse_seq_2    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.adresse_id_adresse_seq_2 OWNED BY public.adresse.id_adresse;
            public       postgres    false    198         �           0    0 !   SEQUENCE adresse_id_adresse_seq_2    ACL     Z   GRANT ALL ON SEQUENCE public.adresse_id_adresse_seq_2 TO admin_biblioc WITH GRANT OPTION;
            public       postgres    false    198         �            1259    69939    auteur    TABLE     �   CREATE TABLE public.auteur (
    id_auteur integer NOT NULL,
    nom character varying(50) NOT NULL,
    prenom character varying(50) NOT NULL,
    date_naissance date NOT NULL,
    date_deces date
);
    DROP TABLE public.auteur;
       public         postgres    false         �           0    0    TABLE auteur    ACL     E   GRANT ALL ON TABLE public.auteur TO admin_biblioc WITH GRANT OPTION;
            public       postgres    false    207         �            1259    69937    auteur_id_auteur_seq    SEQUENCE     }   CREATE SEQUENCE public.auteur_id_auteur_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.auteur_id_auteur_seq;
       public       postgres    false    207         �           0    0    auteur_id_auteur_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.auteur_id_auteur_seq OWNED BY public.auteur.id_auteur;
            public       postgres    false    206         �           0    0    SEQUENCE auteur_id_auteur_seq    ACL     V   GRANT ALL ON SEQUENCE public.auteur_id_auteur_seq TO admin_biblioc WITH GRANT OPTION;
            public       postgres    false    206         �            1259    77729    auteur_livre    TABLE     d   CREATE TABLE public.auteur_livre (
    auteur_id integer NOT NULL,
    livre_id integer NOT NULL
);
     DROP TABLE public.auteur_livre;
       public         postgres    false         �           0    0    TABLE auteur_livre    ACL     �   GRANT ALL ON TABLE public.auteur_livre TO admin_ocscalade WITH GRANT OPTION;
GRANT ALL ON TABLE public.auteur_livre TO admin_biblioc;
            public       postgres    false    221         �            1259    77723    bibliographie    TABLE     �   CREATE TABLE public.bibliographie (
    id_livre_auteur integer NOT NULL,
    id_auteur integer NOT NULL,
    id_livre integer NOT NULL
);
 !   DROP TABLE public.bibliographie;
       public         admin_biblioc    false         �            1259    77721 !   bibliographie_id_livre_auteur_seq    SEQUENCE     �   CREATE SEQUENCE public.bibliographie_id_livre_auteur_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 8   DROP SEQUENCE public.bibliographie_id_livre_auteur_seq;
       public       admin_biblioc    false    220         �           0    0 !   bibliographie_id_livre_auteur_seq    SEQUENCE OWNED BY     g   ALTER SEQUENCE public.bibliographie_id_livre_auteur_seq OWNED BY public.bibliographie.id_livre_auteur;
            public       admin_biblioc    false    219         �            1259    69906    bibliotheque    TABLE     �   CREATE TABLE public.bibliotheque (
    id_biblio integer NOT NULL,
    nom character varying NOT NULL,
    id_adresse integer NOT NULL
);
     DROP TABLE public.bibliotheque;
       public         postgres    false         �           0    0    TABLE bibliotheque    ACL     K   GRANT ALL ON TABLE public.bibliotheque TO admin_biblioc WITH GRANT OPTION;
            public       postgres    false    201         �            1259    69904    bibliotheque_id_biblio_seq    SEQUENCE     �   CREATE SEQUENCE public.bibliotheque_id_biblio_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.bibliotheque_id_biblio_seq;
       public       postgres    false    201         �           0    0    bibliotheque_id_biblio_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.bibliotheque_id_biblio_seq OWNED BY public.bibliotheque.id_biblio;
            public       postgres    false    200         �           0    0 #   SEQUENCE bibliotheque_id_biblio_seq    ACL     \   GRANT ALL ON SEQUENCE public.bibliotheque_id_biblio_seq TO admin_biblioc WITH GRANT OPTION;
            public       postgres    false    200         �            1259    69982    compte    TABLE     �   CREATE TABLE public.compte (
    id_compte integer NOT NULL,
    email character varying(100) NOT NULL,
    password character varying(100) NOT NULL,
    id_role integer NOT NULL,
    id_utilisateur integer NOT NULL
);
    DROP TABLE public.compte;
       public         postgres    false         �           0    0    TABLE compte    ACL     E   GRANT ALL ON TABLE public.compte TO admin_biblioc WITH GRANT OPTION;
            public       postgres    false    215         �            1259    69980    compte_id_compte_seq_1    SEQUENCE        CREATE SEQUENCE public.compte_id_compte_seq_1
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.compte_id_compte_seq_1;
       public       postgres    false    215         �           0    0    compte_id_compte_seq_1    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.compte_id_compte_seq_1 OWNED BY public.compte.id_compte;
            public       postgres    false    214         �           0    0    SEQUENCE compte_id_compte_seq_1    ACL     X   GRANT ALL ON SEQUENCE public.compte_id_compte_seq_1 TO admin_biblioc WITH GRANT OPTION;
            public       postgres    false    214         �            1259    69917    editeur    TABLE     e   CREATE TABLE public.editeur (
    id_editeur integer NOT NULL,
    nom character varying NOT NULL
);
    DROP TABLE public.editeur;
       public         postgres    false         �           0    0    TABLE editeur    ACL     F   GRANT ALL ON TABLE public.editeur TO admin_biblioc WITH GRANT OPTION;
            public       postgres    false    203         �            1259    69915    editeur_id_seq_1    SEQUENCE     y   CREATE SEQUENCE public.editeur_id_seq_1
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.editeur_id_seq_1;
       public       postgres    false    203         �           0    0    editeur_id_seq_1    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.editeur_id_seq_1 OWNED BY public.editeur.id_editeur;
            public       postgres    false    202         �           0    0    SEQUENCE editeur_id_seq_1    ACL     R   GRANT ALL ON SEQUENCE public.editeur_id_seq_1 TO admin_biblioc WITH GRANT OPTION;
            public       postgres    false    202         �            1259    69958 
   exemplaire    TABLE     �   CREATE TABLE public.exemplaire (
    id_exemplaire integer NOT NULL,
    id_livre integer NOT NULL,
    id_biblio integer NOT NULL,
    disponible boolean DEFAULT true
);
    DROP TABLE public.exemplaire;
       public         postgres    false         �           0    0    TABLE exemplaire    ACL     I   GRANT ALL ON TABLE public.exemplaire TO admin_biblioc WITH GRANT OPTION;
            public       postgres    false    211         �            1259    69956    exemplaire_id_exem_seq_1    SEQUENCE     �   CREATE SEQUENCE public.exemplaire_id_exem_seq_1
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.exemplaire_id_exem_seq_1;
       public       postgres    false    211         �           0    0    exemplaire_id_exem_seq_1    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.exemplaire_id_exem_seq_1 OWNED BY public.exemplaire.id_exemplaire;
            public       postgres    false    210         �           0    0 !   SEQUENCE exemplaire_id_exem_seq_1    ACL     Z   GRANT ALL ON SEQUENCE public.exemplaire_id_exem_seq_1 TO admin_biblioc WITH GRANT OPTION;
            public       postgres    false    210         �            1259    69928    genre    TABLE     c   CREATE TABLE public.genre (
    id_genre integer NOT NULL,
    genre character varying NOT NULL
);
    DROP TABLE public.genre;
       public         postgres    false         �           0    0    TABLE genre    ACL     D   GRANT ALL ON TABLE public.genre TO admin_biblioc WITH GRANT OPTION;
            public       postgres    false    205         �            1259    69926    genre_id_seq    SEQUENCE     u   CREATE SEQUENCE public.genre_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.genre_id_seq;
       public       postgres    false    205         �           0    0    genre_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.genre_id_seq OWNED BY public.genre.id_genre;
            public       postgres    false    204         �           0    0    SEQUENCE genre_id_seq    ACL     N   GRANT ALL ON SEQUENCE public.genre_id_seq TO admin_biblioc WITH GRANT OPTION;
            public       postgres    false    204         �            1259    70057    hibernate_sequence    SEQUENCE     {   CREATE SEQUENCE public.hibernate_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.hibernate_sequence;
       public       admin_biblioc    false         �            1259    69947    livre    TABLE     B  CREATE TABLE public.livre (
    id_livre integer NOT NULL,
    isbn13 character varying NOT NULL,
    id_genre integer NOT NULL,
    titre character varying NOT NULL,
    resume character varying(1000) NOT NULL,
    image character varying NOT NULL,
    annee_parution integer NOT NULL,
    id_editeur integer NOT NULL
);
    DROP TABLE public.livre;
       public         postgres    false         �           0    0    TABLE livre    ACL     D   GRANT ALL ON TABLE public.livre TO admin_biblioc WITH GRANT OPTION;
            public       postgres    false    209         �            1259    69945    livre_id_seq    SEQUENCE     u   CREATE SEQUENCE public.livre_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.livre_id_seq;
       public       postgres    false    209         �           0    0    livre_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.livre_id_seq OWNED BY public.livre.id_livre;
            public       postgres    false    208         �           0    0    SEQUENCE livre_id_seq    ACL     N   GRANT ALL ON SEQUENCE public.livre_id_seq TO admin_biblioc WITH GRANT OPTION;
            public       postgres    false    208         �            1259    69990    reservation    TABLE     �   CREATE TABLE public.reservation (
    id_reservation integer NOT NULL,
    id_compte integer NOT NULL,
    date_emprunt date NOT NULL,
    extension boolean NOT NULL,
    id_exemplaire integer NOT NULL,
    rendu boolean
);
    DROP TABLE public.reservation;
       public         postgres    false         �           0    0    TABLE reservation    ACL     J   GRANT ALL ON TABLE public.reservation TO admin_biblioc WITH GRANT OPTION;
            public       postgres    false    217         �            1259    69988    reservation_id_seq    SEQUENCE     {   CREATE SEQUENCE public.reservation_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.reservation_id_seq;
       public       postgres    false    217         �           0    0    reservation_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.reservation_id_seq OWNED BY public.reservation.id_reservation;
            public       postgres    false    216         �           0    0    SEQUENCE reservation_id_seq    ACL     T   GRANT ALL ON SEQUENCE public.reservation_id_seq TO admin_biblioc WITH GRANT OPTION;
            public       postgres    false    216         �            1259    69884    role    TABLE     `   CREATE TABLE public.role (
    id_role integer NOT NULL,
    role character varying NOT NULL
);
    DROP TABLE public.role;
       public         postgres    false         �           0    0 
   TABLE role    ACL     C   GRANT ALL ON TABLE public.role TO admin_biblioc WITH GRANT OPTION;
            public       postgres    false    197         �            1259    69882    role_id_seq_1    SEQUENCE     v   CREATE SEQUENCE public.role_id_seq_1
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.role_id_seq_1;
       public       postgres    false    197         �           0    0    role_id_seq_1    SEQUENCE OWNED BY     B   ALTER SEQUENCE public.role_id_seq_1 OWNED BY public.role.id_role;
            public       postgres    false    196         �           0    0    SEQUENCE role_id_seq_1    ACL     O   GRANT ALL ON SEQUENCE public.role_id_seq_1 TO admin_biblioc WITH GRANT OPTION;
            public       postgres    false    196         �            1259    69974    utilisateur    TABLE     �   CREATE TABLE public.utilisateur (
    id_utilisateur integer NOT NULL,
    nom character varying(100),
    prenom character varying(100),
    telephone double precision,
    id_adresse integer
);
    DROP TABLE public.utilisateur;
       public         postgres    false         �           0    0    TABLE utilisateur    ACL     J   GRANT ALL ON TABLE public.utilisateur TO admin_biblioc WITH GRANT OPTION;
            public       postgres    false    213         �            1259    69972    utilisateur_id_seq    SEQUENCE     {   CREATE SEQUENCE public.utilisateur_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.utilisateur_id_seq;
       public       postgres    false    213         �           0    0    utilisateur_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.utilisateur_id_seq OWNED BY public.utilisateur.id_utilisateur;
            public       postgres    false    212         �           0    0    SEQUENCE utilisateur_id_seq    ACL     T   GRANT ALL ON SEQUENCE public.utilisateur_id_seq TO admin_biblioc WITH GRANT OPTION;
            public       postgres    false    212         �
           2604    69898    adresse id_adresse    DEFAULT     z   ALTER TABLE ONLY public.adresse ALTER COLUMN id_adresse SET DEFAULT nextval('public.adresse_id_adresse_seq_2'::regclass);
 A   ALTER TABLE public.adresse ALTER COLUMN id_adresse DROP DEFAULT;
       public       postgres    false    199    198    199         �
           2604    69942    auteur id_auteur    DEFAULT     t   ALTER TABLE ONLY public.auteur ALTER COLUMN id_auteur SET DEFAULT nextval('public.auteur_id_auteur_seq'::regclass);
 ?   ALTER TABLE public.auteur ALTER COLUMN id_auteur DROP DEFAULT;
       public       postgres    false    206    207    207         �
           2604    77726    bibliographie id_livre_auteur    DEFAULT     �   ALTER TABLE ONLY public.bibliographie ALTER COLUMN id_livre_auteur SET DEFAULT nextval('public.bibliographie_id_livre_auteur_seq'::regclass);
 L   ALTER TABLE public.bibliographie ALTER COLUMN id_livre_auteur DROP DEFAULT;
       public       admin_biblioc    false    220    219    220         �
           2604    69909    bibliotheque id_biblio    DEFAULT     �   ALTER TABLE ONLY public.bibliotheque ALTER COLUMN id_biblio SET DEFAULT nextval('public.bibliotheque_id_biblio_seq'::regclass);
 E   ALTER TABLE public.bibliotheque ALTER COLUMN id_biblio DROP DEFAULT;
       public       postgres    false    200    201    201         �
           2604    69985    compte id_compte    DEFAULT     v   ALTER TABLE ONLY public.compte ALTER COLUMN id_compte SET DEFAULT nextval('public.compte_id_compte_seq_1'::regclass);
 ?   ALTER TABLE public.compte ALTER COLUMN id_compte DROP DEFAULT;
       public       postgres    false    215    214    215         �
           2604    69920    editeur id_editeur    DEFAULT     r   ALTER TABLE ONLY public.editeur ALTER COLUMN id_editeur SET DEFAULT nextval('public.editeur_id_seq_1'::regclass);
 A   ALTER TABLE public.editeur ALTER COLUMN id_editeur DROP DEFAULT;
       public       postgres    false    202    203    203         �
           2604    69961    exemplaire id_exemplaire    DEFAULT     �   ALTER TABLE ONLY public.exemplaire ALTER COLUMN id_exemplaire SET DEFAULT nextval('public.exemplaire_id_exem_seq_1'::regclass);
 G   ALTER TABLE public.exemplaire ALTER COLUMN id_exemplaire DROP DEFAULT;
       public       postgres    false    210    211    211         �
           2604    69931    genre id_genre    DEFAULT     j   ALTER TABLE ONLY public.genre ALTER COLUMN id_genre SET DEFAULT nextval('public.genre_id_seq'::regclass);
 =   ALTER TABLE public.genre ALTER COLUMN id_genre DROP DEFAULT;
       public       postgres    false    204    205    205         �
           2604    69950    livre id_livre    DEFAULT     j   ALTER TABLE ONLY public.livre ALTER COLUMN id_livre SET DEFAULT nextval('public.livre_id_seq'::regclass);
 =   ALTER TABLE public.livre ALTER COLUMN id_livre DROP DEFAULT;
       public       postgres    false    208    209    209         �
           2604    69993    reservation id_reservation    DEFAULT     |   ALTER TABLE ONLY public.reservation ALTER COLUMN id_reservation SET DEFAULT nextval('public.reservation_id_seq'::regclass);
 I   ALTER TABLE public.reservation ALTER COLUMN id_reservation DROP DEFAULT;
       public       postgres    false    216    217    217         �
           2604    69887    role id_role    DEFAULT     i   ALTER TABLE ONLY public.role ALTER COLUMN id_role SET DEFAULT nextval('public.role_id_seq_1'::regclass);
 ;   ALTER TABLE public.role ALTER COLUMN id_role DROP DEFAULT;
       public       postgres    false    197    196    197         �
           2604    69977    utilisateur id_utilisateur    DEFAULT     |   ALTER TABLE ONLY public.utilisateur ALTER COLUMN id_utilisateur SET DEFAULT nextval('public.utilisateur_id_seq'::regclass);
 I   ALTER TABLE public.utilisateur ALTER COLUMN id_utilisateur DROP DEFAULT;
       public       postgres    false    213    212    213         l          0    69895    adresse 
   TABLE DATA               M   COPY public.adresse (id_adresse, code_postal, rue, num, commune) FROM stdin;
    public       postgres    false    199       2924.dat t          0    69939    auteur 
   TABLE DATA               T   COPY public.auteur (id_auteur, nom, prenom, date_naissance, date_deces) FROM stdin;
    public       postgres    false    207       2932.dat �          0    77729    auteur_livre 
   TABLE DATA               ;   COPY public.auteur_livre (auteur_id, livre_id) FROM stdin;
    public       postgres    false    221       2946.dat �          0    77723    bibliographie 
   TABLE DATA               M   COPY public.bibliographie (id_livre_auteur, id_auteur, id_livre) FROM stdin;
    public       admin_biblioc    false    220       2945.dat n          0    69906    bibliotheque 
   TABLE DATA               B   COPY public.bibliotheque (id_biblio, nom, id_adresse) FROM stdin;
    public       postgres    false    201       2926.dat |          0    69982    compte 
   TABLE DATA               U   COPY public.compte (id_compte, email, password, id_role, id_utilisateur) FROM stdin;
    public       postgres    false    215       2940.dat p          0    69917    editeur 
   TABLE DATA               2   COPY public.editeur (id_editeur, nom) FROM stdin;
    public       postgres    false    203       2928.dat x          0    69958 
   exemplaire 
   TABLE DATA               T   COPY public.exemplaire (id_exemplaire, id_livre, id_biblio, disponible) FROM stdin;
    public       postgres    false    211       2936.dat r          0    69928    genre 
   TABLE DATA               0   COPY public.genre (id_genre, genre) FROM stdin;
    public       postgres    false    205       2930.dat v          0    69947    livre 
   TABLE DATA               m   COPY public.livre (id_livre, isbn13, id_genre, titre, resume, image, annee_parution, id_editeur) FROM stdin;
    public       postgres    false    209       2934.dat ~          0    69990    reservation 
   TABLE DATA               o   COPY public.reservation (id_reservation, id_compte, date_emprunt, extension, id_exemplaire, rendu) FROM stdin;
    public       postgres    false    217       2942.dat j          0    69884    role 
   TABLE DATA               -   COPY public.role (id_role, role) FROM stdin;
    public       postgres    false    197       2922.dat z          0    69974    utilisateur 
   TABLE DATA               Y   COPY public.utilisateur (id_utilisateur, nom, prenom, telephone, id_adresse) FROM stdin;
    public       postgres    false    213       2938.dat �           0    0    adresse_id_adresse_seq_2    SEQUENCE SET     F   SELECT pg_catalog.setval('public.adresse_id_adresse_seq_2', 6, true);
            public       postgres    false    198         �           0    0    auteur_id_auteur_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.auteur_id_auteur_seq', 5, true);
            public       postgres    false    206         �           0    0 !   bibliographie_id_livre_auteur_seq    SEQUENCE SET     P   SELECT pg_catalog.setval('public.bibliographie_id_livre_auteur_seq', 1, false);
            public       admin_biblioc    false    219         �           0    0    bibliotheque_id_biblio_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.bibliotheque_id_biblio_seq', 2, true);
            public       postgres    false    200         �           0    0    compte_id_compte_seq_1    SEQUENCE SET     D   SELECT pg_catalog.setval('public.compte_id_compte_seq_1', 3, true);
            public       postgres    false    214         �           0    0    editeur_id_seq_1    SEQUENCE SET     >   SELECT pg_catalog.setval('public.editeur_id_seq_1', 6, true);
            public       postgres    false    202         �           0    0    exemplaire_id_exem_seq_1    SEQUENCE SET     G   SELECT pg_catalog.setval('public.exemplaire_id_exem_seq_1', 20, true);
            public       postgres    false    210         �           0    0    genre_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.genre_id_seq', 26, true);
            public       postgres    false    204         �           0    0    hibernate_sequence    SEQUENCE SET     A   SELECT pg_catalog.setval('public.hibernate_sequence', 30, true);
            public       admin_biblioc    false    218         �           0    0    livre_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.livre_id_seq', 13, true);
            public       postgres    false    208         �           0    0    reservation_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.reservation_id_seq', 3, true);
            public       postgres    false    216         �           0    0    role_id_seq_1    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.role_id_seq_1', 3, true);
            public       postgres    false    196         �           0    0    utilisateur_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.utilisateur_id_seq', 4, true);
            public       postgres    false    212         �
           2606    69903    adresse adresse_pk 
   CONSTRAINT     X   ALTER TABLE ONLY public.adresse
    ADD CONSTRAINT adresse_pk PRIMARY KEY (id_adresse);
 <   ALTER TABLE ONLY public.adresse DROP CONSTRAINT adresse_pk;
       public         postgres    false    199         �
           2606    77733    auteur_livre auteur_livre_pkey 
   CONSTRAINT     m   ALTER TABLE ONLY public.auteur_livre
    ADD CONSTRAINT auteur_livre_pkey PRIMARY KEY (auteur_id, livre_id);
 H   ALTER TABLE ONLY public.auteur_livre DROP CONSTRAINT auteur_livre_pkey;
       public         postgres    false    221    221         �
           2606    69944    auteur auteur_pk 
   CONSTRAINT     U   ALTER TABLE ONLY public.auteur
    ADD CONSTRAINT auteur_pk PRIMARY KEY (id_auteur);
 :   ALTER TABLE ONLY public.auteur DROP CONSTRAINT auteur_pk;
       public         postgres    false    207         �
           2606    77728     bibliographie bibliographie_pkey 
   CONSTRAINT     k   ALTER TABLE ONLY public.bibliographie
    ADD CONSTRAINT bibliographie_pkey PRIMARY KEY (id_livre_auteur);
 J   ALTER TABLE ONLY public.bibliographie DROP CONSTRAINT bibliographie_pkey;
       public         admin_biblioc    false    220         �
           2606    69914    bibliotheque bibliotheque_pk 
   CONSTRAINT     a   ALTER TABLE ONLY public.bibliotheque
    ADD CONSTRAINT bibliotheque_pk PRIMARY KEY (id_biblio);
 F   ALTER TABLE ONLY public.bibliotheque DROP CONSTRAINT bibliotheque_pk;
       public         postgres    false    201         �
           2606    69987    compte compte_pk 
   CONSTRAINT     U   ALTER TABLE ONLY public.compte
    ADD CONSTRAINT compte_pk PRIMARY KEY (id_compte);
 :   ALTER TABLE ONLY public.compte DROP CONSTRAINT compte_pk;
       public         postgres    false    215         �
           2606    69925    editeur editeur_pk 
   CONSTRAINT     X   ALTER TABLE ONLY public.editeur
    ADD CONSTRAINT editeur_pk PRIMARY KEY (id_editeur);
 <   ALTER TABLE ONLY public.editeur DROP CONSTRAINT editeur_pk;
       public         postgres    false    203         �
           2606    69963    exemplaire exemplaire_pk 
   CONSTRAINT     a   ALTER TABLE ONLY public.exemplaire
    ADD CONSTRAINT exemplaire_pk PRIMARY KEY (id_exemplaire);
 B   ALTER TABLE ONLY public.exemplaire DROP CONSTRAINT exemplaire_pk;
       public         postgres    false    211         �
           2606    69936    genre genre_pk 
   CONSTRAINT     R   ALTER TABLE ONLY public.genre
    ADD CONSTRAINT genre_pk PRIMARY KEY (id_genre);
 8   ALTER TABLE ONLY public.genre DROP CONSTRAINT genre_pk;
       public         postgres    false    205         �
           2606    69955    livre livre_pk 
   CONSTRAINT     R   ALTER TABLE ONLY public.livre
    ADD CONSTRAINT livre_pk PRIMARY KEY (id_livre);
 8   ALTER TABLE ONLY public.livre DROP CONSTRAINT livre_pk;
       public         postgres    false    209         �
           2606    69995    reservation reservation_pk 
   CONSTRAINT     o   ALTER TABLE ONLY public.reservation
    ADD CONSTRAINT reservation_pk PRIMARY KEY (id_reservation, id_compte);
 D   ALTER TABLE ONLY public.reservation DROP CONSTRAINT reservation_pk;
       public         postgres    false    217    217         �
           2606    69892    role role_pk 
   CONSTRAINT     O   ALTER TABLE ONLY public.role
    ADD CONSTRAINT role_pk PRIMARY KEY (id_role);
 6   ALTER TABLE ONLY public.role DROP CONSTRAINT role_pk;
       public         postgres    false    197         �
           2606    69979    utilisateur utilisateur_pk 
   CONSTRAINT     d   ALTER TABLE ONLY public.utilisateur
    ADD CONSTRAINT utilisateur_pk PRIMARY KEY (id_utilisateur);
 D   ALTER TABLE ONLY public.utilisateur DROP CONSTRAINT utilisateur_pk;
       public         postgres    false    213         �
           2606    70001 $   bibliotheque adresse_bibliotheque_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.bibliotheque
    ADD CONSTRAINT adresse_bibliotheque_fk FOREIGN KEY (id_adresse) REFERENCES public.adresse(id_adresse);
 N   ALTER TABLE ONLY public.bibliotheque DROP CONSTRAINT adresse_bibliotheque_fk;
       public       postgres    false    199    2765    201         �
           2606    70006 "   utilisateur adresse_utilisateur_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.utilisateur
    ADD CONSTRAINT adresse_utilisateur_fk FOREIGN KEY (id_adresse) REFERENCES public.adresse(id_adresse);
 L   ALTER TABLE ONLY public.utilisateur DROP CONSTRAINT adresse_utilisateur_fk;
       public       postgres    false    199    2765    213         �
           2606    77734 (   auteur_livre auteur_livre_auteur_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.auteur_livre
    ADD CONSTRAINT auteur_livre_auteur_id_fkey FOREIGN KEY (auteur_id) REFERENCES public.auteur(id_auteur);
 R   ALTER TABLE ONLY public.auteur_livre DROP CONSTRAINT auteur_livre_auteur_id_fkey;
       public       postgres    false    221    2773    207         �
           2606    77739 '   auteur_livre auteur_livre_livre_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.auteur_livre
    ADD CONSTRAINT auteur_livre_livre_id_fkey FOREIGN KEY (livre_id) REFERENCES public.livre(id_livre);
 Q   ALTER TABLE ONLY public.auteur_livre DROP CONSTRAINT auteur_livre_livre_id_fkey;
       public       postgres    false    2775    209    221         �
           2606    70011 %   exemplaire bibliotheque_exemplaire_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.exemplaire
    ADD CONSTRAINT bibliotheque_exemplaire_fk FOREIGN KEY (id_biblio) REFERENCES public.bibliotheque(id_biblio);
 O   ALTER TABLE ONLY public.exemplaire DROP CONSTRAINT bibliotheque_exemplaire_fk;
       public       postgres    false    201    211    2767         �
           2606    70051 !   reservation compte_reservation_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.reservation
    ADD CONSTRAINT compte_reservation_fk FOREIGN KEY (id_compte) REFERENCES public.compte(id_compte);
 K   ALTER TABLE ONLY public.reservation DROP CONSTRAINT compte_reservation_fk;
       public       postgres    false    215    2781    217         �
           2606    70016    livre editeur_livre_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.livre
    ADD CONSTRAINT editeur_livre_fk FOREIGN KEY (id_editeur) REFERENCES public.editeur(id_editeur);
 @   ALTER TABLE ONLY public.livre DROP CONSTRAINT editeur_livre_fk;
       public       postgres    false    2769    203    209         �
           2606    70041 %   reservation exemplaire_reservation_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.reservation
    ADD CONSTRAINT exemplaire_reservation_fk FOREIGN KEY (id_exemplaire) REFERENCES public.exemplaire(id_exemplaire);
 O   ALTER TABLE ONLY public.reservation DROP CONSTRAINT exemplaire_reservation_fk;
       public       postgres    false    217    2777    211         �
           2606    70021    livre genre_livre_fk    FK CONSTRAINT     z   ALTER TABLE ONLY public.livre
    ADD CONSTRAINT genre_livre_fk FOREIGN KEY (id_genre) REFERENCES public.genre(id_genre);
 >   ALTER TABLE ONLY public.livre DROP CONSTRAINT genre_livre_fk;
       public       postgres    false    205    2771    209         �
           2606    70036    exemplaire livre_exemplaire_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.exemplaire
    ADD CONSTRAINT livre_exemplaire_fk FOREIGN KEY (id_livre) REFERENCES public.livre(id_livre);
 H   ALTER TABLE ONLY public.exemplaire DROP CONSTRAINT livre_exemplaire_fk;
       public       postgres    false    211    2775    209         �
           2606    69996    compte role_compte_fk    FK CONSTRAINT     x   ALTER TABLE ONLY public.compte
    ADD CONSTRAINT role_compte_fk FOREIGN KEY (id_role) REFERENCES public.role(id_role);
 ?   ALTER TABLE ONLY public.compte DROP CONSTRAINT role_compte_fk;
       public       postgres    false    197    215    2763         �
           2606    70046    compte utilisateur_compte_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.compte
    ADD CONSTRAINT utilisateur_compte_fk FOREIGN KEY (id_utilisateur) REFERENCES public.utilisateur(id_utilisateur);
 F   ALTER TABLE ONLY public.compte DROP CONSTRAINT utilisateur_compte_fk;
       public       postgres    false    2779    213    215                                                                                                                                                                                                                                                                      2924.dat                                                                                            0000600 0004000 0002000 00000000724 13622375451 0014265 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        2	57950	rue du général Patton	45	Montigny-lès-Metz
3	57950	place de l'église	18	Montigny-lès-Metz
4	57950	rue des alliés	7	Montigny-lès-Metz
5	57950	rue du général Patton	4	Montigny-lès-Metz
6	57000	rue des cordonniers	20	Metz
1			 	
10	57000	rue des cordonniers	10	Metz
11	57000	rue des cordonniers	999	Metz
12	57000	rue des cordonniers	99	Metz
13	57000	rue des cordonniers	00	Metz
14	57000	rue des cordonniers	04	Metz
15	57000	rue des Prêles	44	Metz
\.


                                            2932.dat                                                                                            0000600 0004000 0002000 00000000322 13622375451 0014256 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        1	Hugo	Victor	1802-02-26	1885-05-22
2	Tolkien 	John Ronald Reuel	1892-01-03	1973-09-02
3	Asimov	Isaac	1920-01-02	1992-04-06
4	Herbert	Franck	1920-10-08	1986-02-11
5	Baudelaire	Charle	1821-04-09	1867-08-31
\.


                                                                                                                                                                                                                                                                                                              2946.dat                                                                                            0000600 0004000 0002000 00000000075 13622375451 0014270 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        1	1
3	3
3	2
3	4
2	5
2	6
4	7
4	8
4	9
4	10
4	11
4	12
5	13
\.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                   2945.dat                                                                                            0000600 0004000 0002000 00000000005 13622375451 0014260 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        \.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           2926.dat                                                                                            0000600 0004000 0002000 00000000136 13622375451 0014264 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        1	bibliothèque du centre	4
2	bibliothèque Robert Schumann	5
3	bibliotheque de Magny	15
\.


                                                                                                                                                                                                                                                                                                                                                                                                                                  2940.dat                                                                                            0000600 0004000 0002000 00000001027 13622375451 0014260 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        2	tata@tata.com	a9eae163e8eb252e5dc15bcdcca152ed276c77bc6cf6454cf5d18343f6b10894	1	2
3	simon.culçonet@haha.com	efddd35c6837a97d9ab44a6ac4cbb73fbe8c6e419102e17cc3d46f07c9f03135	1	3
1	admin@admin.com	fad0dde5f2bc60110e798f7fc8f9d11cbcb87f1f78cbf0c4cf24ad2d6cdb0592	3	4
5	test2@test.com	e280fd55d735ceb442bb5d4fc15ba83919ad68f3173c7db0cf2e1c8bee54c585	1	1
15	tintin@tintin.com	d241997a857b3f6dc7fb62bfbd6d0e459581a37bda60cf1238cb714920d493f0	1	1
17	test@test.com	e280fd55d735ceb442bb5d4fc15ba83919ad68f3173c7db0cf2e1c8bee54c585	1	1
\.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         2928.dat                                                                                            0000600 0004000 0002000 00000000113 13622375451 0014261 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        1	Folio
2	Pocket
3	Gléna
4	Hachette
5	L'Ecole des Loisirs
6	Larousse
\.


                                                                                                                                                                                                                                                                                                                                                                                                                                                     2936.dat                                                                                            0000600 0004000 0002000 00000000260 13622375451 0014263 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        1	1	1	t
2	1	1	t
3	1	2	t
4	1	2	t
5	1	2	t
6	1	2	t
7	2	1	t
8	2	1	t
9	2	1	t
10	2	1	t
11	2	2	t
12	2	2	t
13	2	2	t
14	3	1	t
15	3	1	t
16	3	1	t
17	3	1	t
18	3	1	t
19	3	2	t
20	3	2	f
\.


                                                                                                                                                                                                                                                                                                                                                2930.dat                                                                                            0000600 0004000 0002000 00000000540 13622375451 0014256 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        1	historique
2	science fiction
3	fantaisie
4	policier
5	sociologie
6	droit
7	économie
8	roman
9	biographie
10	sciences
11	bande dessinée
12	manga
13	enfant
14	médical
15	informatique
16	biologie
17	géographie
18	langues étrangères
19	mathématiques
20	physique
21	chimie
22	phylosophie
23	géologie
24	astronomie
25	ésothérisme
26	poésie
\.


                                                                                                                                                                2934.dat                                                                                            0000600 0004000 0002000 00000022202 13622375451 0014261 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        1	978-2211238465	8	Les misérables	Valjean, l'ancien forçat devenu bourgeois et protecteur des faibles ; Fantine, l'ouvrière écrasée par sa condition ; le couple Thénardier, figure du mal et de l'opportunisme ; Marius, l'étudiant idéaliste ; Gavroche, le gamin des rues impertinent qui meurt sur les barricades ; Javert, la fatalité imposée par la société sous les traits d'un policier vengeur... Et, bien sûr, Cosette, l'enfant victime. Voilà comment une oeuvre immense incarne son siècle en quelques destins exemplaires, figures devenues mythiques qui continuent de susciter une multitude d'adaptations.	miserable.jpg	2019	5
2	978-2070360536	2	Le cycle de Fondation, I : Fondation	En ce début de treizième millénaire, l'Empire n'a jamais été aussi puissant, aussi étendu à travers toute la galaxie. C'est dans sa capitale, Trantor, que l'éminent savant Hari Seldon invente la psychohistoire, une science nouvelle permettant de prédire l'avenir. Grâce à elle, Seldon prévoit l'effondrement de l'Empire d'ici cinq siècles, suivi d'une ère de ténèbres de trente mille ans. Réduire cette période à mille ans est peut-être possible, à condition de mener à terme son projet : la Fondation, chargée de rassembler toutes les connaissances humaines. Une entreprise visionnaire qui rencontre de nombreux et puissants détracteurs...	fondation_tome_1.jpg	2009	1
3	978-2070360550	2	Le cycle de Fondation, II : Fondation et Empire	Tandis que les crises qui secouent l'Empire redoublent de violence et annoncent son effondrement définitif, la Fondation créée par le psychohistorien Hari Seldon pour sauvegarder la civilisation devient de plus en plus puissante, suscitant naturellement convoitise et visées annexionnistes. En tout premier lieu, celles de Bel Riose, jeune général qui voit dans les secrets détenus par la Fondation le moyen de monter sur le trône.C'est alors qu'apparaît un mystérieux et invincible conquérant, surnommé le Mulet, que le plan de Seldon n'avait pas prévu...	fondation_tome_2.jpg	2009	1
4	978-2070360529	2	Le cycle de Fondation, III : Seconde Fondation	Conçue par le psychohistorien Hari Seldon pour restreindre l'ère de chaos résultant de la décadence de l'Empire galactique, la Fondation est désormais aux mains du Mulet, un mutant imprévisible capable de manipuler les esprits et d'imposer sa volonté à quiconque. Avec ses pouvoirs et les immenses ressources que lui procurent la Fondation, il s'est donné pour objectif d'étendre sa domination aux ultimes vestiges de l'Empire défunt.Mais déjà une nouvelle légende prend forme : il existerait une seconde Fondation, consacrée aux sciences mentales, œuvrant de façon occulte pour garantir l'accomplissement des desseins du légendaire Hari Seldon...	fondation_tome_3.jpg	2009	1
6	978-2266121026	3	Le Silmarillion	Les Premiers jours du Monde étaient à peine passés quand Fëanor, le plus doué des elfes, créa les trois Silmarils. Ces bijoux renfermaient la Lumière des Deux Arbres de Valinor. Morgoth, le premier Prince de la Nuit, était encore sur la Terre du Milieu, et il fut fâché d'apprendre que la Lumière allait se perpétuer. Alors il enleva les Silmarils, les fit sertir dans son diadème et garder dans la forteresse d'Angband. Les elfes prirent les armes pour reprendre les joyaux et ce fut la première de toutes les guerres. Longtemps, longtemps après, lors de la Guerre de l'Anneau, Elrond et Galadriel en parlaient encore.	silmarillion.jpg	2018	2
7	978-2266233200	2	1. Dune	Il n'y a pas, dans tout l'Empire, de planète plus inhospitalière que Dune. Partout des sables à perte de vue. Une seule richesse : l'épice de longue vie, née du désert, et que tout l'univers convoite.Quand Leto Atréides reçoit Dune en fief, il flaire le piège. Il aura besoin des guerriers Fremen qui, réfugiés au fond du désert, se sont adaptés à une vie très dure en préservant leur liberté, leurs coutumes et leur foi. Ils rêvent du prophète qui proclamera la guerre sainte et changera le cours de l'Histoire.Cependant les Révérendes Mères du Bene Gesserit poursuivent leur programme millénaire de sélection génétique : elles veulent créer un homme qui réunira tous les dons latents de l'espèce. Le Messie des Fremen est-il déjà né dans l'Empire ?	dune_1.jpg	2012	2
13	978-2035861566	26	Les fleurs du mal	Pourquoi le recueil des Fleurs du mal a-t-il cette audience aujourd’hui ? Parce qu’il représente, depuis 1857, la naissance d’une poésie nouvelle. Baudelaire utilise les formes classiques – le sonnet, l’alexandrin – pour dire la modernité : la bizarrerie, les villes immenses, le malaise d’une existence douloureuse. Face à cette angoisse, il nous propose un moyen de vaincre le mal, le dégoût de soi et des autres, le « spleen » : l’idéal d’un langage qui nous montrerait un ailleurs rêvé, un monde enfin habitable.	les_fleurs_du_mal.jpg	2011	6
5	978-2070360529	3	Intégrale Le Seigneur des Anneaux (Nouvelle traduction)	Une contrée paisible où vivent les Hobbits. Un anneau magique à la puissance infinie. Sauron, son créateur, prêt à dévaster le monde entier pour récupérer son bien. Frodon, jeune Hobbit, détenteur de l'Anneau malgré lui. Gandalf, le Magicien, venu avertir Frodon du danger. Et voilà déjà les Cavaliers Noirs qui approchent...C'est ainsi que tout commence en Terre du Milieu entre le Comté et Mordor. C'est ainsi que la plus grande légende est née.	seigneur_des_anneaux.jpg	2018	2
8	978-2266235815	2	2. Le messie de dune	Paul Atréides a triomphé de ses ennemis. En douze ans de guerre sainte, ses Fremen ont conquis l'univers. Il est devenu l'empereur Muad' Dib. Presque un dieu, puisqu'il voit l'avenir. Ses ennemis, il les connaît. Il sait quand et comment ils frapperont. Ils vont essayer de lui reprendre l'épice qui donne la prescience et peut-être de percer le secret de son pouvoir. Il peut déjouer leurs plans, mais voit plus loin encore. Il sait que tous les futurs possibles mènent au désastre et est hanté par la vision de sa propre mort. Peut-être n'y a-t-il pas d'autre liberté pour le prescient que celle du sacrifice...	dune_2.jpg	2012	2
9	978-2266235822	2	3. Les enfants de Dune	Sur Dune, la planète des sables, les prophéties s'accomplissent : le désert devient jardin. Mais les vers géants se font rares et l'Épice de prescience vient à manquer. Tout ce qui reste de l'épopée de Muad'Did, c'est un empire conquis, des guerriers déchus, des prêtres tentés par la théocratie. Et les jumeaux Leto et Ghanima, qui portent en eux les souvenirs d'innombrables générations dont, peut-être, ceux de l'antique Abomination, redoutée par les sœurs du Bene Gesserit et prête à revenir du passé génétique pour faire basculer l'univers dans le cauchemar. Les morts dominent les vivants. Leto devra affronter les uns et les autres en un combat sans merci dont l'enjeu est plus que la prescience, plus que la longévité : au moins la toute-puissance, et peut-être l'immortalité.	dune_3.jpg	2012	2
10	978-2266235839	2	4. L'Empereur-dieu de Dune	Leto II Atréides, l'Empereur-Dieu de Dune, est désormais un ver de sable à face humaine. À peu près invulnérable et immortel, il a entrevu dans l'avenir l'extinction de l'espèce humaine. Pour la conjurer, il fait respecter son ordre, le Sentier d'Or. L'empire a connu trente-cinq siècles de paix. La Guilde et le Bene Gesserit ont les mains liées : c'est Leto qui contrôle sur Dune les dernières réserves de l'indispensable épice. Les Ixiens lui envoient une femme parfaite, issue d'une éprouvette et chargée à son insu de le séduire et de le détruire. Leto sait désormais qu'il devra peut être se sacrifier et sacrifier la femme qu'il aime et qui réveille d'anciens souvenirs.	dune_4.jpg	2012	2
11	978-2266235846	2	5. Les hérétiques de Dune	Leto II, le Tyran, l'Empereur-Dieu, est mort depuis des milliers d'années, mais son souvenir est dans toutes les mémoires. Sa disparition a entraîné la Grande Famine et la Dispersion de l'humanité à travers les univers. Pourtant ces désordres ont assuré la survie de l'humanité conformément aux plans du Tyran ; et ses Prêtres en tirent argument pour justifer leurs ambitions. Mais la Révérende Mère Taraza sait bien que le pouvoir vient de l'Épice, source de la prescience. La planète Dune, devenue Rakis, restera-t-elle le centre de toutes les intrigues alors que le Bene Tleilax a appris à produire l'Épice sans le secours des vers géants ? Les forces qui se mesurent dans l'ombre sont à l'affût du moindre signe.	dune_5.jpg	2012	2
12	978-2266235853	2	6. La maison des mères	Dune est détruite, vitrifiée, atomisée. Sur tout l'Empire déferlent les hordes furieuses des Honorées Matriarches, massacrant tout sur leur passage. Le Bene Gesserit reste la seule force organisée. Mais la solution n'est peut-être pas dans le pouvoir des armes. Darwi Odrade, la Mère Supérieure, propose de négocier. La Très Honorée Matriarche accepte : elle s'attend à une capitulation sans conditions. Mais Darwi a un plan. Elle sait bien que l'entreprise est des plus risquées. Si elle parvenait à ramener la paix, elle provoquerait des tensions insupportables et peut-être une nouvelle Dispersion. Rien de moins.	dune_6.jpg	2012	2
\.


                                                                                                                                                                                                                                                                                                                                                                                              2942.dat                                                                                            0000600 0004000 0002000 00000000370 13622375451 0014262 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        22	3	2020-01-29	t	14	t
21	3	2020-01-28	f	9	t
20	1	2020-01-28	t	5	t
24	3	2020-01-29	t	5	f
1	2	2019-11-05	f	7	f
2	2	2019-11-05	f	14	f
3	3	2019-09-11	t	8	f
25	3	2020-01-30	t	13	f
28	3	2020-02-13	f	9	f
30	3	2020-02-17	f	20	f
23	3	2020-01-29	t	2	t
\.


                                                                                                                                                                                                                                                                        2922.dat                                                                                            0000600 0004000 0002000 00000000060 13622375451 0014254 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        1	usagé
2	bibliothecaire
3	administrateur
\.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                2938.dat                                                                                            0000600 0004000 0002000 00000000137 13622375451 0014270 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        2	tata	manue	9876543210	2
1			0	1
4	admin	admin	123456789	6
3	culçonet	simon	202020202	3
\.


                                                                                                                                                                                                                                                                                                                                                                                                                                 restore.sql                                                                                         0000600 0004000 0002000 00000067251 13622375451 0015407 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        --
-- NOTE:
--
-- File paths need to be edited. Search for $$PATH$$ and
-- replace it with the path to the directory containing
-- the extracted data files.
--
--
-- PostgreSQL database dump
--

-- Dumped from database version 10.3
-- Dumped by pg_dump version 11.2

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

DROP DATABASE biblioc_bdd;
--
-- Name: biblioc_bdd; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE biblioc_bdd WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'French_France.1252' LC_CTYPE = 'French_France.1252';


ALTER DATABASE biblioc_bdd OWNER TO postgres;

\connect biblioc_bdd

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: reservationexpire(date, boolean); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.reservationexpire(date_debut date, extens boolean) RETURNS date
    LANGUAGE plpgsql
    AS $$
DECLARE
BEGIN
	if extens = true then return date_debut+56;
	else return date_debut+28;
	end if;
END
$$;


ALTER FUNCTION public.reservationexpire(date_debut date, extens boolean) OWNER TO postgres;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: adresse; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.adresse (
    id_adresse integer NOT NULL,
    code_postal character varying NOT NULL,
    rue character varying NOT NULL,
    num character varying NOT NULL,
    commune character varying NOT NULL
);


ALTER TABLE public.adresse OWNER TO postgres;

--
-- Name: adresse_id_adresse_seq_2; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.adresse_id_adresse_seq_2
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.adresse_id_adresse_seq_2 OWNER TO postgres;

--
-- Name: adresse_id_adresse_seq_2; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.adresse_id_adresse_seq_2 OWNED BY public.adresse.id_adresse;


--
-- Name: auteur; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auteur (
    id_auteur integer NOT NULL,
    nom character varying(50) NOT NULL,
    prenom character varying(50) NOT NULL,
    date_naissance date NOT NULL,
    date_deces date
);


ALTER TABLE public.auteur OWNER TO postgres;

--
-- Name: auteur_id_auteur_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auteur_id_auteur_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auteur_id_auteur_seq OWNER TO postgres;

--
-- Name: auteur_id_auteur_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auteur_id_auteur_seq OWNED BY public.auteur.id_auteur;


--
-- Name: auteur_livre; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auteur_livre (
    auteur_id integer NOT NULL,
    livre_id integer NOT NULL
);


ALTER TABLE public.auteur_livre OWNER TO postgres;

--
-- Name: bibliographie; Type: TABLE; Schema: public; Owner: admin_biblioc
--

CREATE TABLE public.bibliographie (
    id_livre_auteur integer NOT NULL,
    id_auteur integer NOT NULL,
    id_livre integer NOT NULL
);


ALTER TABLE public.bibliographie OWNER TO admin_biblioc;

--
-- Name: bibliographie_id_livre_auteur_seq; Type: SEQUENCE; Schema: public; Owner: admin_biblioc
--

CREATE SEQUENCE public.bibliographie_id_livre_auteur_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.bibliographie_id_livre_auteur_seq OWNER TO admin_biblioc;

--
-- Name: bibliographie_id_livre_auteur_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin_biblioc
--

ALTER SEQUENCE public.bibliographie_id_livre_auteur_seq OWNED BY public.bibliographie.id_livre_auteur;


--
-- Name: bibliotheque; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.bibliotheque (
    id_biblio integer NOT NULL,
    nom character varying NOT NULL,
    id_adresse integer NOT NULL
);


ALTER TABLE public.bibliotheque OWNER TO postgres;

--
-- Name: bibliotheque_id_biblio_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.bibliotheque_id_biblio_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.bibliotheque_id_biblio_seq OWNER TO postgres;

--
-- Name: bibliotheque_id_biblio_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.bibliotheque_id_biblio_seq OWNED BY public.bibliotheque.id_biblio;


--
-- Name: compte; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.compte (
    id_compte integer NOT NULL,
    email character varying(100) NOT NULL,
    password character varying(100) NOT NULL,
    id_role integer NOT NULL,
    id_utilisateur integer NOT NULL
);


ALTER TABLE public.compte OWNER TO postgres;

--
-- Name: compte_id_compte_seq_1; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.compte_id_compte_seq_1
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.compte_id_compte_seq_1 OWNER TO postgres;

--
-- Name: compte_id_compte_seq_1; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.compte_id_compte_seq_1 OWNED BY public.compte.id_compte;


--
-- Name: editeur; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.editeur (
    id_editeur integer NOT NULL,
    nom character varying NOT NULL
);


ALTER TABLE public.editeur OWNER TO postgres;

--
-- Name: editeur_id_seq_1; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.editeur_id_seq_1
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.editeur_id_seq_1 OWNER TO postgres;

--
-- Name: editeur_id_seq_1; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.editeur_id_seq_1 OWNED BY public.editeur.id_editeur;


--
-- Name: exemplaire; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.exemplaire (
    id_exemplaire integer NOT NULL,
    id_livre integer NOT NULL,
    id_biblio integer NOT NULL,
    disponible boolean DEFAULT true
);


ALTER TABLE public.exemplaire OWNER TO postgres;

--
-- Name: exemplaire_id_exem_seq_1; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.exemplaire_id_exem_seq_1
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.exemplaire_id_exem_seq_1 OWNER TO postgres;

--
-- Name: exemplaire_id_exem_seq_1; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.exemplaire_id_exem_seq_1 OWNED BY public.exemplaire.id_exemplaire;


--
-- Name: genre; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.genre (
    id_genre integer NOT NULL,
    genre character varying NOT NULL
);


ALTER TABLE public.genre OWNER TO postgres;

--
-- Name: genre_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.genre_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.genre_id_seq OWNER TO postgres;

--
-- Name: genre_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.genre_id_seq OWNED BY public.genre.id_genre;


--
-- Name: hibernate_sequence; Type: SEQUENCE; Schema: public; Owner: admin_biblioc
--

CREATE SEQUENCE public.hibernate_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.hibernate_sequence OWNER TO admin_biblioc;

--
-- Name: livre; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.livre (
    id_livre integer NOT NULL,
    isbn13 character varying NOT NULL,
    id_genre integer NOT NULL,
    titre character varying NOT NULL,
    resume character varying(1000) NOT NULL,
    image character varying NOT NULL,
    annee_parution integer NOT NULL,
    id_editeur integer NOT NULL
);


ALTER TABLE public.livre OWNER TO postgres;

--
-- Name: livre_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.livre_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.livre_id_seq OWNER TO postgres;

--
-- Name: livre_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.livre_id_seq OWNED BY public.livre.id_livre;


--
-- Name: reservation; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.reservation (
    id_reservation integer NOT NULL,
    id_compte integer NOT NULL,
    date_emprunt date NOT NULL,
    extension boolean NOT NULL,
    id_exemplaire integer NOT NULL,
    rendu boolean
);


ALTER TABLE public.reservation OWNER TO postgres;

--
-- Name: reservation_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.reservation_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.reservation_id_seq OWNER TO postgres;

--
-- Name: reservation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.reservation_id_seq OWNED BY public.reservation.id_reservation;


--
-- Name: role; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.role (
    id_role integer NOT NULL,
    role character varying NOT NULL
);


ALTER TABLE public.role OWNER TO postgres;

--
-- Name: role_id_seq_1; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.role_id_seq_1
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.role_id_seq_1 OWNER TO postgres;

--
-- Name: role_id_seq_1; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.role_id_seq_1 OWNED BY public.role.id_role;


--
-- Name: utilisateur; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.utilisateur (
    id_utilisateur integer NOT NULL,
    nom character varying(100),
    prenom character varying(100),
    telephone double precision,
    id_adresse integer
);


ALTER TABLE public.utilisateur OWNER TO postgres;

--
-- Name: utilisateur_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.utilisateur_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.utilisateur_id_seq OWNER TO postgres;

--
-- Name: utilisateur_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.utilisateur_id_seq OWNED BY public.utilisateur.id_utilisateur;


--
-- Name: adresse id_adresse; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.adresse ALTER COLUMN id_adresse SET DEFAULT nextval('public.adresse_id_adresse_seq_2'::regclass);


--
-- Name: auteur id_auteur; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auteur ALTER COLUMN id_auteur SET DEFAULT nextval('public.auteur_id_auteur_seq'::regclass);


--
-- Name: bibliographie id_livre_auteur; Type: DEFAULT; Schema: public; Owner: admin_biblioc
--

ALTER TABLE ONLY public.bibliographie ALTER COLUMN id_livre_auteur SET DEFAULT nextval('public.bibliographie_id_livre_auteur_seq'::regclass);


--
-- Name: bibliotheque id_biblio; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bibliotheque ALTER COLUMN id_biblio SET DEFAULT nextval('public.bibliotheque_id_biblio_seq'::regclass);


--
-- Name: compte id_compte; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.compte ALTER COLUMN id_compte SET DEFAULT nextval('public.compte_id_compte_seq_1'::regclass);


--
-- Name: editeur id_editeur; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.editeur ALTER COLUMN id_editeur SET DEFAULT nextval('public.editeur_id_seq_1'::regclass);


--
-- Name: exemplaire id_exemplaire; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.exemplaire ALTER COLUMN id_exemplaire SET DEFAULT nextval('public.exemplaire_id_exem_seq_1'::regclass);


--
-- Name: genre id_genre; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.genre ALTER COLUMN id_genre SET DEFAULT nextval('public.genre_id_seq'::regclass);


--
-- Name: livre id_livre; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.livre ALTER COLUMN id_livre SET DEFAULT nextval('public.livre_id_seq'::regclass);


--
-- Name: reservation id_reservation; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reservation ALTER COLUMN id_reservation SET DEFAULT nextval('public.reservation_id_seq'::regclass);


--
-- Name: role id_role; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.role ALTER COLUMN id_role SET DEFAULT nextval('public.role_id_seq_1'::regclass);


--
-- Name: utilisateur id_utilisateur; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.utilisateur ALTER COLUMN id_utilisateur SET DEFAULT nextval('public.utilisateur_id_seq'::regclass);


--
-- Data for Name: adresse; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.adresse (id_adresse, code_postal, rue, num, commune) FROM stdin;
\.
COPY public.adresse (id_adresse, code_postal, rue, num, commune) FROM '$$PATH$$/2924.dat';

--
-- Data for Name: auteur; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auteur (id_auteur, nom, prenom, date_naissance, date_deces) FROM stdin;
\.
COPY public.auteur (id_auteur, nom, prenom, date_naissance, date_deces) FROM '$$PATH$$/2932.dat';

--
-- Data for Name: auteur_livre; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auteur_livre (auteur_id, livre_id) FROM stdin;
\.
COPY public.auteur_livre (auteur_id, livre_id) FROM '$$PATH$$/2946.dat';

--
-- Data for Name: bibliographie; Type: TABLE DATA; Schema: public; Owner: admin_biblioc
--

COPY public.bibliographie (id_livre_auteur, id_auteur, id_livre) FROM stdin;
\.
COPY public.bibliographie (id_livre_auteur, id_auteur, id_livre) FROM '$$PATH$$/2945.dat';

--
-- Data for Name: bibliotheque; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.bibliotheque (id_biblio, nom, id_adresse) FROM stdin;
\.
COPY public.bibliotheque (id_biblio, nom, id_adresse) FROM '$$PATH$$/2926.dat';

--
-- Data for Name: compte; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.compte (id_compte, email, password, id_role, id_utilisateur) FROM stdin;
\.
COPY public.compte (id_compte, email, password, id_role, id_utilisateur) FROM '$$PATH$$/2940.dat';

--
-- Data for Name: editeur; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.editeur (id_editeur, nom) FROM stdin;
\.
COPY public.editeur (id_editeur, nom) FROM '$$PATH$$/2928.dat';

--
-- Data for Name: exemplaire; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.exemplaire (id_exemplaire, id_livre, id_biblio, disponible) FROM stdin;
\.
COPY public.exemplaire (id_exemplaire, id_livre, id_biblio, disponible) FROM '$$PATH$$/2936.dat';

--
-- Data for Name: genre; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.genre (id_genre, genre) FROM stdin;
\.
COPY public.genre (id_genre, genre) FROM '$$PATH$$/2930.dat';

--
-- Data for Name: livre; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.livre (id_livre, isbn13, id_genre, titre, resume, image, annee_parution, id_editeur) FROM stdin;
\.
COPY public.livre (id_livre, isbn13, id_genre, titre, resume, image, annee_parution, id_editeur) FROM '$$PATH$$/2934.dat';

--
-- Data for Name: reservation; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.reservation (id_reservation, id_compte, date_emprunt, extension, id_exemplaire, rendu) FROM stdin;
\.
COPY public.reservation (id_reservation, id_compte, date_emprunt, extension, id_exemplaire, rendu) FROM '$$PATH$$/2942.dat';

--
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.role (id_role, role) FROM stdin;
\.
COPY public.role (id_role, role) FROM '$$PATH$$/2922.dat';

--
-- Data for Name: utilisateur; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.utilisateur (id_utilisateur, nom, prenom, telephone, id_adresse) FROM stdin;
\.
COPY public.utilisateur (id_utilisateur, nom, prenom, telephone, id_adresse) FROM '$$PATH$$/2938.dat';

--
-- Name: adresse_id_adresse_seq_2; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.adresse_id_adresse_seq_2', 6, true);


--
-- Name: auteur_id_auteur_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auteur_id_auteur_seq', 5, true);


--
-- Name: bibliographie_id_livre_auteur_seq; Type: SEQUENCE SET; Schema: public; Owner: admin_biblioc
--

SELECT pg_catalog.setval('public.bibliographie_id_livre_auteur_seq', 1, false);


--
-- Name: bibliotheque_id_biblio_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.bibliotheque_id_biblio_seq', 2, true);


--
-- Name: compte_id_compte_seq_1; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.compte_id_compte_seq_1', 3, true);


--
-- Name: editeur_id_seq_1; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.editeur_id_seq_1', 6, true);


--
-- Name: exemplaire_id_exem_seq_1; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.exemplaire_id_exem_seq_1', 20, true);


--
-- Name: genre_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.genre_id_seq', 26, true);


--
-- Name: hibernate_sequence; Type: SEQUENCE SET; Schema: public; Owner: admin_biblioc
--

SELECT pg_catalog.setval('public.hibernate_sequence', 30, true);


--
-- Name: livre_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.livre_id_seq', 13, true);


--
-- Name: reservation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.reservation_id_seq', 3, true);


--
-- Name: role_id_seq_1; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.role_id_seq_1', 3, true);


--
-- Name: utilisateur_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.utilisateur_id_seq', 4, true);


--
-- Name: adresse adresse_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.adresse
    ADD CONSTRAINT adresse_pk PRIMARY KEY (id_adresse);


--
-- Name: auteur_livre auteur_livre_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auteur_livre
    ADD CONSTRAINT auteur_livre_pkey PRIMARY KEY (auteur_id, livre_id);


--
-- Name: auteur auteur_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auteur
    ADD CONSTRAINT auteur_pk PRIMARY KEY (id_auteur);


--
-- Name: bibliographie bibliographie_pkey; Type: CONSTRAINT; Schema: public; Owner: admin_biblioc
--

ALTER TABLE ONLY public.bibliographie
    ADD CONSTRAINT bibliographie_pkey PRIMARY KEY (id_livre_auteur);


--
-- Name: bibliotheque bibliotheque_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bibliotheque
    ADD CONSTRAINT bibliotheque_pk PRIMARY KEY (id_biblio);


--
-- Name: compte compte_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.compte
    ADD CONSTRAINT compte_pk PRIMARY KEY (id_compte);


--
-- Name: editeur editeur_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.editeur
    ADD CONSTRAINT editeur_pk PRIMARY KEY (id_editeur);


--
-- Name: exemplaire exemplaire_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.exemplaire
    ADD CONSTRAINT exemplaire_pk PRIMARY KEY (id_exemplaire);


--
-- Name: genre genre_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.genre
    ADD CONSTRAINT genre_pk PRIMARY KEY (id_genre);


--
-- Name: livre livre_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.livre
    ADD CONSTRAINT livre_pk PRIMARY KEY (id_livre);


--
-- Name: reservation reservation_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reservation
    ADD CONSTRAINT reservation_pk PRIMARY KEY (id_reservation, id_compte);


--
-- Name: role role_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.role
    ADD CONSTRAINT role_pk PRIMARY KEY (id_role);


--
-- Name: utilisateur utilisateur_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.utilisateur
    ADD CONSTRAINT utilisateur_pk PRIMARY KEY (id_utilisateur);


--
-- Name: bibliotheque adresse_bibliotheque_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bibliotheque
    ADD CONSTRAINT adresse_bibliotheque_fk FOREIGN KEY (id_adresse) REFERENCES public.adresse(id_adresse);


--
-- Name: utilisateur adresse_utilisateur_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.utilisateur
    ADD CONSTRAINT adresse_utilisateur_fk FOREIGN KEY (id_adresse) REFERENCES public.adresse(id_adresse);


--
-- Name: auteur_livre auteur_livre_auteur_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auteur_livre
    ADD CONSTRAINT auteur_livre_auteur_id_fkey FOREIGN KEY (auteur_id) REFERENCES public.auteur(id_auteur);


--
-- Name: auteur_livre auteur_livre_livre_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auteur_livre
    ADD CONSTRAINT auteur_livre_livre_id_fkey FOREIGN KEY (livre_id) REFERENCES public.livre(id_livre);


--
-- Name: exemplaire bibliotheque_exemplaire_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.exemplaire
    ADD CONSTRAINT bibliotheque_exemplaire_fk FOREIGN KEY (id_biblio) REFERENCES public.bibliotheque(id_biblio);


--
-- Name: reservation compte_reservation_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reservation
    ADD CONSTRAINT compte_reservation_fk FOREIGN KEY (id_compte) REFERENCES public.compte(id_compte);


--
-- Name: livre editeur_livre_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.livre
    ADD CONSTRAINT editeur_livre_fk FOREIGN KEY (id_editeur) REFERENCES public.editeur(id_editeur);


--
-- Name: reservation exemplaire_reservation_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reservation
    ADD CONSTRAINT exemplaire_reservation_fk FOREIGN KEY (id_exemplaire) REFERENCES public.exemplaire(id_exemplaire);


--
-- Name: livre genre_livre_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.livre
    ADD CONSTRAINT genre_livre_fk FOREIGN KEY (id_genre) REFERENCES public.genre(id_genre);


--
-- Name: exemplaire livre_exemplaire_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.exemplaire
    ADD CONSTRAINT livre_exemplaire_fk FOREIGN KEY (id_livre) REFERENCES public.livre(id_livre);


--
-- Name: compte role_compte_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.compte
    ADD CONSTRAINT role_compte_fk FOREIGN KEY (id_role) REFERENCES public.role(id_role);


--
-- Name: compte utilisateur_compte_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.compte
    ADD CONSTRAINT utilisateur_compte_fk FOREIGN KEY (id_utilisateur) REFERENCES public.utilisateur(id_utilisateur);


--
-- Name: DATABASE biblioc_bdd; Type: ACL; Schema: -; Owner: postgres
--

GRANT ALL ON DATABASE biblioc_bdd TO admin_biblioc WITH GRANT OPTION;


--
-- Name: TABLE adresse; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.adresse TO admin_biblioc WITH GRANT OPTION;


--
-- Name: SEQUENCE adresse_id_adresse_seq_2; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.adresse_id_adresse_seq_2 TO admin_biblioc WITH GRANT OPTION;


--
-- Name: TABLE auteur; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.auteur TO admin_biblioc WITH GRANT OPTION;


--
-- Name: SEQUENCE auteur_id_auteur_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.auteur_id_auteur_seq TO admin_biblioc WITH GRANT OPTION;


--
-- Name: TABLE auteur_livre; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.auteur_livre TO admin_ocscalade WITH GRANT OPTION;
GRANT ALL ON TABLE public.auteur_livre TO admin_biblioc;


--
-- Name: TABLE bibliotheque; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.bibliotheque TO admin_biblioc WITH GRANT OPTION;


--
-- Name: SEQUENCE bibliotheque_id_biblio_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.bibliotheque_id_biblio_seq TO admin_biblioc WITH GRANT OPTION;


--
-- Name: TABLE compte; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.compte TO admin_biblioc WITH GRANT OPTION;


--
-- Name: SEQUENCE compte_id_compte_seq_1; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.compte_id_compte_seq_1 TO admin_biblioc WITH GRANT OPTION;


--
-- Name: TABLE editeur; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.editeur TO admin_biblioc WITH GRANT OPTION;


--
-- Name: SEQUENCE editeur_id_seq_1; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.editeur_id_seq_1 TO admin_biblioc WITH GRANT OPTION;


--
-- Name: TABLE exemplaire; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.exemplaire TO admin_biblioc WITH GRANT OPTION;


--
-- Name: SEQUENCE exemplaire_id_exem_seq_1; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.exemplaire_id_exem_seq_1 TO admin_biblioc WITH GRANT OPTION;


--
-- Name: TABLE genre; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.genre TO admin_biblioc WITH GRANT OPTION;


--
-- Name: SEQUENCE genre_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.genre_id_seq TO admin_biblioc WITH GRANT OPTION;


--
-- Name: TABLE livre; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.livre TO admin_biblioc WITH GRANT OPTION;


--
-- Name: SEQUENCE livre_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.livre_id_seq TO admin_biblioc WITH GRANT OPTION;


--
-- Name: TABLE reservation; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.reservation TO admin_biblioc WITH GRANT OPTION;


--
-- Name: SEQUENCE reservation_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.reservation_id_seq TO admin_biblioc WITH GRANT OPTION;


--
-- Name: TABLE role; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.role TO admin_biblioc WITH GRANT OPTION;


--
-- Name: SEQUENCE role_id_seq_1; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.role_id_seq_1 TO admin_biblioc WITH GRANT OPTION;


--
-- Name: TABLE utilisateur; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.utilisateur TO admin_biblioc WITH GRANT OPTION;


--
-- Name: SEQUENCE utilisateur_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.utilisateur_id_seq TO admin_biblioc WITH GRANT OPTION;


--
-- PostgreSQL database dump complete
--

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       