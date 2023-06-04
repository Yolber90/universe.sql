--
-- PostgreSQL database dump
--

-- Dumped from database version 12.15 (Ubuntu 12.15-0ubuntu0.20.04.1)
-- Dumped by pg_dump version 12.15 (Ubuntu 12.15-0ubuntu0.20.04.1)

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
    size_in_ly numeric,
    galaxy_type character varying(30),
    has_blackhole boolean,
    numb_of_black_holes integer,
    no_of_stars integer
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
    planet_id integer NOT NULL,
    name character varying(30),
    active_volcanoes boolean,
    tidally_locked boolean
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
    star_id integer,
    name character varying(30) NOT NULL,
    planet_type character varying(30),
    has_atmosphere boolean,
    has_life boolean,
    description text
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
-- Name: satellites; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.satellites (
    satellites_id integer NOT NULL,
    planet_id integer,
    name character varying(30) NOT NULL
);


ALTER TABLE public.satellites OWNER TO freecodecamp;

--
-- Name: satellites_satellite_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.satellites_satellite_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.satellites_satellite_id_seq OWNER TO freecodecamp;

--
-- Name: satellites_satellite_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.satellites_satellite_id_seq OWNED BY public.satellites.satellites_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    galaxy_id integer,
    name character varying(30) NOT NULL,
    star_type character varying(30),
    star_diameter numeric
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
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: satellites satellites_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.satellites ALTER COLUMN satellites_id SET DEFAULT nextval('public.satellites_satellite_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 100000, 'Spiral', true, NULL, NULL);
INSERT INTO public.galaxy VALUES (2, 'Blue Gravita', 90000, 'Elliptical', false, NULL, NULL);
INSERT INTO public.galaxy VALUES (3, 'Mast Stratrious', 350000, 'Elliptical', true, NULL, NULL);
INSERT INTO public.galaxy VALUES (4, 'Andromedra', 120000, 'Peculiar', true, NULL, NULL);
INSERT INTO public.galaxy VALUES (5, 'Kai Nebula', 75000, 'Elliptical', false, NULL, NULL);
INSERT INTO public.galaxy VALUES (6, 'Chich Star System', 100000, 'Spiral', true, NULL, NULL);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 3, 'Luna', false, true);
INSERT INTO public.moon VALUES (2, 4, 'Phobos', true, true);
INSERT INTO public.moon VALUES (3, 4, 'Deimos', true, true);
INSERT INTO public.moon VALUES (4, 5, 'Europa', true, false);
INSERT INTO public.moon VALUES (5, 5, 'Callisto', false, false);
INSERT INTO public.moon VALUES (6, 5, 'Io', false, true);
INSERT INTO public.moon VALUES (7, 6, 'Rompus 1', false, false);
INSERT INTO public.moon VALUES (8, 6, 'Rompus 2', false, false);
INSERT INTO public.moon VALUES (9, 7, 'Cochar', true, true);
INSERT INTO public.moon VALUES (10, 8, 'Barkley', true, false);
INSERT INTO public.moon VALUES (11, 8, 'Harper 1H', true, false);
INSERT INTO public.moon VALUES (12, 8, 'Harper 2H', true, false);
INSERT INTO public.moon VALUES (13, 11, 'Pluto', true, false);
INSERT INTO public.moon VALUES (14, 11, 'Lasciva 1', false, false);
INSERT INTO public.moon VALUES (15, 11, 'Lasciva 2', false, true);
INSERT INTO public.moon VALUES (16, 12, 'Green Ball', true, false);
INSERT INTO public.moon VALUES (17, 12, 'Yellow Ball', true, false);
INSERT INTO public.moon VALUES (18, 12, 'Blue Ball', true, false);
INSERT INTO public.moon VALUES (19, 12, 'Purple Ball', true, false);
INSERT INTO public.moon VALUES (20, 13, 'Walking One', false, false);
INSERT INTO public.moon VALUES (21, 14, 'Bright One', true, false);
INSERT INTO public.moon VALUES (22, 14, 'Splendour 1', true, false);
INSERT INTO public.moon VALUES (23, 14, 'Splendour 2', true, false);
INSERT INTO public.moon VALUES (24, 15, 'Mun', true, false);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (3, 1, 'Venus', 'terrestrial', true, false, 'very close to the sun');
INSERT INTO public.planet VALUES (4, 1, 'Mercury', 'terrestrial', true, false, 'close to the sun and toxic atmopshere');
INSERT INTO public.planet VALUES (5, 1, 'Earth', 'terrestrial', true, true, 'planet in goldilocks zone only in this galaxy containing life');
INSERT INTO public.planet VALUES (6, 1, 'Mars', 'terrestrial', true, false, 'potential for life');
INSERT INTO public.planet VALUES (7, 1, 'Jupiter', 'gas giant', true, false, 'largest planet on this solar system');
INSERT INTO public.planet VALUES (8, 2, 'Titus', 'terrestrial', false, false, 'no atmopshere and high radiation');
INSERT INTO public.planet VALUES (9, 3, 'Nereid', 'terrestrial', true, false, 'super large terrestrial planet');
INSERT INTO public.planet VALUES (10, 3, 'Doris', 'gas giant', true, false, 'super large gas giant about five jupiters in size');
INSERT INTO public.planet VALUES (11, 4, 'Kepler', 'terrestrial', true, true, 'earth like, very high chances of life');
INSERT INTO public.planet VALUES (12, 4, 'Twin Quasar', 'neptune-like', true, false, 'similar to Neptunre on the Suns solar system');
INSERT INTO public.planet VALUES (13, 5, 'Canis', 'terrestrial', true, true, 'earthlike, has high chances of life');
INSERT INTO public.planet VALUES (14, 5, 'Latrare', 'terrestrial', true, true, 'earthlike, has high chances of lie');
INSERT INTO public.planet VALUES (15, 6, 'Whiteous', 'terrestrial', false, false, 'large terrestrial planet without an atmosphere');
INSERT INTO public.planet VALUES (16, 7, 'Bellus', 'terrestrial', true, true, 'earthlike beautiful planet, very high potential for life');
INSERT INTO public.planet VALUES (17, 8, 'Caeruleum', 'gas giant', true, false, 'large gas giant with five rings');


