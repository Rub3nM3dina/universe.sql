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
-- Name: constellation; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.constellation (
    constellation_id integer NOT NULL,
    galaxy_id integer NOT NULL,
    name character varying(20) NOT NULL,
    description text
);


ALTER TABLE public.constellation OWNER TO freecodecamp;

--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.constellation_constellation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.constellation_constellation_id_seq OWNER TO freecodecamp;

--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.constellation_constellation_id_seq OWNED BY public.constellation.constellation_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(20) NOT NULL,
    galaxy_aliases character varying(20),
    galaxy_diameter_in_light_years integer,
    has_black_hole boolean
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
    galaxy_id integer NOT NULL,
    planet_id integer NOT NULL,
    name character varying(20),
    discovery_year integer
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
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    galaxy_id integer NOT NULL,
    star_id integer NOT NULL,
    name character varying(15) NOT NULL,
    orbit_period_in_days numeric(7,2),
    is_real boolean
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
    galaxy_id integer NOT NULL,
    name character varying(20) NOT NULL,
    star_age_in_million_years integer NOT NULL,
    surface_temperature integer
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
-- Name: constellation constellation_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation ALTER COLUMN constellation_id SET DEFAULT nextval('public.constellation_constellation_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: constellation; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.constellation VALUES (1, 1, 'Andromeda', 'Named after princess from Greek myth');
INSERT INTO public.constellation VALUES (2, 1, 'Cassiopeia', 'Named after queen Greek myth');
INSERT INTO public.constellation VALUES (3, 1, 'Triangulum', 'Triangle-shaped grouping of stars');
INSERT INTO public.constellation VALUES (4, 2, 'Sagittarius', 'Zodiac constellation near the Milky Way center');
INSERT INTO public.constellation VALUES (6, 4, 'Kronos Cluster', 'Fictional constellation near Kronos planet');
INSERT INTO public.constellation VALUES (5, 2, 'Canis Major', 'Contains the bright star Sirius');
INSERT INTO public.constellation VALUES (7, 5, 'Coruscant Suns', 'Fictional constellation visible from city planet');


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Andromeda', 'Messier 31', 220000, true);
INSERT INTO public.galaxy VALUES (2, 'Milky Way', NULL, 200000, true);
INSERT INTO public.galaxy VALUES (3, 'Messier 83', 'Southern Pinwheel', 100000, true);
INSERT INTO public.galaxy VALUES (4, 'Klingdon Empire', NULL, NULL, false);
INSERT INTO public.galaxy VALUES (5, 'Galactic Empire', NULL, NULL, false);
INSERT INTO public.galaxy VALUES (6, 'Mass Effect', NULL, NULL, false);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 2, 3, 'The Moon', NULL);
INSERT INTO public.moon VALUES (19, 4, 9, 'QoDaq', NULL);
INSERT INTO public.moon VALUES (20, 4, 9, 'Kronos Minor', NULL);
INSERT INTO public.moon VALUES (21, 4, 10, 'Praxis Moon 1', NULL);
INSERT INTO public.moon VALUES (22, 4, 10, 'Praxis Moon 2', NULL);
INSERT INTO public.moon VALUES (23, 5, 11, 'Corusca Moon', NULL);
INSERT INTO public.moon VALUES (24, 5, 12, 'Delaya', NULL);
INSERT INTO public.moon VALUES (25, 6, 14, 'Sereon', NULL);
INSERT INTO public.moon VALUES (26, 6, 14, 'Esylium', NULL);
INSERT INTO public.moon VALUES (27, 6, 15, 'Jatak', NULL);
INSERT INTO public.moon VALUES (2, 2, 4, 'Phobos', 1877);
INSERT INTO public.moon VALUES (3, 2, 4, 'Deimos', 1877);
INSERT INTO public.moon VALUES (4, 2, 5, 'Io', 1610);
INSERT INTO public.moon VALUES (5, 2, 5, 'Europa', 1610);
INSERT INTO public.moon VALUES (6, 2, 5, 'Ganymede', 1610);
INSERT INTO public.moon VALUES (7, 2, 5, 'Callisto', 1610);
INSERT INTO public.moon VALUES (8, 2, 6, 'Titan', 1655);
INSERT INTO public.moon VALUES (9, 2, 6, 'Enceladus', 1789);
INSERT INTO public.moon VALUES (10, 2, 6, 'Mimas', 1789);
INSERT INTO public.moon VALUES (11, 2, 6, 'Rhea', 1672);
INSERT INTO public.moon VALUES (12, 2, 7, 'Miranda', 1948);
INSERT INTO public.moon VALUES (13, 2, 7, 'Ariel', 1851);
INSERT INTO public.moon VALUES (14, 2, 7, 'Umbriel', 1851);
INSERT INTO public.moon VALUES (15, 2, 7, 'Titania', 1787);
INSERT INTO public.moon VALUES (16, 2, 7, 'Oberon', 1787);
INSERT INTO public.moon VALUES (17, 2, 8, 'Triton', 1846);
INSERT INTO public.moon VALUES (18, 2, 8, 'Nereid', 1949);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 2, 8, 'Mercury', 87.97, true);
INSERT INTO public.planet VALUES (2, 2, 8, 'Venus', 224.70, true);
INSERT INTO public.planet VALUES (3, 2, 8, 'Earth', 365.25, true);
INSERT INTO public.planet VALUES (4, 2, 8, 'Mars', 686.98, true);
INSERT INTO public.planet VALUES (5, 2, 8, 'Jupiter', 4333.00, true);
INSERT INTO public.planet VALUES (6, 2, 8, 'Saturn', 10759.00, true);
INSERT INTO public.planet VALUES (7, 2, 8, 'Uranus', 30633.00, true);
INSERT INTO public.planet VALUES (8, 2, 8, 'Neptune', 60182.00, true);
INSERT INTO public.planet VALUES (9, 4, 11, 'Kronos', NULL, false);
INSERT INTO public.planet VALUES (10, 4, 12, 'Praxis', NULL, false);
INSERT INTO public.planet VALUES (11, 5, 13, 'Coruscant', 368.00, false);
INSERT INTO public.planet VALUES (12, 5, 14, 'Alderaan', 364.00, false);
INSERT INTO public.planet VALUES (13, 6, 15, 'Citadel', NULL, false);
INSERT INTO public.planet VALUES (14, 6, 16, 'Illium', 254.00, false);
INSERT INTO public.planet VALUES (15, 6, 17, 'Tuchanka', 482.00, false);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 1, 'Alpheratz', 100, 13000);
INSERT INTO public.star VALUES (2, 1, 'Mirach', 200, 12000);
INSERT INTO public.star VALUES (3, 1, 'Almach', 90, 22000);
INSERT INTO public.star VALUES (4, 1, 'Delta Andromedae', 1100, 15000);
INSERT INTO public.star VALUES (5, 2, 'UY Scuti', 10, 5000);
INSERT INTO public.star VALUES (6, 2, 'VY Canis Majoris', 17, 3490);
INSERT INTO public.star VALUES (7, 2, 'RW Cephei', 4, 3500);
INSERT INTO public.star VALUES (8, 2, 'The Sun', 4600, 5778);
INSERT INTO public.star VALUES (9, 3, 'Alkaid', 300, 10000);
INSERT INTO public.star VALUES (10, 3, 'Mizar', 450, 10200);
INSERT INTO public.star VALUES (11, 4, 'Kronos Prime', 5000, 5200);
INSERT INTO public.star VALUES (12, 4, 'Praxis Prime', 1500, 6300);
INSERT INTO public.star VALUES (13, 5, 'Coruscant Prime', 6000, 5500);
INSERT INTO public.star VALUES (14, 5, 'Alderaan Star', 3500, 5800);
INSERT INTO public.star VALUES (15, 6, 'Widow', 100, 7900);
INSERT INTO public.star VALUES (16, 6, 'Tasale', 400, 8100);
INSERT INTO public.star VALUES (17, 6, 'Aralakh', 7000, 4800);


--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.constellation_constellation_id_seq', 7, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 27, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 15, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 17, true);


--
-- Name: constellation constellation_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_name_key UNIQUE (name);


--
-- Name: constellation constellation_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_pkey PRIMARY KEY (constellation_id);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: constellation constellation_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: moon moon_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


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

