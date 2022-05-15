--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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

DROP DATABASE number_guess;
--
-- Name: number_guess; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guess OWNER TO freecodecamp;

\connect number_guess

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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    games_played integer,
    best_game integer,
    username character varying(30) NOT NULL
);


ALTER TABLE public.users OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_id_seq OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES (17, 2, 676, 'user_1652615877703');
INSERT INTO public.users VALUES (16, 5, 767, 'user_1652615877704');
INSERT INTO public.users VALUES (18, 1, 4, 'ELI');
INSERT INTO public.users VALUES (19, 1, 3, 'Eli');
INSERT INTO public.users VALUES (1, 10, 8, 'eli');
INSERT INTO public.users VALUES (20, 1, 7, 'Ope');
INSERT INTO public.users VALUES (22, 2, 428, 'user_1652616612411');
INSERT INTO public.users VALUES (21, 5, 391, 'user_1652616612412');
INSERT INTO public.users VALUES (24, 2, 430, 'user_1652616805606');
INSERT INTO public.users VALUES (23, 5, 830, 'user_1652616805607');
INSERT INTO public.users VALUES (26, 2, 995, 'user_1652616842889');
INSERT INTO public.users VALUES (25, 5, 913, 'user_1652616842890');
INSERT INTO public.users VALUES (28, 2, 826, 'user_1652616952833');
INSERT INTO public.users VALUES (27, 5, 847, 'user_1652616952834');
INSERT INTO public.users VALUES (30, 2, 478, 'user_1652617031509');
INSERT INTO public.users VALUES (29, 5, 931, 'user_1652617031510');
INSERT INTO public.users VALUES (32, 2, 804, 'user_1652617091019');
INSERT INTO public.users VALUES (15, 2, 584, 'user_1652615731634');
INSERT INTO public.users VALUES (14, 5, 531, 'user_1652615731635');
INSERT INTO public.users VALUES (31, 5, 952, 'user_1652617091020');


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_user_id_seq', 32, true);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- Name: users users_user_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_user_name_key UNIQUE (username);


--
-- PostgreSQL database dump complete
--

