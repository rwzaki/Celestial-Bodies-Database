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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    age_in_millions_of_years integer,
    distance_from_earth numeric(5,2),
    description text NOT NULL,
    is_spherical boolean
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30) NOT NULL,
    age_in_millions_of_years integer,
    distance_from_earth numeric,
    description text NOT NULL,
    is_spherical boolean
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: moon_planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon_planet (
    planet_id integer NOT NULL,
    moon_id integer NOT NULL,
    moon_planet_id integer NOT NULL,
    name character varying(40)
);


ALTER TABLE public.moon_planet OWNER TO freecodecamp;

--
-- Name: moon_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_planet_id_seq OWNER TO freecodecamp;

--
-- Name: moon_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_planet_id_seq OWNED BY public.moon_planet.moon_planet_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(30) NOT NULL,
    age_in_millions_of_years integer,
    distance_from_earth numeric,
    description text NOT NULL,
    is_spherical boolean,
    star_id integer NOT NULL
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    age_in_millions_of_years integer,
    distance_from_earth numeric,
    description text NOT NULL,
    is_spherical boolean,
    galaxy_id integer NOT NULL
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: moon_planet moon_planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon_planet ALTER COLUMN moon_planet_id SET DEFAULT nextval('public.moon_planet_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Andromeda Galaxy', 1000, 2.36, 'A spiral galaxy', false);
INSERT INTO public.galaxy VALUES (2, 'Virgo Cluster', 6000, 65.23, 'A larger cluster of galaxies', false);
INSERT INTO public.galaxy VALUES (3, 'Canis Major Dwarf', 14000, 0.03, 'A small, irregular galaxy', false);
INSERT INTO public.galaxy VALUES (4, 'Cygnus A', 7, 600.00, 'An elliptical galaxy with billions of stars in its feartureless oval', false);
INSERT INTO public.galaxy VALUES (5, 'Magellanic Clouds', 13, 0.16, 'An irregular galaxies that share a gaseous envelope', false);
INSERT INTO public.galaxy VALUES (6, 'Milky Way', 13000, 0.03, 'A barred spiral galaxy', false);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (13, 'Saturn', 4500, 1.554, 'A massive ball made mostly of hydrogen and helluim', false);
INSERT INTO public.moon VALUES (14, 'Dummy planet 2', 60, 96.87, 'The brightest star in the andromeda galaxy', false);
INSERT INTO public.moon VALUES (15, 'Dummy planet 3', 22, 430.5, 'A binary star', false);
INSERT INTO public.moon VALUES (16, 'Dummy plane 4', 4, 433.8, 'A single bright star to the naked eye', false);
INSERT INTO public.moon VALUES (17, 'Dummy planet 5', 1, 163000, 'The heaviest star', false);
INSERT INTO public.moon VALUES (18, 'Dummy Planet 6', 5000, 4.246, 'Super earth exoplanet that orbits m-shaped star', false);
INSERT INTO public.moon VALUES (19, 'Dummy planet 7', 30, 233.4, 'It is just a planet', true);
INSERT INTO public.moon VALUES (20, 'Dummy planet 8', 40, 76.8, 'Blah blah', false);
INSERT INTO public.moon VALUES (21, 'dummy planet 9', 20, 4793, 'blah blah blah', false);
INSERT INTO public.moon VALUES (22, 'Dummy planet 10', 10, 3874, 'The tenth', true);
INSERT INTO public.moon VALUES (23, 'Dummy planet 11', 53, 92, 'The eleventh', false);
INSERT INTO public.moon VALUES (24, 'Dummy planet 12', 45, 344, 'Finally', true);
INSERT INTO public.moon VALUES (25, 'Saturn', 4500, 1.554, 'A massive ball made mostly of hydrogen and helluim', false);
INSERT INTO public.moon VALUES (26, 'Dummy planet 2', 60, 96.87, 'The brightest star in the andromeda galaxy', false);
INSERT INTO public.moon VALUES (27, 'Dummy planet 3', 22, 430.5, 'A binary star', false);
INSERT INTO public.moon VALUES (28, 'Dummy plane 4', 4, 433.8, 'A single bright star to the naked eye', false);
INSERT INTO public.moon VALUES (29, 'Dummy planet 5', 1, 163000, 'The heaviest star', false);
INSERT INTO public.moon VALUES (30, 'Dummy Planet 6', 5000, 4.246, 'Super earth exoplanet that orbits m-shaped star', false);
INSERT INTO public.moon VALUES (31, 'Dummy planet 7', 30, 233.4, 'It is just a planet', true);
INSERT INTO public.moon VALUES (32, 'Dummy planet 8', 40, 76.8, 'Blah blah', false);
INSERT INTO public.moon VALUES (33, 'dummy planet 9', 20, 4793, 'blah blah blah', false);
INSERT INTO public.moon VALUES (34, 'Dummy planet 10', 10, 3874, 'The tenth', true);
INSERT INTO public.moon VALUES (35, 'Dummy planet 11', 53, 92, 'The eleventh', false);
INSERT INTO public.moon VALUES (36, 'Dummy planet 12', 45, 344, 'Finally', true);


