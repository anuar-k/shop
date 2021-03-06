PGDMP                         y            shop_db    10.15    10.15 ?    ?           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                       false            ?           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                       false            ?           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                       false            ?           1262    16462    shop_db    DATABASE     ?   CREATE DATABASE shop_db WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'Russian_Russia.1251' LC_CTYPE = 'Russian_Russia.1251';
    DROP DATABASE shop_db;
             postgres    false                        2615    2200    public    SCHEMA        CREATE SCHEMA public;
    DROP SCHEMA public;
             postgres    false            ?           0    0    SCHEMA public    COMMENT     6   COMMENT ON SCHEMA public IS 'standard public schema';
                  postgres    false    3                        3079    12924    plpgsql 	   EXTENSION     ?   CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;
    DROP EXTENSION plpgsql;
                  false            ?           0    0    EXTENSION plpgsql    COMMENT     @   COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';
                       false    1            ?            1259    16674    comments    TABLE     ?   CREATE TABLE public.comments (
    id integer NOT NULL,
    value character varying(100),
    product_id integer NOT NULL,
    user_id integer NOT NULL
);
    DROP TABLE public.comments;
       public         postgres    false    3            ?            1259    16672    Comment_id_seq    SEQUENCE     ?   CREATE SEQUENCE public."Comment_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public."Comment_id_seq";
       public       postgres    false    3    213            ?           0    0    Comment_id_seq    SEQUENCE OWNED BY     D   ALTER SEQUENCE public."Comment_id_seq" OWNED BY public.comments.id;
            public       postgres    false    212            ?            1259    16681    Comment_product_id_seq    SEQUENCE     ?   CREATE SEQUENCE public."Comment_product_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public."Comment_product_id_seq";
       public       postgres    false    213    3            ?           0    0    Comment_product_id_seq    SEQUENCE OWNED BY     T   ALTER SEQUENCE public."Comment_product_id_seq" OWNED BY public.comments.product_id;
            public       postgres    false    214            ?            1259    16504 
   categories    TABLE     e   CREATE TABLE public.categories (
    id integer NOT NULL,
    name character varying(50) NOT NULL
);
    DROP TABLE public.categories;
       public         postgres    false    3            ?            1259    16502    category_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.category_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.category_id_seq;
       public       postgres    false    3    201            ?           0    0    category_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.category_id_seq OWNED BY public.categories.id;
            public       postgres    false    200            ?            1259    16694    comments_user_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.comments_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.comments_user_id_seq;
       public       postgres    false    213    3            ?           0    0    comments_user_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.comments_user_id_seq OWNED BY public.comments.user_id;
            public       postgres    false    215            ?            1259    16768    options    TABLE     {   CREATE TABLE public.options (
    id integer NOT NULL,
    name character varying(50),
    category_id integer NOT NULL
);
    DROP TABLE public.options;
       public         postgres    false    3            ?            1259    16766    options_category_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.options_category_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.options_category_id_seq;
       public       postgres    false    3    222            ?           0    0    options_category_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.options_category_id_seq OWNED BY public.options.category_id;
            public       postgres    false    221            ?            1259    16764    options_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.options_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.options_id_seq;
       public       postgres    false    3    222            ?           0    0    options_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.options_id_seq OWNED BY public.options.id;
            public       postgres    false    220            ?            1259    16643    order_product    TABLE     ?   CREATE TABLE public.order_product (
    id integer NOT NULL,
    order_id integer NOT NULL,
    product_id integer NOT NULL,
    count integer NOT NULL
);
 !   DROP TABLE public.order_product;
       public         postgres    false    3            ?            1259    16820    order_product_count_seq    SEQUENCE     ?   CREATE SEQUENCE public.order_product_count_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.order_product_count_seq;
       public       postgres    false    209    3            ?           0    0    order_product_count_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.order_product_count_seq OWNED BY public.order_product.count;
            public       postgres    false    227            ?            1259    16641    order_product_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.order_product_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.order_product_id_seq;
       public       postgres    false    3    209            ?           0    0    order_product_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.order_product_id_seq OWNED BY public.order_product.id;
            public       postgres    false    208            ?            1259    16647    order_product_order_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.order_product_order_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.order_product_order_id_seq;
       public       postgres    false    3    209            ?           0    0    order_product_order_id_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.order_product_order_id_seq OWNED BY public.order_product.order_id;
            public       postgres    false    210            ?            1259    16653    order_product_product_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.order_product_product_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE public.order_product_product_id_seq;
       public       postgres    false    3    209            ?           0    0    order_product_product_id_seq    SEQUENCE OWNED BY     ]   ALTER SEQUENCE public.order_product_product_id_seq OWNED BY public.order_product.product_id;
            public       postgres    false    211            ?            1259    16474    orders    TABLE     ?   CREATE TABLE public.orders (
    id integer NOT NULL,
    user_id integer NOT NULL,
    comment character varying(50) NOT NULL,
    created_at timestamp without time zone
);
    DROP TABLE public.orders;
       public         postgres    false    3            ?            1259    16472    orders_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.orders_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.orders_id_seq;
       public       postgres    false    3    199            ?           0    0    orders_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.orders_id_seq OWNED BY public.orders.id;
            public       postgres    false    198            ?            1259    16559    products    TABLE     ?   CREATE TABLE public.products (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    category_id integer NOT NULL,
    price numeric
);
    DROP TABLE public.products;
       public         postgres    false    3            ?            1259    16557    products_category_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.products_category_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.products_category_id_seq;
       public       postgres    false    207    3            ?           0    0    products_category_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.products_category_id_seq OWNED BY public.products.category_id;
            public       postgres    false    206            ?            1259    16555    products_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.products_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.products_id_seq;
       public       postgres    false    207    3            ?           0    0    products_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.products_id_seq OWNED BY public.products.id;
            public       postgres    false    205            ?            1259    16709    ratings    TABLE     ?   CREATE TABLE public.ratings (
    id integer NOT NULL,
    rating smallint NOT NULL,
    product_id integer NOT NULL,
    user_id integer NOT NULL
);
    DROP TABLE public.ratings;
       public         postgres    false    3            ?            1259    16707    ratings_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.ratings_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.ratings_id_seq;
       public       postgres    false    3    217            ?           0    0    ratings_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.ratings_id_seq OWNED BY public.ratings.id;
            public       postgres    false    216            ?            1259    16733    ratings_product_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.ratings_product_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.ratings_product_id_seq;
       public       postgres    false    217    3            ?           0    0    ratings_product_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.ratings_product_id_seq OWNED BY public.ratings.product_id;
            public       postgres    false    218            ?            1259    16746    ratings_user_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.ratings_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.ratings_user_id_seq;
       public       postgres    false    3    217            ?           0    0    ratings_user_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.ratings_user_id_seq OWNED BY public.ratings.user_id;
            public       postgres    false    219            ?            1259    16516    roles    TABLE     ?   CREATE TABLE public.roles (
    id integer NOT NULL,
    name character varying(10) NOT NULL,
    admin_name character varying(10)
);
    DROP TABLE public.roles;
       public         postgres    false    3            ?            1259    16514    roles_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.roles_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.roles_id_seq;
       public       postgres    false    203    3            ?           0    0    roles_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.roles_id_seq OWNED BY public.roles.id;
            public       postgres    false    202            ?            1259    16465    users    TABLE     =  CREATE TABLE public.users (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    surname character varying(50) NOT NULL,
    email character varying(50),
    phone character varying(50),
    created_at timestamp without time zone,
    role_id integer NOT NULL,
    password character varying(200)
);
    DROP TABLE public.users;
       public         postgres    false    3            ?            1259    16463    users_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.users_id_seq;
       public       postgres    false    3    197            ?           0    0    users_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;
            public       postgres    false    196            ?            1259    16528    users_role_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.users_role_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.users_role_id_seq;
       public       postgres    false    197    3            ?           0    0    users_role_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.users_role_id_seq OWNED BY public.users.role_id;
            public       postgres    false    204            ?            1259    16779    values    TABLE     ?   CREATE TABLE public."values" (
    id integer NOT NULL,
    value character varying(50),
    product_id integer NOT NULL,
    option_id integer NOT NULL
);
    DROP TABLE public."values";
       public         postgres    false    3            ?            1259    16773    values_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.values_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.values_id_seq;
       public       postgres    false    3    226            ?           0    0    values_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.values_id_seq OWNED BY public."values".id;
            public       postgres    false    223            ?            1259    16777    values_option_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.values_option_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.values_option_id_seq;
       public       postgres    false    3    226            ?           0    0    values_option_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.values_option_id_seq OWNED BY public."values".option_id;
            public       postgres    false    225            ?            1259    16775    values_product_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.values_product_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.values_product_id_seq;
       public       postgres    false    226    3            ?           0    0    values_product_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.values_product_id_seq OWNED BY public."values".product_id;
            public       postgres    false    224            ?
           2604    16507    categories id    DEFAULT     l   ALTER TABLE ONLY public.categories ALTER COLUMN id SET DEFAULT nextval('public.category_id_seq'::regclass);
 <   ALTER TABLE public.categories ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    200    201    201            ?
           2604    16677    comments id    DEFAULT     k   ALTER TABLE ONLY public.comments ALTER COLUMN id SET DEFAULT nextval('public."Comment_id_seq"'::regclass);
 :   ALTER TABLE public.comments ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    213    212    213            ?
           2604    16683    comments product_id    DEFAULT     {   ALTER TABLE ONLY public.comments ALTER COLUMN product_id SET DEFAULT nextval('public."Comment_product_id_seq"'::regclass);
 B   ALTER TABLE public.comments ALTER COLUMN product_id DROP DEFAULT;
       public       postgres    false    214    213            ?
           2604    16696    comments user_id    DEFAULT     t   ALTER TABLE ONLY public.comments ALTER COLUMN user_id SET DEFAULT nextval('public.comments_user_id_seq'::regclass);
 ?   ALTER TABLE public.comments ALTER COLUMN user_id DROP DEFAULT;
       public       postgres    false    215    213            ?
           2604    16771 
   options id    DEFAULT     h   ALTER TABLE ONLY public.options ALTER COLUMN id SET DEFAULT nextval('public.options_id_seq'::regclass);
 9   ALTER TABLE public.options ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    220    222    222            ?
           2604    16772    options category_id    DEFAULT     z   ALTER TABLE ONLY public.options ALTER COLUMN category_id SET DEFAULT nextval('public.options_category_id_seq'::regclass);
 B   ALTER TABLE public.options ALTER COLUMN category_id DROP DEFAULT;
       public       postgres    false    222    221    222            ?
           2604    16646    order_product id    DEFAULT     t   ALTER TABLE ONLY public.order_product ALTER COLUMN id SET DEFAULT nextval('public.order_product_id_seq'::regclass);
 ?   ALTER TABLE public.order_product ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    208    209    209            ?
           2604    16649    order_product order_id    DEFAULT     ?   ALTER TABLE ONLY public.order_product ALTER COLUMN order_id SET DEFAULT nextval('public.order_product_order_id_seq'::regclass);
 E   ALTER TABLE public.order_product ALTER COLUMN order_id DROP DEFAULT;
       public       postgres    false    210    209            ?
           2604    16655    order_product product_id    DEFAULT     ?   ALTER TABLE ONLY public.order_product ALTER COLUMN product_id SET DEFAULT nextval('public.order_product_product_id_seq'::regclass);
 G   ALTER TABLE public.order_product ALTER COLUMN product_id DROP DEFAULT;
       public       postgres    false    211    209            ?
           2604    16822    order_product count    DEFAULT     z   ALTER TABLE ONLY public.order_product ALTER COLUMN count SET DEFAULT nextval('public.order_product_count_seq'::regclass);
 B   ALTER TABLE public.order_product ALTER COLUMN count DROP DEFAULT;
       public       postgres    false    227    209            ?
           2604    16477 	   orders id    DEFAULT     f   ALTER TABLE ONLY public.orders ALTER COLUMN id SET DEFAULT nextval('public.orders_id_seq'::regclass);
 8   ALTER TABLE public.orders ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    199    198    199            ?
           2604    16562    products id    DEFAULT     j   ALTER TABLE ONLY public.products ALTER COLUMN id SET DEFAULT nextval('public.products_id_seq'::regclass);
 :   ALTER TABLE public.products ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    207    205    207            ?
           2604    16563    products category_id    DEFAULT     |   ALTER TABLE ONLY public.products ALTER COLUMN category_id SET DEFAULT nextval('public.products_category_id_seq'::regclass);
 C   ALTER TABLE public.products ALTER COLUMN category_id DROP DEFAULT;
       public       postgres    false    206    207    207            ?
           2604    16712 
   ratings id    DEFAULT     h   ALTER TABLE ONLY public.ratings ALTER COLUMN id SET DEFAULT nextval('public.ratings_id_seq'::regclass);
 9   ALTER TABLE public.ratings ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    216    217    217            ?
           2604    16735    ratings product_id    DEFAULT     x   ALTER TABLE ONLY public.ratings ALTER COLUMN product_id SET DEFAULT nextval('public.ratings_product_id_seq'::regclass);
 A   ALTER TABLE public.ratings ALTER COLUMN product_id DROP DEFAULT;
       public       postgres    false    218    217            ?
           2604    16748    ratings user_id    DEFAULT     r   ALTER TABLE ONLY public.ratings ALTER COLUMN user_id SET DEFAULT nextval('public.ratings_user_id_seq'::regclass);
 >   ALTER TABLE public.ratings ALTER COLUMN user_id DROP DEFAULT;
       public       postgres    false    219    217            ?
           2604    16519    roles id    DEFAULT     d   ALTER TABLE ONLY public.roles ALTER COLUMN id SET DEFAULT nextval('public.roles_id_seq'::regclass);
 7   ALTER TABLE public.roles ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    203    202    203            ?
           2604    16468    users id    DEFAULT     d   ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);
 7   ALTER TABLE public.users ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    196    197    197            ?
           2604    16530    users role_id    DEFAULT     n   ALTER TABLE ONLY public.users ALTER COLUMN role_id SET DEFAULT nextval('public.users_role_id_seq'::regclass);
 <   ALTER TABLE public.users ALTER COLUMN role_id DROP DEFAULT;
       public       postgres    false    204    197            ?
           2604    16782 	   values id    DEFAULT     h   ALTER TABLE ONLY public."values" ALTER COLUMN id SET DEFAULT nextval('public.values_id_seq'::regclass);
 :   ALTER TABLE public."values" ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    223    226    226            ?
           2604    16783    values product_id    DEFAULT     x   ALTER TABLE ONLY public."values" ALTER COLUMN product_id SET DEFAULT nextval('public.values_product_id_seq'::regclass);
 B   ALTER TABLE public."values" ALTER COLUMN product_id DROP DEFAULT;
       public       postgres    false    224    226    226            ?
           2604    16784    values option_id    DEFAULT     v   ALTER TABLE ONLY public."values" ALTER COLUMN option_id SET DEFAULT nextval('public.values_option_id_seq'::regclass);
 A   ALTER TABLE public."values" ALTER COLUMN option_id DROP DEFAULT;
       public       postgres    false    225    226    226            y          0    16504 
   categories 
   TABLE DATA               .   COPY public.categories (id, name) FROM stdin;
    public       postgres    false    201   ʜ       ?          0    16674    comments 
   TABLE DATA               B   COPY public.comments (id, value, product_id, user_id) FROM stdin;
    public       postgres    false    213   7?       ?          0    16768    options 
   TABLE DATA               8   COPY public.options (id, name, category_id) FROM stdin;
    public       postgres    false    222   T?       ?          0    16643    order_product 
   TABLE DATA               H   COPY public.order_product (id, order_id, product_id, count) FROM stdin;
    public       postgres    false    209   q?       w          0    16474    orders 
   TABLE DATA               B   COPY public.orders (id, user_id, comment, created_at) FROM stdin;
    public       postgres    false    199   ??                 0    16559    products 
   TABLE DATA               @   COPY public.products (id, name, category_id, price) FROM stdin;
    public       postgres    false    207   ??       ?          0    16709    ratings 
   TABLE DATA               B   COPY public.ratings (id, rating, product_id, user_id) FROM stdin;
    public       postgres    false    217   ȝ       {          0    16516    roles 
   TABLE DATA               5   COPY public.roles (id, name, admin_name) FROM stdin;
    public       postgres    false    203   ??       u          0    16465    users 
   TABLE DATA               _   COPY public.users (id, name, surname, email, phone, created_at, role_id, password) FROM stdin;
    public       postgres    false    197    ?       ?          0    16779    values 
   TABLE DATA               D   COPY public."values" (id, value, product_id, option_id) FROM stdin;
    public       postgres    false    226   r?       ?           0    0    Comment_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public."Comment_id_seq"', 1, false);
            public       postgres    false    212            ?           0    0    Comment_product_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public."Comment_product_id_seq"', 1, false);
            public       postgres    false    214            ?           0    0    category_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.category_id_seq', 7, true);
            public       postgres    false    200            ?           0    0    comments_user_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.comments_user_id_seq', 1, false);
            public       postgres    false    215            ?           0    0    options_category_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.options_category_id_seq', 1, false);
            public       postgres    false    221            ?           0    0    options_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.options_id_seq', 1, false);
            public       postgres    false    220            ?           0    0    order_product_count_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.order_product_count_seq', 1, false);
            public       postgres    false    227            ?           0    0    order_product_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.order_product_id_seq', 1, false);
            public       postgres    false    208            ?           0    0    order_product_order_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.order_product_order_id_seq', 1, false);
            public       postgres    false    210            ?           0    0    order_product_product_id_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('public.order_product_product_id_seq', 1, false);
            public       postgres    false    211            ?           0    0    orders_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.orders_id_seq', 1, false);
            public       postgres    false    198            ?           0    0    products_category_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.products_category_id_seq', 1, false);
            public       postgres    false    206            ?           0    0    products_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.products_id_seq', 1, false);
            public       postgres    false    205            ?           0    0    ratings_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.ratings_id_seq', 1, false);
            public       postgres    false    216            ?           0    0    ratings_product_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.ratings_product_id_seq', 1, false);
            public       postgres    false    218            ?           0    0    ratings_user_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.ratings_user_id_seq', 1, false);
            public       postgres    false    219            ?           0    0    roles_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.roles_id_seq', 3, true);
            public       postgres    false    202            ?           0    0    users_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.users_id_seq', 1, true);
            public       postgres    false    196            ?           0    0    users_role_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.users_role_id_seq', 1, false);
            public       postgres    false    204            ?           0    0    values_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.values_id_seq', 1, false);
            public       postgres    false    223            ?           0    0    values_option_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.values_option_id_seq', 1, false);
            public       postgres    false    225            ?           0    0    values_product_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.values_product_id_seq', 1, false);
            public       postgres    false    224            ?
           2606    16510    categories category_pk 
   CONSTRAINT     T   ALTER TABLE ONLY public.categories
    ADD CONSTRAINT category_pk PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.categories DROP CONSTRAINT category_pk;
       public         postgres    false    201            ?
           2606    16680    comments comment_pk 
   CONSTRAINT     Q   ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comment_pk PRIMARY KEY (id);
 =   ALTER TABLE ONLY public.comments DROP CONSTRAINT comment_pk;
       public         postgres    false    213            ?
           2606    16831    options options_pk 
   CONSTRAINT     P   ALTER TABLE ONLY public.options
    ADD CONSTRAINT options_pk PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.options DROP CONSTRAINT options_pk;
       public         postgres    false    222            ?
           2606    16828    order_product order_product_pk 
   CONSTRAINT     \   ALTER TABLE ONLY public.order_product
    ADD CONSTRAINT order_product_pk PRIMARY KEY (id);
 H   ALTER TABLE ONLY public.order_product DROP CONSTRAINT order_product_pk;
       public         postgres    false    209            ?
           2606    16480    orders orders_pk 
   CONSTRAINT     N   ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pk PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.orders DROP CONSTRAINT orders_pk;
       public         postgres    false    199            ?
           2606    16666    products products_pk 
   CONSTRAINT     R   ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pk PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.products DROP CONSTRAINT products_pk;
       public         postgres    false    207            ?
           2606    16715    ratings ratings_pk 
   CONSTRAINT     P   ALTER TABLE ONLY public.ratings
    ADD CONSTRAINT ratings_pk PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.ratings DROP CONSTRAINT ratings_pk;
       public         postgres    false    217            ?
           2606    16538    roles roles_pk 
   CONSTRAINT     L   ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_pk PRIMARY KEY (id);
 8   ALTER TABLE ONLY public.roles DROP CONSTRAINT roles_pk;
       public         postgres    false    203            ?
           2606    16471    users users_pk 
   CONSTRAINT     L   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pk PRIMARY KEY (id);
 8   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pk;
       public         postgres    false    197            ?
           2606    16834    values values_pk 
   CONSTRAINT     P   ALTER TABLE ONLY public."values"
    ADD CONSTRAINT values_pk PRIMARY KEY (id);
 <   ALTER TABLE ONLY public."values" DROP CONSTRAINT values_pk;
       public         postgres    false    226            ?
           1259    16508    category_id_uindex    INDEX     N   CREATE UNIQUE INDEX category_id_uindex ON public.categories USING btree (id);
 &   DROP INDEX public.category_id_uindex;
       public         postgres    false    201            ?
           1259    16678    comment_id_uindex    INDEX     K   CREATE UNIQUE INDEX comment_id_uindex ON public.comments USING btree (id);
 %   DROP INDEX public.comment_id_uindex;
       public         postgres    false    213            ?
           1259    16829    options_id_uindex    INDEX     J   CREATE UNIQUE INDEX options_id_uindex ON public.options USING btree (id);
 %   DROP INDEX public.options_id_uindex;
       public         postgres    false    222            ?
           1259    16826    order_product_id_uindex    INDEX     V   CREATE UNIQUE INDEX order_product_id_uindex ON public.order_product USING btree (id);
 +   DROP INDEX public.order_product_id_uindex;
       public         postgres    false    209            ?
           1259    16478    orders_id_uindex    INDEX     H   CREATE UNIQUE INDEX orders_id_uindex ON public.orders USING btree (id);
 $   DROP INDEX public.orders_id_uindex;
       public         postgres    false    199            ?
           1259    16664    products_id_uindex    INDEX     L   CREATE UNIQUE INDEX products_id_uindex ON public.products USING btree (id);
 &   DROP INDEX public.products_id_uindex;
       public         postgres    false    207            ?
           1259    16713    ratings_id_uindex    INDEX     J   CREATE UNIQUE INDEX ratings_id_uindex ON public.ratings USING btree (id);
 %   DROP INDEX public.ratings_id_uindex;
       public         postgres    false    217            ?
           1259    16536    roles_id_uindex    INDEX     F   CREATE UNIQUE INDEX roles_id_uindex ON public.roles USING btree (id);
 #   DROP INDEX public.roles_id_uindex;
       public         postgres    false    203            ?
           1259    16469    users_id_uindex    INDEX     F   CREATE UNIQUE INDEX users_id_uindex ON public.users USING btree (id);
 #   DROP INDEX public.users_id_uindex;
       public         postgres    false    197            ?
           1259    16832    values_id_uindex    INDEX     J   CREATE UNIQUE INDEX values_id_uindex ON public."values" USING btree (id);
 $   DROP INDEX public.values_id_uindex;
       public         postgres    false    226            ?
           2606    16689    comments comment_products_id_fk    FK CONSTRAINT     ?   ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comment_products_id_fk FOREIGN KEY (product_id) REFERENCES public.products(id);
 I   ALTER TABLE ONLY public.comments DROP CONSTRAINT comment_products_id_fk;
       public       postgres    false    2783    213    207            ?
           2606    16702    comments comments_users_id_fk    FK CONSTRAINT     |   ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_users_id_fk FOREIGN KEY (user_id) REFERENCES public.users(id);
 G   ALTER TABLE ONLY public.comments DROP CONSTRAINT comments_users_id_fk;
       public       postgres    false    213    2773    197            ?
           2606    16787     options options_categories_id_fk    FK CONSTRAINT     ?   ALTER TABLE ONLY public.options
    ADD CONSTRAINT options_categories_id_fk FOREIGN KEY (category_id) REFERENCES public.categories(id);
 J   ALTER TABLE ONLY public.options DROP CONSTRAINT options_categories_id_fk;
       public       postgres    false    222    2777    201            ?
           2606    16659 (   order_product order_product_orders_id_fk    FK CONSTRAINT     ?   ALTER TABLE ONLY public.order_product
    ADD CONSTRAINT order_product_orders_id_fk FOREIGN KEY (order_id) REFERENCES public.orders(id);
 R   ALTER TABLE ONLY public.order_product DROP CONSTRAINT order_product_orders_id_fk;
       public       postgres    false    2776    199    209            ?
           2606    16667 *   order_product order_product_products_id_fk    FK CONSTRAINT     ?   ALTER TABLE ONLY public.order_product
    ADD CONSTRAINT order_product_products_id_fk FOREIGN KEY (product_id) REFERENCES public.products(id);
 T   ALTER TABLE ONLY public.order_product DROP CONSTRAINT order_product_products_id_fk;
       public       postgres    false    207    209    2783            ?
           2606    16497    orders orders_users_id_fk    FK CONSTRAINT     x   ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_users_id_fk FOREIGN KEY (user_id) REFERENCES public.users(id);
 C   ALTER TABLE ONLY public.orders DROP CONSTRAINT orders_users_id_fk;
       public       postgres    false    199    2773    197            ?
           2606    16567 "   products products_categories_id_fk    FK CONSTRAINT     ?   ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_categories_id_fk FOREIGN KEY (category_id) REFERENCES public.categories(id);
 L   ALTER TABLE ONLY public.products DROP CONSTRAINT products_categories_id_fk;
       public       postgres    false    2777    207    201            ?
           2606    16741    ratings ratings_products_id_fk    FK CONSTRAINT     ?   ALTER TABLE ONLY public.ratings
    ADD CONSTRAINT ratings_products_id_fk FOREIGN KEY (product_id) REFERENCES public.products(id);
 H   ALTER TABLE ONLY public.ratings DROP CONSTRAINT ratings_products_id_fk;
       public       postgres    false    207    217    2783            ?
           2606    16754    ratings ratings_users_id_fk    FK CONSTRAINT     z   ALTER TABLE ONLY public.ratings
    ADD CONSTRAINT ratings_users_id_fk FOREIGN KEY (user_id) REFERENCES public.users(id);
 E   ALTER TABLE ONLY public.ratings DROP CONSTRAINT ratings_users_id_fk;
       public       postgres    false    2773    197    217            ?
           2606    16539    users users_roles_id_fk    FK CONSTRAINT     v   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_roles_id_fk FOREIGN KEY (role_id) REFERENCES public.roles(id);
 A   ALTER TABLE ONLY public.users DROP CONSTRAINT users_roles_id_fk;
       public       postgres    false    203    197    2782            y   ]   x???	?0Dϻ?????Āz???B!?5?t???1?7?`ǋ?#^:m'???DO????0?\(?Yƅ3W?2n$?)?tfE*U? ??7#      ?      x?????? ? ?      ?      x?????? ? ?      ?      x?????? ? ?      w      x?????? ? ?            x?????? ? ?      ?      x?????? ? ?      {   +   x?3?LL???????2?,-N-??9s?SR?K???=... ?l&      u   B   x?3?t?+M,??IM?L?r3s??J9MM9??u?t?ͬ????89c??b???? I?      ?      x?????? ? ?     