--
-- Data for Name: satellites; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.satellites VALUES (1, 5, 'Hubble');
INSERT INTO public.satellites VALUES (2, 5, 'Sputnik');
INSERT INTO public.satellites VALUES (3, 5, 'ISS');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 1, 'Sun', 'Yellow Dwarf', 860000);
INSERT INTO public.star VALUES (2, 2, 'Caeruleum', 'White Dwarf', 80000);
INSERT INTO public.star VALUES (3, 3, 'Pegasus', 'Super Giant', 3850000);
INSERT INTO public.star VALUES (4, 4, 'Pollux', 'Red Dwarf', 720000);
INSERT INTO public.star VALUES (5, 5, 'Dog Star', 'Proto Star', 420000);
INSERT INTO public.star VALUES (6, 5, 'Castor', 'Proto Star', 390000);
INSERT INTO public.star VALUES (7, 6, 'Sirius', 'Binary Star', 850000);
INSERT INTO public.star VALUES (8, 6, 'Antares', 'Neutron Star', 830000);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 24, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 17, true);


--
-- Name: satellites_satellite_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.satellites_satellite_id_seq', 3, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 8, true);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_unq; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_unq UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: galaxy name_unq; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT name_unq UNIQUE (name);


--
-- Name: planet planet_name_unq; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_unq UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: satellites satellites_name_unq; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.satellites
    ADD CONSTRAINT satellites_name_unq UNIQUE (name);


--
-- Name: satellites satellites_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.satellites
    ADD CONSTRAINT satellites_pkey PRIMARY KEY (satellites_id);


--
-- Name: star star_name_unq; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_unq UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


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