--
-- Data for Name: moon_planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon_planet VALUES (9, 21, 1, NULL);
INSERT INTO public.moon_planet VALUES (11, 23, 2, NULL);
INSERT INTO public.moon_planet VALUES (18, 25, 3, NULL);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (8, 'Saturn', 4500, 1.554, 'A massive ball made mostly of hydrogen and helluim', false, 1);
INSERT INTO public.planet VALUES (9, 'Dummy planet 2', 60, 96.87, 'The brightest star in the andromeda galaxy', false, 2);
INSERT INTO public.planet VALUES (10, 'Dummy planet 3', 22, 430.5, 'A binary star', false, 3);
INSERT INTO public.planet VALUES (11, 'Dummy plane 4', 4, 433.8, 'A single bright star to the naked eye', false, 4);
INSERT INTO public.planet VALUES (12, 'Dummy planet 5', 1, 163000, 'The heaviest star', false, 5);
INSERT INTO public.planet VALUES (13, 'Dummy Planet 6', 5000, 4.246, 'Super earth exoplanet that orbits m-shaped star', false, 6);
INSERT INTO public.planet VALUES (14, 'Dummy planet 7', 30, 233.4, 'It is just a planet', true, 1);
INSERT INTO public.planet VALUES (15, 'Dummy planet 8', 40, 76.8, 'Blah blah', false, 2);
INSERT INTO public.planet VALUES (16, 'dummy planet 9', 20, 4793, 'blah blah blah', false, 3);
INSERT INTO public.planet VALUES (17, 'Dummy planet 10', 10, 3874, 'The tenth', true, 4);
INSERT INTO public.planet VALUES (18, 'Dummy planet 11', 53, 92, 'The eleventh', false, 5);
INSERT INTO public.planet VALUES (19, 'Dummy planet 12', 45, 344, 'Finally', true, 6);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'spica', 13000, 0.00002609, 'A blue-white spectroscopic binary star', false, 2);
INSERT INTO public.star VALUES (2, 'Alpheratz', 60, 96.87, 'The brightest star in the andromeda galaxy', false, 1);
INSERT INTO public.star VALUES (3, 'Adhara', 22, 430.5, 'A binary star', false, 3);
INSERT INTO public.star VALUES (4, 'Albireo', 4, 433.8, 'A single bright star to the naked eye', false, 4);
INSERT INTO public.star VALUES (5, 'R136a1', 1, 163000, 'The heaviest star', false, 5);
INSERT INTO public.star VALUES (6, 'Proxima Centauri', 5000, 4.246, 'Super earth exoplanet that orbits m-shaped star', false, 6);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 36, true);


--
-- Name: moon_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_planet_id_seq', 3, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 19, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: galaxy galaxy_id_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_id_unique UNIQUE (galaxy_id);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon_planet m_p_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon_planet
    ADD CONSTRAINT m_p_id PRIMARY KEY (moon_planet_id);


--
-- Name: moon moon_id_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_id_unique UNIQUE (moon_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: moon_planet moon_planet_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon_planet
    ADD CONSTRAINT moon_planet_id_key UNIQUE (moon_planet_id);


--
-- Name: planet planet_id_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_id_unique UNIQUE (planet_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_galaxy_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_key UNIQUE (galaxy_id);


--
-- Name: star star_id_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_id_unique UNIQUE (star_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: moon_planet moon_planet_moon_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon_planet
    ADD CONSTRAINT moon_planet_moon_id_fkey FOREIGN KEY (moon_id) REFERENCES public.moon(moon_id);


--
-- Name: moon_planet moon_planet_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon_planet
    ADD CONSTRAINT moon_planet_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


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

