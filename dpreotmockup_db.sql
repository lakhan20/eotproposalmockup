toc.dat                                                                                             0000600 0004000 0002000 00000036220 14650717022 0014446 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        PGDMP                       |            dpreotmockup    16.2    16.2 -    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false         �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false         �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false         �           1262    24804    dpreotmockup    DATABASE        CREATE DATABASE dpreotmockup WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_India.1252';
    DROP DATABASE dpreotmockup;
                postgres    false         �            1255    24909     fn_createrole(character varying)    FUNCTION     b  CREATE FUNCTION public.fn_createrole(_role_name character varying) RETURNS integer
    LANGUAGE plpgsql
    AS $$
BEGIN
	BEGIN
INSERT INTO public.tbl_role(role_name) VALUES (_role_name);
RETURN 1;
		EXCEPTION
        WHEN OTHERS THEN
            -- Handle errors and log the issue
            RAISE NOTICE 'An error occurred: %', SQLERRM;
	END;
END;
$$;
 B   DROP FUNCTION public.fn_createrole(_role_name character varying);
       public          postgres    false         �            1255    24936 5   fn_createuser(character varying, text, text, integer)    FUNCTION     �  CREATE FUNCTION public.fn_createuser(_user_name character varying, _user_email text, _user_password text, _role_id integer) RETURNS integer
    LANGUAGE plpgsql
    AS $$
BEGIN
	BEGIN
INSERT INTO public.tbl_user(user_name, user_email, user_password, role_id)VALUES (_user_name,_user_email,_user_password,_role_id);
RETURN 1;
		EXCEPTION
        WHEN OTHERS THEN
            -- Handle errors and log the issue
            RAISE NOTICE 'An error occurred: %', SQLERRM;
	END;
