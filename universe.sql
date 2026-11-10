--
-- PostgreSQL database dump
--

-- Dumped from database version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)
-- Dumped by pg_dump version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)

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
-- Name: asteroid; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.asteroid (
    asteroid_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text NOT NULL,
    diameter_km real
);


ALTER TABLE public.asteroid OWNER TO freecodecamp;

--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

ALTER TABLE public.asteroid ALTER COLUMN asteroid_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.asteroid_asteroid_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text,
    number_of_stars text,
    type text
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
    name character varying(30) NOT NULL,
    is_spherical boolean,
    description text,
    color text,
    planet_id integer
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
    name character varying(30) NOT NULL,
    is_spherical boolean,
    description text,
    distance_from_earth_light_years numeric(10,10),
    number_of_moons integer,
    year_duration integer,
    star_id integer
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
    is_spherical boolean,
    description text,
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

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_id_seq'::regclass);


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
-- Data for Name: asteroid; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.asteroid OVERRIDING SYSTEM VALUE VALUES (1, 'Vesta', 'One of the largest objects in the asteroid belt.', 525.4);
INSERT INTO public.asteroid OVERRIDING SYSTEM VALUE VALUES (2, 'Pallas', 'One of the largest asteroids in the Solar System.', 512);
INSERT INTO public.asteroid OVERRIDING SYSTEM VALUE VALUES (3, 'Hygiea', 'A large asteroid located in the main asteroid belt.', 434);
INSERT INTO public.asteroid OVERRIDING SYSTEM VALUE VALUES (4, 'Eros', 'A near-Earth asteroid visited by the NEAR Shoemaker spacecraft.', 16.8);
INSERT INTO public.asteroid OVERRIDING SYSTEM VALUE VALUES (5, 'Psyche', 'A large metallic asteroid in the main asteroid belt.', 226);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'The galaxy containing our Solar System.', NULL, NULL);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'The nearest major galaxy to the Milky Way.', NULL, NULL);
INSERT INTO public.galaxy VALUES (3, 'Whirlpool', 'A spiral galaxy with well-defined spiral arms.', NULL, NULL);
INSERT INTO public.galaxy VALUES (4, 'Triangulum', 'A spiral galaxy in the Local Group.', NULL, NULL);
INSERT INTO public.galaxy VALUES (5, 'Sombrero', 'A galaxy known for its bright nucleus and prominent dust lane.', NULL, NULL);
INSERT INTO public.galaxy VALUES (6, 'Messier 87', 'A giant elliptical galaxy containing a supermassive black hole.', NULL, NULL);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', NULL, 'Earth natural satellite and the fifth-largest moon in the Solar System.', NULL, 3);
INSERT INTO public.moon VALUES (2, 'Phobos', NULL, 'The larger and closer of the two moons of Mars.', NULL, 4);
INSERT INTO public.moon VALUES (3, 'Deimos', NULL, 'The smaller and more distant moon of Mars.', NULL, 4);
INSERT INTO public.moon VALUES (4, 'Io', NULL, 'A moon of Jupiter known for its intense volcanic activity.', NULL, 5);
INSERT INTO public.moon VALUES (5, 'Europa', NULL, 'A moon of Jupiter believed to have a subsurface ocean beneath its icy crust.', NULL, 5);
INSERT INTO public.moon VALUES (6, 'Ganymede', NULL, 'The largest moon in the Solar System and a satellite of Jupiter.', NULL, 5);
INSERT INTO public.moon VALUES (7, 'Callisto', NULL, 'A heavily cratered moon of Jupiter with an ancient surface.', NULL, 5);
INSERT INTO public.moon VALUES (8, 'Titan', NULL, 'Saturn largest moon, known for its thick atmosphere and methane lakes.', NULL, 6);
INSERT INTO public.moon VALUES (9, 'Enceladus', NULL, 'A moon of Saturn that releases water vapor and ice from its south pole.', NULL, 6);
INSERT INTO public.moon VALUES (10, 'Mimas', NULL, 'A small moon of Saturn famous for its large Herschel crater.', NULL, 6);
INSERT INTO public.moon VALUES (11, 'Rhea', NULL, 'The second-largest moon of Saturn, composed mainly of ice and rock.', NULL, 6);
INSERT INTO public.moon VALUES (12, 'Iapetus', NULL, 'A moon of Saturn known for its unusual two-toned surface.', NULL, 6);
INSERT INTO public.moon VALUES (13, 'Dione', NULL, 'An icy moon of Saturn with bright ice cliffs and numerous craters.', NULL, 6);
INSERT INTO public.moon VALUES (14, 'Triton', NULL, 'Neptune largest moon, orbiting in the opposite direction of its planet rotation.', NULL, 8);
INSERT INTO public.moon VALUES (15, 'Titania', NULL, 'The largest moon of Uranus, featuring a heavily cratered icy surface.', NULL, 7);
INSERT INTO public.moon VALUES (16, 'Oberon', NULL, 'The second-largest moon of Uranus, covered with impact craters.', NULL, 7);
INSERT INTO public.moon VALUES (17, 'Ariel', NULL, 'A moon of Uranus with a surface marked by valleys and fractures.', NULL, 7);
INSERT INTO public.moon VALUES (18, 'Umbriel', NULL, 'A dark, heavily cratered moon of Uranus.', NULL, 7);
INSERT INTO public.moon VALUES (19, 'Charon', NULL, 'The largest moon of Pluto, nearly half its size.', NULL, 9);
INSERT INTO public.moon VALUES (20, 'Miranda', NULL, 'A small moon of Uranus with an unusually varied and rugged surface.', NULL, 7);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (3, 'Earth', NULL, 'The only known planet to support life.', NULL, NULL, NULL, 1);
INSERT INTO public.planet VALUES (1, 'Mercury', NULL, 'The smallest planet and closest to the Sun.', NULL, NULL, NULL, 1);
INSERT INTO public.planet VALUES (2, 'Venus', NULL, 'The hottest planet, with a thick carbon dioxide atmosphere.', NULL, NULL, NULL, 1);
INSERT INTO public.planet VALUES (4, 'Mars', NULL, 'A rocky planet known as the Red Planet.', NULL, NULL, NULL, 1);
INSERT INTO public.planet VALUES (5, 'Jupiter', NULL, 'The largest planet in the Solar System.', NULL, NULL, NULL, 1);
INSERT INTO public.planet VALUES (6, 'Saturn', NULL, 'A gas giant famous for its prominent ring system.', NULL, NULL, NULL, 1);
INSERT INTO public.planet VALUES (7, 'Uranus', NULL, 'An ice giant that rotates on its side.', NULL, NULL, NULL, 1);
INSERT INTO public.planet VALUES (8, 'Neptune', NULL, 'A distant ice giant with extremely strong winds.', NULL, NULL, NULL, 1);
INSERT INTO public.planet VALUES (9, 'Pluto', NULL, 'A dwarf planet located in the Kuiper Belt.', NULL, NULL, NULL, 1);
INSERT INTO public.planet VALUES (10, 'Ceres', NULL, 'A dwarf planet located in the asteroid belt between Mars and Jupiter.', NULL, NULL, NULL, 1);
INSERT INTO public.planet VALUES (11, 'Haumea', NULL, 'A dwarf planet in the Kuiper Belt known for its elongated shape.', NULL, NULL, NULL, 1);
INSERT INTO public.planet VALUES (12, 'Makemake', NULL, 'A dwarf planet in the Kuiper Belt with a frozen surface.', NULL, NULL, NULL, 1);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', NULL, 'The star at the center of our Solar System.', 1);
INSERT INTO public.star VALUES (2, 'Sirius', NULL, 'The brightest star in Earth''s night sky.', 1);
INSERT INTO public.star VALUES (3, 'Betelgeuse', NULL, 'A red supergiant in the constellation Orion.', 1);
INSERT INTO public.star VALUES (4, 'Vega', NULL, 'A bright star in the constellation Lyra.', 1);
INSERT INTO public.star VALUES (5, 'Polaris', NULL, 'The North Star, located near the north celestial pole.', 1);
INSERT INTO public.star VALUES (6, 'Proxima Centauri', NULL, 'The closest known star to the Sun.', 1);


--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.asteroid_asteroid_id_seq', 5, true);


--
-- Name: galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: asteroid asteroid_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_name_key UNIQUE (name);


--
-- Name: asteroid asteroid_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_pkey PRIMARY KEY (asteroid_id);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


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
-- Name: galaxy unique_galaxy_description; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT unique_galaxy_description UNIQUE (description);


--
-- Name: moon unique_moon_description; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT unique_moon_description UNIQUE (description);


--
-- Name: planet unique_planet_description; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT unique_planet_description UNIQUE (description);


--
-- Name: star unique_star_description; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT unique_star_description UNIQUE (description);


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

