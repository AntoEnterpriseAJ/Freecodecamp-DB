--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: description; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.description (
    description_id integer NOT NULL,
    name character varying(255) NOT NULL,
    description text NOT NULL
);


ALTER TABLE public.description OWNER TO freecodecamp;

--
-- Name: description_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.description_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.description_id_seq OWNER TO freecodecamp;

--
-- Name: description_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.description_id_seq OWNED BY public.description.description_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(255) NOT NULL,
    year_created integer,
    mass numeric(5,3) NOT NULL,
    code text,
    description_id integer
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(255),
    year_created integer NOT NULL,
    mass numeric(5,3) NOT NULL,
    planet_id integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(255),
    year_created integer,
    mass numeric(5,3) NOT NULL,
    is_gaseous boolean NOT NULL,
    star_id integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(255) NOT NULL,
    year_created integer,
    mass numeric(5,3) NOT NULL,
    is_dead boolean,
    galaxy_id integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_id_seq OWNER TO freecodecamp;

--
-- Name: star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_id_seq OWNED BY public.star.star_id;


--
-- Name: description description_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.description ALTER COLUMN description_id SET DEFAULT nextval('public.description_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_id_seq'::regclass);


--
-- Data for Name: description; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.description VALUES (2, 'boring description', 'yap yap');
INSERT INTO public.description VALUES (1, 'boring description', 'yap yap yap');
INSERT INTO public.description VALUES (3, 'boring description', 'yap yap yap yap');


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (2, 'Milky way', 0, 99.999, 'MWAY', 1);
INSERT INTO public.galaxy VALUES (3, 'NotSoMilky way', 0, 99.999, 'NSMWAY', 1);
INSERT INTO public.galaxy VALUES (4, 'ZorpZorb', 0, 0.215, 'ZZZ', 2);
INSERT INTO public.galaxy VALUES (5, 'BlopBlopBlorp', 0, 0.215, 'BBB', 1);
INSERT INTO public.galaxy VALUES (6, 'YadaYadaYada', 0, 99.101, 'YAP', 2);
INSERT INTO public.galaxy VALUES (7, 'Planet', 0, 0.251, 'P', 2);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (2, 'moon1', 0, 56.407, 2);
INSERT INTO public.moon VALUES (3, 'moon3', 0, 82.219, 2);
INSERT INTO public.moon VALUES (4, 'moon5', 0, 39.373, 2);
INSERT INTO public.moon VALUES (5, 'moon6', 0, 67.782, 2);
INSERT INTO public.moon VALUES (6, 'moon7', 0, 77.620, 2);
INSERT INTO public.moon VALUES (7, 'moon8', 0, 57.086, 2);
INSERT INTO public.moon VALUES (8, 'moon9', 0, 12.458, 2);
INSERT INTO public.moon VALUES (9, 'moon10', 0, 60.882, 2);
INSERT INTO public.moon VALUES (10, 'moon10', 0, 49.707, 2);
INSERT INTO public.moon VALUES (11, 'moon10', 0, 62.248, 2);
INSERT INTO public.moon VALUES (12, 'moon10', 0, 71.778, 2);
INSERT INTO public.moon VALUES (13, 'moon10', 0, 53.242, 2);
INSERT INTO public.moon VALUES (14, 'moon10', 0, 11.694, 2);
INSERT INTO public.moon VALUES (15, 'moon10', 0, 32.907, 2);
INSERT INTO public.moon VALUES (16, 'moon10', 0, 35.101, 2);
INSERT INTO public.moon VALUES (17, 'moon10', 0, 39.514, 2);
INSERT INTO public.moon VALUES (18, 'moon10', 0, 80.118, 2);
INSERT INTO public.moon VALUES (19, 'moon10', 0, 79.450, 2);
INSERT INTO public.moon VALUES (20, 'moon10', 0, 1.494, 2);
INSERT INTO public.moon VALUES (21, 'moon10', 0, 92.659, 2);
INSERT INTO public.moon VALUES (22, 'moon10', 0, 63.284, 2);
INSERT INTO public.moon VALUES (23, 'moon10', 0, 34.723, 2);
INSERT INTO public.moon VALUES (24, 'moon10', 0, 70.349, 2);
INSERT INTO public.moon VALUES (25, 'moon10', 0, 91.997, 2);
INSERT INTO public.moon VALUES (26, 'moon10', 0, 26.310, 2);
INSERT INTO public.moon VALUES (27, 'moon10', 0, 66.735, 2);
INSERT INTO public.moon VALUES (28, 'moon10', 0, 19.662, 2);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (2, 'Earth', 0, 19.000, false, 1);
INSERT INTO public.planet VALUES (3, 'Earth', 0, 72.000, false, 2);
INSERT INTO public.planet VALUES (4, 'Earth', 0, 22.000, false, 3);
INSERT INTO public.planet VALUES (5, 'Moon', 0, 78.000, false, 3);
INSERT INTO public.planet VALUES (6, 'Moon', 0, 88.000, false, 2);
INSERT INTO public.planet VALUES (7, 'Moon', 0, 49.000, false, 1);
INSERT INTO public.planet VALUES (9, 'Mars', 0, 20.000, false, 1);
INSERT INTO public.planet VALUES (10, 'Mars', 0, 10.000, false, 2);
INSERT INTO public.planet VALUES (11, 'Venus', 0, 2.000, false, 2);
INSERT INTO public.planet VALUES (12, 'Venus', 0, 95.000, false, 3);
INSERT INTO public.planet VALUES (13, 'Venus', 0, 17.000, false, 1);
INSERT INTO public.planet VALUES (14, 'Uranus', 0, 32.000, false, 1);
INSERT INTO public.planet VALUES (15, 'Uranus', 0, 6.000, false, 2);
INSERT INTO public.planet VALUES (16, 'Uranus', 0, 53.000, false, 3);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (6, 'Asks', 0, 0.215, true, 2);
INSERT INTO public.star VALUES (4, 'ZorpZorp', 0, 45.215, false, 3);
INSERT INTO public.star VALUES (5, 'BlorpBlorp', 0, 90.215, false, 3);
INSERT INTO public.star VALUES (1, 'Earth', 0, 24.215, false, 3);
INSERT INTO public.star VALUES (2, 'Earth', 0, 10.215, false, 3);
INSERT INTO public.star VALUES (3, 'Mars', 0, 15.215, false, 3);


--
-- Name: description_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.description_id_seq', 3, true);


--
-- Name: galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_id_seq', 7, true);


--
-- Name: moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_id_seq', 28, true);


--
-- Name: planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_id_seq', 16, true);


--
-- Name: star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_id_seq', 6, true);


--
-- Name: galaxy code_uinq; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT code_uinq UNIQUE (code);


--
-- Name: description desc_uniq; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.description
    ADD CONSTRAINT desc_uniq UNIQUE (description);


--
-- Name: description description_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.description
    ADD CONSTRAINT description_pkey PRIMARY KEY (description_id);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: star mass_uinq; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT mass_uinq UNIQUE (mass);


--
-- Name: moon mass_uniq; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT mass_uniq UNIQUE (mass);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: planet uniq_mass; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT uniq_mass UNIQUE (mass);


--
-- Name: galaxy galaxy_description_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_description_id_fkey FOREIGN KEY (description_id) REFERENCES public.description(description_id);


--
-- Name: galaxy galaxy_description_id_fkey1; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_description_id_fkey1 FOREIGN KEY (description_id) REFERENCES public.description(description_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