END;
$$;
 {   DROP FUNCTION public.fn_createuser(_user_name character varying, _user_email text, _user_password text, _role_id integer);
       public          postgres    false         �            1255    24947    fn_login(text, text)    FUNCTION       CREATE FUNCTION public.fn_login(_user_email text, _user_password text) RETURNS TABLE(user_id integer, user_name character varying, user_email text, user_password text, status boolean, role_id integer, role_name character varying)
    LANGUAGE plpgsql
    AS $$
BEGIN
	RETURN QUERY 
	SELECT u.user_id, u.user_name, u.user_email, u.user_password, u.status, r.role_id,r.role_name FROM public.tbl_user u JOIN public.tbl_role  r  on u.role_id=r.role_id WHERE u.status=true and u.user_email=_user_email and u.user_password= _user_password;
END;
$$;
 F   DROP FUNCTION public.fn_login(_user_email text, _user_password text);
       public          postgres    false         �            1259    24889    tbl_eotform    TABLE     P  CREATE TABLE public.tbl_eotform (
    eot_id integer NOT NULL,
    eot_reason text,
    whosedefault_id integer,
    eot_dueto text,
    eot_claimingstage text,
    dpr_lastdeliverable character varying,
    delay_from timestamp without time zone,
    delay_to timestamp without time zone,
    extention_applied_days integer,
    is_abletoabsorb_delay boolean,
    is_advancenotice boolean,
    dateofnotice timestamp without time zone,
    upload_notice character varying,
    is_dprapplicable boolean,
    compensation_amount double precision,
    clause_no character varying,
    upload_detailedproposal character varying,
    created_at timestamp without time zone DEFAULT (date_trunc('second'::text, now()))::timestamp without time zone,
    updated_at timestamp without time zone,
    status boolean DEFAULT true,
    eotstatus_id integer
);
    DROP TABLE public.tbl_eotform;
       public         heap    postgres    false         �            1259    24888    tbl_eotform_eot_id_seq    SEQUENCE     �   CREATE SEQUENCE public.tbl_eotform_eot_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.tbl_eotform_eot_id_seq;
       public          postgres    false    222         �           0    0    tbl_eotform_eot_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.tbl_eotform_eot_id_seq OWNED BY public.tbl_eotform.eot_id;
          public          postgres    false    221         �            1259    24871    tbl_eotstatus    TABLE     j   CREATE TABLE public.tbl_eotstatus (
    eotstatus_id integer NOT NULL,
    eotstatus character varying
);
 !   DROP TABLE public.tbl_eotstatus;
       public         heap    postgres    false         �            1259    24870    tbl_eotstatus_eotstatus_id_seq    SEQUENCE     �   CREATE SEQUENCE public.tbl_eotstatus_eotstatus_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 5   DROP SEQUENCE public.tbl_eotstatus_eotstatus_id_seq;
       public          postgres    false    218         �           0    0    tbl_eotstatus_eotstatus_id_seq    SEQUENCE OWNED BY     a   ALTER SEQUENCE public.tbl_eotstatus_eotstatus_id_seq OWNED BY public.tbl_eotstatus.eotstatus_id;
          public          postgres    false    217         �            1259    24832    tbl_role    TABLE     `   CREATE TABLE public.tbl_role (
    role_id integer NOT NULL,
    role_name character varying
);
    DROP TABLE public.tbl_role;
       public         heap    postgres    false         �            1259    24831    tbl_role_role_id_seq    SEQUENCE     �   CREATE SEQUENCE public.tbl_role_role_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.tbl_role_role_id_seq;
       public          postgres    false    216         �           0    0    tbl_role_role_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.tbl_role_role_id_seq OWNED BY public.tbl_role.role_id;
          public          postgres    false    215         �            1259    24920    tbl_user    TABLE     e  CREATE TABLE public.tbl_user (
    user_id integer NOT NULL,
    user_name character varying,
    user_email text,
    user_password text,
    status boolean DEFAULT true,
    role_id integer,
    created_at timestamp without time zone DEFAULT (date_trunc('second'::text, now()))::timestamp without time zone,
    modified_at timestamp without time zone
);
    DROP TABLE public.tbl_user;
       public         heap    postgres    false         �            1259    24919    tbl_user_user_id_seq    SEQUENCE     �   CREATE SEQUENCE public.tbl_user_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.tbl_user_user_id_seq;
       public          postgres    false    224         �           0    0    tbl_user_user_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.tbl_user_user_id_seq OWNED BY public.tbl_user.user_id;
          public          postgres    false    223         �            1259    24880    tbl_whosedefault    TABLE     r   CREATE TABLE public.tbl_whosedefault (
    whosedefault_id integer NOT NULL,
    whosedefault_description text
);
 $   DROP TABLE public.tbl_whosedefault;
       public         heap    postgres    false         �            1259    24879 $   tbl_whosedefault_whosedefault_id_seq    SEQUENCE     �   CREATE SEQUENCE public.tbl_whosedefault_whosedefault_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ;   DROP SEQUENCE public.tbl_whosedefault_whosedefault_id_seq;
       public          postgres    false    220         �           0    0 $   tbl_whosedefault_whosedefault_id_seq    SEQUENCE OWNED BY     m   ALTER SEQUENCE public.tbl_whosedefault_whosedefault_id_seq OWNED BY public.tbl_whosedefault.whosedefault_id;
          public          postgres    false    219         4           2604    24892    tbl_eotform eot_id    DEFAULT     x   ALTER TABLE ONLY public.tbl_eotform ALTER COLUMN eot_id SET DEFAULT nextval('public.tbl_eotform_eot_id_seq'::regclass);
 A   ALTER TABLE public.tbl_eotform ALTER COLUMN eot_id DROP DEFAULT;
       public          postgres    false    221    222    222         2           2604    24874    tbl_eotstatus eotstatus_id    DEFAULT     �   ALTER TABLE ONLY public.tbl_eotstatus ALTER COLUMN eotstatus_id SET DEFAULT nextval('public.tbl_eotstatus_eotstatus_id_seq'::regclass);
 I   ALTER TABLE public.tbl_eotstatus ALTER COLUMN eotstatus_id DROP DEFAULT;
       public          postgres    false    218    217    218         1           2604    24835    tbl_role role_id    DEFAULT     t   ALTER TABLE ONLY public.tbl_role ALTER COLUMN role_id SET DEFAULT nextval('public.tbl_role_role_id_seq'::regclass);
 ?   ALTER TABLE public.tbl_role ALTER COLUMN role_id DROP DEFAULT;
       public          postgres    false    215    216    216         7           2604    24923    tbl_user user_id    DEFAULT     t   ALTER TABLE ONLY public.tbl_user ALTER COLUMN user_id SET DEFAULT nextval('public.tbl_user_user_id_seq'::regclass);
 ?   ALTER TABLE public.tbl_user ALTER COLUMN user_id DROP DEFAULT;
       public          postgres    false    224    223    224         3           2604    24883     tbl_whosedefault whosedefault_id    DEFAULT     �   ALTER TABLE ONLY public.tbl_whosedefault ALTER COLUMN whosedefault_id SET DEFAULT nextval('public.tbl_whosedefault_whosedefault_id_seq'::regclass);
 O   ALTER TABLE public.tbl_whosedefault ALTER COLUMN whosedefault_id DROP DEFAULT;
       public          postgres    false    219    220    220         �          0    24889    tbl_eotform 
   TABLE DATA           j  COPY public.tbl_eotform (eot_id, eot_reason, whosedefault_id, eot_dueto, eot_claimingstage, dpr_lastdeliverable, delay_from, delay_to, extention_applied_days, is_abletoabsorb_delay, is_advancenotice, dateofnotice, upload_notice, is_dprapplicable, compensation_amount, clause_no, upload_detailedproposal, created_at, updated_at, status, eotstatus_id) FROM stdin;
    public          postgres    false    222       4829.dat �          0    24871    tbl_eotstatus 
   TABLE DATA           @   COPY public.tbl_eotstatus (eotstatus_id, eotstatus) FROM stdin;
    public          postgres    false    218       4825.dat �          0    24832    tbl_role 
   TABLE DATA           6   COPY public.tbl_role (role_id, role_name) FROM stdin;
    public          postgres    false    216       4823.dat �          0    24920    tbl_user 
   TABLE DATA           {   COPY public.tbl_user (user_id, user_name, user_email, user_password, status, role_id, created_at, modified_at) FROM stdin;
    public          postgres    false    224       4831.dat �          0    24880    tbl_whosedefault 
   TABLE DATA           U   COPY public.tbl_whosedefault (whosedefault_id, whosedefault_description) FROM stdin;
    public          postgres    false    220       4827.dat �           0    0    tbl_eotform_eot_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.tbl_eotform_eot_id_seq', 1, false);
          public          postgres    false    221         �           0    0    tbl_eotstatus_eotstatus_id_seq    SEQUENCE SET     M   SELECT pg_catalog.setval('public.tbl_eotstatus_eotstatus_id_seq', 1, false);
          public          postgres    false    217         �           0    0    tbl_role_role_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.tbl_role_role_id_seq', 4, true);
          public          postgres    false    215         �           0    0    tbl_user_user_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.tbl_user_user_id_seq', 4, true);
          public          postgres    false    223         �           0    0 $   tbl_whosedefault_whosedefault_id_seq    SEQUENCE SET     S   SELECT pg_catalog.setval('public.tbl_whosedefault_whosedefault_id_seq', 1, false);
          public          postgres    false    219         A           2606    24898    tbl_eotform tbl_eotform_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.tbl_eotform
    ADD CONSTRAINT tbl_eotform_pkey PRIMARY KEY (eot_id);
 F   ALTER TABLE ONLY public.tbl_eotform DROP CONSTRAINT tbl_eotform_pkey;
       public            postgres    false    222         =           2606    24878     tbl_eotstatus tbl_eotstatus_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public.tbl_eotstatus
    ADD CONSTRAINT tbl_eotstatus_pkey PRIMARY KEY (eotstatus_id);
 J   ALTER TABLE ONLY public.tbl_eotstatus DROP CONSTRAINT tbl_eotstatus_pkey;
       public            postgres    false    218         ;           2606    24839    tbl_role tbl_role_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY public.tbl_role
    ADD CONSTRAINT tbl_role_pkey PRIMARY KEY (role_id);
 @   ALTER TABLE ONLY public.tbl_role DROP CONSTRAINT tbl_role_pkey;
       public            postgres    false    216         C           2606    24929    tbl_user tbl_user_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY public.tbl_user
    ADD CONSTRAINT tbl_user_pkey PRIMARY KEY (user_id);
 @   ALTER TABLE ONLY public.tbl_user DROP CONSTRAINT tbl_user_pkey;
       public            postgres    false    224         ?           2606    24887 &   tbl_whosedefault tbl_whosedefault_pkey 
   CONSTRAINT     q   ALTER TABLE ONLY public.tbl_whosedefault
    ADD CONSTRAINT tbl_whosedefault_pkey PRIMARY KEY (whosedefault_id);
 P   ALTER TABLE ONLY public.tbl_whosedefault DROP CONSTRAINT tbl_whosedefault_pkey;
       public            postgres    false    220         D           2606    24904 )   tbl_eotform tbl_eotform_eotstatus_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.tbl_eotform
    ADD CONSTRAINT tbl_eotform_eotstatus_id_fkey FOREIGN KEY (eotstatus_id) REFERENCES public.tbl_eotstatus(eotstatus_id);
 S   ALTER TABLE ONLY public.tbl_eotform DROP CONSTRAINT tbl_eotform_eotstatus_id_fkey;
       public          postgres    false    218    4669    222         E           2606    24899 ,   tbl_eotform tbl_eotform_whosedefault_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.tbl_eotform
    ADD CONSTRAINT tbl_eotform_whosedefault_id_fkey FOREIGN KEY (whosedefault_id) REFERENCES public.tbl_whosedefault(whosedefault_id);
 V   ALTER TABLE ONLY public.tbl_eotform DROP CONSTRAINT tbl_eotform_whosedefault_id_fkey;
       public          postgres    false    220    4671    222         F           2606    24930    tbl_user tbl_user_role_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.tbl_user
    ADD CONSTRAINT tbl_user_role_id_fkey FOREIGN KEY (role_id) REFERENCES public.tbl_role(role_id);
 H   ALTER TABLE ONLY public.tbl_user DROP CONSTRAINT tbl_user_role_id_fkey;
       public          postgres    false    216    224    4667                                                                                                                                                                                                                                                                                                                                                                                        4829.dat                                                                                            0000600 0004000 0002000 00000000005 14650717023 0014260 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        \.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           4825.dat                                                                                            0000600 0004000 0002000 00000000005 14650717023 0014254 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        \.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           4823.dat                                                                                            0000600 0004000 0002000 00000000026 14650717023 0014255 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        2	dpr
3	pmu
4	ro
\.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          4831.dat                                                                                            0000600 0004000 0002000 00000000303 14650717023 0014252 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        2	dpr consultant 1	dprconsultant1@gmail.com	dpr123	t	2	2024-07-24 10:59:07	\N
3	pmu 1	pmu1@gmail.com	pmu123	t	3	2024-07-24 10:59:41	\N
4	ro 1	ro1@gmail.com	ro1234	t	4	2024-07-24 11:00:02	\N
\.


                                                                                                                                                                                                                                                                                                                             4827.dat                                                                                            0000600 0004000 0002000 00000000005 14650717023 0014256 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        \.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           restore.sql                                                                                         0000600 0004000 0002000 00000032476 14650717023 0015405 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        --
-- NOTE:
--
-- File paths need to be edited. Search for $$PATH$$ and
-- replace it with the path to the directory containing
-- the extracted data files.
--
--
-- PostgreSQL database dump
--

-- Dumped from database version 16.2
-- Dumped by pg_dump version 16.2

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

DROP DATABASE dpreotmockup;
--
-- Name: dpreotmockup; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE dpreotmockup WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_India.1252';


ALTER DATABASE dpreotmockup OWNER TO postgres;

\connect dpreotmockup

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
-- Name: fn_createrole(character varying); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.fn_createrole(_role_name character varying) RETURNS integer
    LANGUAGE plpgsql
    AS $$
BEGIN
	BEGIN
INSERT INTO public.tbl_role(role_name) VALUES (_role_name);
RETURN 1;
		EXCEPTION
        WHEN OTHERS THEN
            -- Handle errors and log the issue
            RAISE NOTICE 'An error occurred: %', SQLERRM;
	END;
END;
$$;


ALTER FUNCTION public.fn_createrole(_role_name character varying) OWNER TO postgres;

--
-- Name: fn_createuser(character varying, text, text, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.fn_createuser(_user_name character varying, _user_email text, _user_password text, _role_id integer) RETURNS integer
    LANGUAGE plpgsql
    AS $$
BEGIN
	BEGIN
INSERT INTO public.tbl_user(user_name, user_email, user_password, role_id)VALUES (_user_name,_user_email,_user_password,_role_id);
RETURN 1;
		EXCEPTION
        WHEN OTHERS THEN
            -- Handle errors and log the issue
            RAISE NOTICE 'An error occurred: %', SQLERRM;
	END;
END;
$$;


ALTER FUNCTION public.fn_createuser(_user_name character varying, _user_email text, _user_password text, _role_id integer) OWNER TO postgres;

--
-- Name: fn_login(text, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.fn_login(_user_email text, _user_password text) RETURNS TABLE(user_id integer, user_name character varying, user_email text, user_password text, status boolean, role_id integer, role_name character varying)
    LANGUAGE plpgsql
    AS $$
BEGIN
	RETURN QUERY 
	SELECT u.user_id, u.user_name, u.user_email, u.user_password, u.status, r.role_id,r.role_name FROM public.tbl_user u JOIN public.tbl_role  r  on u.role_id=r.role_id WHERE u.status=true and u.user_email=_user_email and u.user_password= _user_password;
END;
$$;


ALTER FUNCTION public.fn_login(_user_email text, _user_password text) OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: tbl_eotform; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tbl_eotform (
    eot_id integer NOT NULL,
    eot_reason text,
    whosedefault_id integer,
    eot_dueto text,
    eot_claimingstage text,
    dpr_lastdeliverable character varying,
    delay_from timestamp without time zone,
    delay_to timestamp without time zone,
    extention_applied_days integer,
    is_abletoabsorb_delay boolean,
    is_advancenotice boolean,
    dateofnotice timestamp without time zone,
    upload_notice character varying,
    is_dprapplicable boolean,
    compensation_amount double precision,
    clause_no character varying,
    upload_detailedproposal character varying,
    created_at timestamp without time zone DEFAULT (date_trunc('second'::text, now()))::timestamp without time zone,
    updated_at timestamp without time zone,
    status boolean DEFAULT true,
    eotstatus_id integer
);


ALTER TABLE public.tbl_eotform OWNER TO postgres;

--
-- Name: tbl_eotform_eot_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tbl_eotform_eot_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.tbl_eotform_eot_id_seq OWNER TO postgres;

--
-- Name: tbl_eotform_eot_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tbl_eotform_eot_id_seq OWNED BY public.tbl_eotform.eot_id;


--
-- Name: tbl_eotstatus; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tbl_eotstatus (
    eotstatus_id integer NOT NULL,
    eotstatus character varying
);


ALTER TABLE public.tbl_eotstatus OWNER TO postgres;

--
-- Name: tbl_eotstatus_eotstatus_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tbl_eotstatus_eotstatus_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.tbl_eotstatus_eotstatus_id_seq OWNER TO postgres;

--
-- Name: tbl_eotstatus_eotstatus_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tbl_eotstatus_eotstatus_id_seq OWNED BY public.tbl_eotstatus.eotstatus_id;


--
-- Name: tbl_role; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tbl_role (
    role_id integer NOT NULL,
    role_name character varying
);


ALTER TABLE public.tbl_role OWNER TO postgres;

--
-- Name: tbl_role_role_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tbl_role_role_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.tbl_role_role_id_seq OWNER TO postgres;

--
-- Name: tbl_role_role_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tbl_role_role_id_seq OWNED BY public.tbl_role.role_id;


--
-- Name: tbl_user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tbl_user (
    user_id integer NOT NULL,
    user_name character varying,
    user_email text,
    user_password text,
    status boolean DEFAULT true,
    role_id integer,
    created_at timestamp without time zone DEFAULT (date_trunc('second'::text, now()))::timestamp without time zone,
    modified_at timestamp without time zone
);


ALTER TABLE public.tbl_user OWNER TO postgres;

--
-- Name: tbl_user_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tbl_user_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.tbl_user_user_id_seq OWNER TO postgres;

--
-- Name: tbl_user_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tbl_user_user_id_seq OWNED BY public.tbl_user.user_id;


--
-- Name: tbl_whosedefault; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tbl_whosedefault (
    whosedefault_id integer NOT NULL,
    whosedefault_description text
);


ALTER TABLE public.tbl_whosedefault OWNER TO postgres;

--
-- Name: tbl_whosedefault_whosedefault_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tbl_whosedefault_whosedefault_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.tbl_whosedefault_whosedefault_id_seq OWNER TO postgres;

--
-- Name: tbl_whosedefault_whosedefault_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tbl_whosedefault_whosedefault_id_seq OWNED BY public.tbl_whosedefault.whosedefault_id;


--
-- Name: tbl_eotform eot_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tbl_eotform ALTER COLUMN eot_id SET DEFAULT nextval('public.tbl_eotform_eot_id_seq'::regclass);


--
-- Name: tbl_eotstatus eotstatus_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tbl_eotstatus ALTER COLUMN eotstatus_id SET DEFAULT nextval('public.tbl_eotstatus_eotstatus_id_seq'::regclass);


--
-- Name: tbl_role role_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tbl_role ALTER COLUMN role_id SET DEFAULT nextval('public.tbl_role_role_id_seq'::regclass);


--
-- Name: tbl_user user_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tbl_user ALTER COLUMN user_id SET DEFAULT nextval('public.tbl_user_user_id_seq'::regclass);


--
-- Name: tbl_whosedefault whosedefault_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tbl_whosedefault ALTER COLUMN whosedefault_id SET DEFAULT nextval('public.tbl_whosedefault_whosedefault_id_seq'::regclass);


--
-- Data for Name: tbl_eotform; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tbl_eotform (eot_id, eot_reason, whosedefault_id, eot_dueto, eot_claimingstage, dpr_lastdeliverable, delay_from, delay_to, extention_applied_days, is_abletoabsorb_delay, is_advancenotice, dateofnotice, upload_notice, is_dprapplicable, compensation_amount, clause_no, upload_detailedproposal, created_at, updated_at, status, eotstatus_id) FROM stdin;
\.
COPY public.tbl_eotform (eot_id, eot_reason, whosedefault_id, eot_dueto, eot_claimingstage, dpr_lastdeliverable, delay_from, delay_to, extention_applied_days, is_abletoabsorb_delay, is_advancenotice, dateofnotice, upload_notice, is_dprapplicable, compensation_amount, clause_no, upload_detailedproposal, created_at, updated_at, status, eotstatus_id) FROM '$$PATH$$/4829.dat';

--
-- Data for Name: tbl_eotstatus; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tbl_eotstatus (eotstatus_id, eotstatus) FROM stdin;
\.
COPY public.tbl_eotstatus (eotstatus_id, eotstatus) FROM '$$PATH$$/4825.dat';

--
-- Data for Name: tbl_role; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tbl_role (role_id, role_name) FROM stdin;
\.
COPY public.tbl_role (role_id, role_name) FROM '$$PATH$$/4823.dat';

--
-- Data for Name: tbl_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tbl_user (user_id, user_name, user_email, user_password, status, role_id, created_at, modified_at) FROM stdin;
\.
COPY public.tbl_user (user_id, user_name, user_email, user_password, status, role_id, created_at, modified_at) FROM '$$PATH$$/4831.dat';

--
-- Data for Name: tbl_whosedefault; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tbl_whosedefault (whosedefault_id, whosedefault_description) FROM stdin;
\.
COPY public.tbl_whosedefault (whosedefault_id, whosedefault_description) FROM '$$PATH$$/4827.dat';

--
-- Name: tbl_eotform_eot_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tbl_eotform_eot_id_seq', 1, false);


--
-- Name: tbl_eotstatus_eotstatus_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tbl_eotstatus_eotstatus_id_seq', 1, false);


--
-- Name: tbl_role_role_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tbl_role_role_id_seq', 4, true);


--
-- Name: tbl_user_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tbl_user_user_id_seq', 4, true);


--
-- Name: tbl_whosedefault_whosedefault_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tbl_whosedefault_whosedefault_id_seq', 1, false);


--
-- Name: tbl_eotform tbl_eotform_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tbl_eotform
    ADD CONSTRAINT tbl_eotform_pkey PRIMARY KEY (eot_id);


--
-- Name: tbl_eotstatus tbl_eotstatus_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tbl_eotstatus
    ADD CONSTRAINT tbl_eotstatus_pkey PRIMARY KEY (eotstatus_id);


--
-- Name: tbl_role tbl_role_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tbl_role
    ADD CONSTRAINT tbl_role_pkey PRIMARY KEY (role_id);


--
-- Name: tbl_user tbl_user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tbl_user
    ADD CONSTRAINT tbl_user_pkey PRIMARY KEY (user_id);


--
-- Name: tbl_whosedefault tbl_whosedefault_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tbl_whosedefault
    ADD CONSTRAINT tbl_whosedefault_pkey PRIMARY KEY (whosedefault_id);


--
-- Name: tbl_eotform tbl_eotform_eotstatus_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tbl_eotform
    ADD CONSTRAINT tbl_eotform_eotstatus_id_fkey FOREIGN KEY (eotstatus_id) REFERENCES public.tbl_eotstatus(eotstatus_id);


--
-- Name: tbl_eotform tbl_eotform_whosedefault_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tbl_eotform
    ADD CONSTRAINT tbl_eotform_whosedefault_id_fkey FOREIGN KEY (whosedefault_id) REFERENCES public.tbl_whosedefault(whosedefault_id);


--
-- Name: tbl_user tbl_user_role_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tbl_user
    ADD CONSTRAINT tbl_user_role_id_fkey FOREIGN KEY (role_id) REFERENCES public.tbl_role(role_id);


--
-- PostgreSQL database dump complete
--

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  