PGDMP                         {            todoapp    15.3    15.3 &    "           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            #           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            $           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            %           1262    16456    todoapp    DATABASE     �   CREATE DATABASE todoapp WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_United States.1252';
    DROP DATABASE todoapp;
                postgres    false            �            1259    16484    priority    TABLE     �   CREATE TABLE public.priority (
    id_priority integer NOT NULL,
    priority_name character varying(10),
    description character varying(100)
);
    DROP TABLE public.priority;
       public         heap    postgres    false            �            1259    16483    priority_id_priority_seq    SEQUENCE     �   CREATE SEQUENCE public.priority_id_priority_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.priority_id_priority_seq;
       public          postgres    false    221            &           0    0    priority_id_priority_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.priority_id_priority_seq OWNED BY public.priority.id_priority;
          public          postgres    false    220            �            1259    16458    task    TABLE        CREATE TABLE public.task (
    id_task integer NOT NULL,
    title character varying(50) NOT NULL,
    priority_id integer DEFAULT 1 NOT NULL,
    user_id integer,
    completed boolean DEFAULT false NOT NULL,
    "createdAt" date,
    "updatedAt" date
);
    DROP TABLE public.task;
       public         heap    postgres    false            �            1259    16457    task_id_task_seq    SEQUENCE     �   CREATE SEQUENCE public.task_id_task_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.task_id_task_seq;
       public          postgres    false    215            '           0    0    task_id_task_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.task_id_task_seq OWNED BY public.task.id_task;
          public          postgres    false    214            �            1259    16477 
   tasks_list    TABLE     q   CREATE TABLE public.tasks_list (
    id_tasks_list integer NOT NULL,
    user_id integer,
    task_id integer
);
    DROP TABLE public.tasks_list;
       public         heap    postgres    false            �            1259    16476    tasks_list_id_tasks_list_seq    SEQUENCE     �   CREATE SEQUENCE public.tasks_list_id_tasks_list_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE public.tasks_list_id_tasks_list_seq;
       public          postgres    false    219            (           0    0    tasks_list_id_tasks_list_seq    SEQUENCE OWNED BY     ]   ALTER SEQUENCE public.tasks_list_id_tasks_list_seq OWNED BY public.tasks_list.id_tasks_list;
          public          postgres    false    218            �            1259    16467    user_app    TABLE     �   CREATE TABLE public.user_app (
    id_user integer NOT NULL,
    email character varying(50) NOT NULL,
    is_active boolean DEFAULT true NOT NULL,
    tasks_id integer,
    user_name character varying(20)
);
    DROP TABLE public.user_app;
       public         heap    postgres    false            �            1259    16466    user_app_id_user_seq    SEQUENCE     �   CREATE SEQUENCE public.user_app_id_user_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.user_app_id_user_seq;
       public          postgres    false    217            )           0    0    user_app_id_user_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.user_app_id_user_seq OWNED BY public.user_app.id_user;
          public          postgres    false    216            z           2604    16487    priority id_priority    DEFAULT     |   ALTER TABLE ONLY public.priority ALTER COLUMN id_priority SET DEFAULT nextval('public.priority_id_priority_seq'::regclass);
 C   ALTER TABLE public.priority ALTER COLUMN id_priority DROP DEFAULT;
       public          postgres    false    220    221    221            t           2604    16461    task id_task    DEFAULT     l   ALTER TABLE ONLY public.task ALTER COLUMN id_task SET DEFAULT nextval('public.task_id_task_seq'::regclass);
 ;   ALTER TABLE public.task ALTER COLUMN id_task DROP DEFAULT;
       public          postgres    false    215    214    215            y           2604    16480    tasks_list id_tasks_list    DEFAULT     �   ALTER TABLE ONLY public.tasks_list ALTER COLUMN id_tasks_list SET DEFAULT nextval('public.tasks_list_id_tasks_list_seq'::regclass);
 G   ALTER TABLE public.tasks_list ALTER COLUMN id_tasks_list DROP DEFAULT;
       public          postgres    false    218    219    219            w           2604    16470    user_app id_user    DEFAULT     t   ALTER TABLE ONLY public.user_app ALTER COLUMN id_user SET DEFAULT nextval('public.user_app_id_user_seq'::regclass);
 ?   ALTER TABLE public.user_app ALTER COLUMN id_user DROP DEFAULT;
       public          postgres    false    217    216    217                      0    16484    priority 
   TABLE DATA           K   COPY public.priority (id_priority, priority_name, description) FROM stdin;
    public          postgres    false    221   �*                 0    16458    task 
   TABLE DATA           i   COPY public.task (id_task, title, priority_id, user_id, completed, "createdAt", "updatedAt") FROM stdin;
    public          postgres    false    215   9+                 0    16477 
   tasks_list 
   TABLE DATA           E   COPY public.tasks_list (id_tasks_list, user_id, task_id) FROM stdin;
    public          postgres    false    219   ,                 0    16467    user_app 
   TABLE DATA           R   COPY public.user_app (id_user, email, is_active, tasks_id, user_name) FROM stdin;
    public          postgres    false    217   !,       *           0    0    priority_id_priority_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.priority_id_priority_seq', 3, true);
          public          postgres    false    220            +           0    0    task_id_task_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.task_id_task_seq', 11, true);
          public          postgres    false    214            ,           0    0    tasks_list_id_tasks_list_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('public.tasks_list_id_tasks_list_seq', 1, false);
          public          postgres    false    218            -           0    0    user_app_id_user_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.user_app_id_user_seq', 4, true);
          public          postgres    false    216            ~           2606    16475    user_app email 
   CONSTRAINT     J   ALTER TABLE ONLY public.user_app
    ADD CONSTRAINT email UNIQUE (email);
 8   ALTER TABLE ONLY public.user_app DROP CONSTRAINT email;
       public            postgres    false    217            �           2606    16489    priority priority_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY public.priority
    ADD CONSTRAINT priority_pkey PRIMARY KEY (id_priority);
 @   ALTER TABLE ONLY public.priority DROP CONSTRAINT priority_pkey;
       public            postgres    false    221            |           2606    16465    task task_pkey 
   CONSTRAINT     Q   ALTER TABLE ONLY public.task
    ADD CONSTRAINT task_pkey PRIMARY KEY (id_task);
 8   ALTER TABLE ONLY public.task DROP CONSTRAINT task_pkey;
       public            postgres    false    215            �           2606    16482    tasks_list tasks_list_pkey 
   CONSTRAINT     c   ALTER TABLE ONLY public.tasks_list
    ADD CONSTRAINT tasks_list_pkey PRIMARY KEY (id_tasks_list);
 D   ALTER TABLE ONLY public.tasks_list DROP CONSTRAINT tasks_list_pkey;
       public            postgres    false    219            �           2606    16473    user_app user_app_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY public.user_app
    ADD CONSTRAINT user_app_pkey PRIMARY KEY (id_user);
 @   ALTER TABLE ONLY public.user_app DROP CONSTRAINT user_app_pkey;
       public            postgres    false    217            �           2606    16495    task priority    FK CONSTRAINT     �   ALTER TABLE ONLY public.task
    ADD CONSTRAINT priority FOREIGN KEY (priority_id) REFERENCES public.priority(id_priority) NOT VALID;
 7   ALTER TABLE ONLY public.task DROP CONSTRAINT priority;
       public          postgres    false    3204    221    215            �           2606    16510    tasks_list task    FK CONSTRAINT     |   ALTER TABLE ONLY public.tasks_list
    ADD CONSTRAINT task FOREIGN KEY (task_id) REFERENCES public.task(id_task) NOT VALID;
 9   ALTER TABLE ONLY public.tasks_list DROP CONSTRAINT task;
       public          postgres    false    215    3196    219            �           2606    16500    user_app tasks    FK CONSTRAINT     �   ALTER TABLE ONLY public.user_app
    ADD CONSTRAINT tasks FOREIGN KEY (tasks_id) REFERENCES public.tasks_list(id_tasks_list) NOT VALID;
 8   ALTER TABLE ONLY public.user_app DROP CONSTRAINT tasks;
       public          postgres    false    3202    219    217            �           2606    16490 	   task user    FK CONSTRAINT     |   ALTER TABLE ONLY public.task
    ADD CONSTRAINT "user" FOREIGN KEY (user_id) REFERENCES public.user_app(id_user) NOT VALID;
 5   ALTER TABLE ONLY public.task DROP CONSTRAINT "user";
       public          postgres    false    3200    215    217            �           2606    16505    tasks_list user    FK CONSTRAINT     �   ALTER TABLE ONLY public.tasks_list
    ADD CONSTRAINT "user" FOREIGN KEY (user_id) REFERENCES public.user_app(id_user) NOT VALID;
 ;   ALTER TABLE ONLY public.tasks_list DROP CONSTRAINT "user";
       public          postgres    false    217    3200    219               ?   x�3����,(��/�LILQHJ�J�2��uu��E�MM�L�2���t�@N�)I����� G�0         �   x�}OA�0;�����m�3�x�.a�D���ڂ�'�z@(9X���D��HV��'�Z����ja��Q�{�"S�&+$l�����n!D��(�%�A��\��W��/���G�w;J#�fhꦭ꾪MU�àg��ڌ�}��.'�y�6k���Pup"�뛫����;�+x!6J�'EHX            x������ � �         h   x�e�1�@k�1'�DW󂼀f�;alE�
~OhA�͌��0��f��_6TM�o�����IU�{u�n�&Di�C~M
�Gs�P`�!rΏ�6<$f>�o0�     