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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(100) NOT NULL,
    galaxy_type character varying(50) NOT NULL,
    age_in_millions_of_years integer,
    distance_from_earth numeric,
    is_spherical boolean NOT NULL
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
    name character varying(100) NOT NULL,
    planet_id integer NOT NULL,
    moon_type character varying(50) NOT NULL,
    diameter integer,
    has_atmosphere boolean NOT NULL
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
    name character varying(100) NOT NULL,
    star_id integer NOT NULL,
    planet_type character varying(50) NOT NULL,
    age_in_millions_of_years integer,
    has_life boolean NOT NULL,
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
-- Name: planet_types; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet_types (
    planet_types_id integer NOT NULL,
    name character varying(100) NOT NULL,
    description text NOT NULL,
    is_habitable boolean NOT NULL
);


ALTER TABLE public.planet_types OWNER TO freecodecamp;

--
-- Name: planet_types_planet_type_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_types_planet_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_types_planet_type_id_seq OWNER TO freecodecamp;

--
-- Name: planet_types_planet_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_types_planet_type_id_seq OWNED BY public.planet_types.planet_types_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(100) NOT NULL,
    galaxy_id integer NOT NULL,
    star_type character varying(50) NOT NULL,
    temperature integer,
    is_spherical boolean NOT NULL
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
-- Name: planet_types planet_types_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_types ALTER COLUMN planet_types_id SET DEFAULT nextval('public.planet_types_planet_type_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Spiral', 13600, 0, false);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Spiral', 10000, 2537000, false);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'Spiral', 13000, 2730000, false);
INSERT INTO public.galaxy VALUES (4, 'Whirlpool', 'Spiral', 8000, 23000000, false);
INSERT INTO public.galaxy VALUES (5, 'Sombrero', 'Spiral', 13000, 29000000, true);
INSERT INTO public.galaxy VALUES (6, 'Cartwheel', 'Ring', 3000, 500000000, true);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 3, 'Natural Satellite', 3475, false);
INSERT INTO public.moon VALUES (2, 'Phobos', 4, 'Natural Satellite', 22, false);
INSERT INTO public.moon VALUES (3, 'Deimos', 4, 'Natural Satellite', 12, false);
INSERT INTO public.moon VALUES (4, 'Io', 5, 'Volcanic Moon', 3643, false);
INSERT INTO public.moon VALUES (5, 'Europa', 5, 'Ice Moon', 3122, false);
INSERT INTO public.moon VALUES (6, 'Ganymede', 5, 'Ice Moon', 5268, false);
INSERT INTO public.moon VALUES (7, 'Callisto', 5, 'Ice Moon', 4821, false);
INSERT INTO public.moon VALUES (8, 'Titan', 6, 'Ice Moon', 5150, true);
INSERT INTO public.moon VALUES (9, 'Rhea', 6, 'Ice Moon', 1527, false);
INSERT INTO public.moon VALUES (10, 'Iapetus', 6, 'Ice Moon', 1469, false);
INSERT INTO public.moon VALUES (11, 'Dione', 6, 'Ice Moon', 1123, false);
INSERT INTO public.moon VALUES (12, 'Tethys', 6, 'Ice Moon', 1062, false);
INSERT INTO public.moon VALUES (13, 'Enceladus', 6, 'Ice Moon', 504, false);
INSERT INTO public.moon VALUES (14, 'Mimas', 6, 'Ice Moon', 396, false);
INSERT INTO public.moon VALUES (15, 'Hyperion', 6, 'Irregular Moon', 270, false);
INSERT INTO public.moon VALUES (16, 'Titania', 7, 'Ice Moon', 1578, false);
INSERT INTO public.moon VALUES (17, 'Oberon', 7, 'Ice Moon', 1523, false);
INSERT INTO public.moon VALUES (18, 'Ariel', 7, 'Ice Moon', 1158, false);
INSERT INTO public.moon VALUES (19, 'Umbriel', 7, 'Ice Moon', 1169, false);
INSERT INTO public.moon VALUES (20, 'Miranda', 7, 'Ice Moon', 472, false);
INSERT INTO public.moon VALUES (21, 'Triton', 8, 'Ice Moon', 2706, true);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 1, 'Terrestrial', 4500, false, 'The smallest planet in the Solar System.');
INSERT INTO public.planet VALUES (2, 'Venus', 1, 'Terrestrial', 4500, false, 'A hot planet with a thick atmosphere.');
INSERT INTO public.planet VALUES (3, 'Earth', 1, 'Terrestrial', 4540, true, 'The only known planet with life.');
INSERT INTO public.planet VALUES (4, 'Mars', 1, 'Terrestrial', 4500, false, 'A cold desert world with polar ice caps.');
INSERT INTO public.planet VALUES (5, 'Jupiter', 1, 'Gas Giant', 4600, false, 'The largest planet in the Solar System.');
INSERT INTO public.planet VALUES (6, 'Saturn', 1, 'Gas Giant', 4600, false, 'A gas giant famous for its rings.');
INSERT INTO public.planet VALUES (7, 'Uranus', 1, 'Ice Giant', 4500, false, 'An ice giant rotating on its side.');
INSERT INTO public.planet VALUES (8, 'Neptune', 1, 'Ice Giant', 4500, false, 'A distant blue ice giant.');
INSERT INTO public.planet VALUES (9, 'Sirius Prime', 2, 'Terrestrial', 1000, false, 'A fictional planet orbiting Sirius.');
INSERT INTO public.planet VALUES (10, 'Sirius II', 2, 'Gas Giant', 2000, false, 'A fictional gas giant orbiting Sirius.');
INSERT INTO public.planet VALUES (11, 'Centauri b', 4, 'Terrestrial', 5000, false, 'A planet orbiting Proxima Centauri.');
INSERT INTO public.planet VALUES (12, 'Centauri c', 4, 'Super Earth', 5000, false, 'A distant planet around Proxima Centauri.');
INSERT INTO public.planet VALUES (13, 'Vega I', 6, 'Terrestrial', 3000, false, 'A fictional planet orbiting Vega.');


--
-- Data for Name: planet_types; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet_types VALUES (1, 'Terrestrial', 'A rocky planet with a solid surface.', true);
INSERT INTO public.planet_types VALUES (2, 'Gas Giant', 'A large planet composed primarily of hydrogen and helium.', false);
INSERT INTO public.planet_types VALUES (3, 'Ice Giant', 'A giant planet containing substantial water, methane, and ammonia ices.', false);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 'Yellow Dwarf', 5778, true);
INSERT INTO public.star VALUES (2, 'Sirius', 1, 'White Main Sequence', 9940, true);
INSERT INTO public.star VALUES (3, 'Betelgeuse', 1, 'Red Supergiant', 3500, true);
INSERT INTO public.star VALUES (4, 'Proxima Centauri', 1, 'Red Dwarf', 3042, true);
INSERT INTO public.star VALUES (5, 'Alpha Centauri A', 1, 'Yellow Dwarf', 5790, true);
INSERT INTO public.star VALUES (6, 'Vega', 1, 'White Main Sequence', 9602, true);
INSERT INTO public.star VALUES (7, 'Andromeda Star A', 2, 'Blue Giant', 15000, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 21, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 13, true);


--
-- Name: planet_types_planet_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_types_planet_type_id_seq', 3, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 7, true);


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
-- Name: planet_types planet_types_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_types
    ADD CONSTRAINT planet_types_name_key UNIQUE (name);


--
-- Name: planet_types planet_types_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_types
    ADD CONSTRAINT planet_types_pkey PRIMARY KEY (planet_types_id);


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

