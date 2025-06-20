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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    story text,
    is_published boolean,
    is_featured boolean,
    shape text
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
-- Name: live; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.live (
    live_id integer NOT NULL,
    travel_country character varying(20) NOT NULL,
    name character varying(20),
    moon_id integer,
    planet_id integer,
    star_id integer,
    galaxy_id integer,
    year integer
);


ALTER TABLE public.live OWNER TO freecodecamp;

--
-- Name: live_live_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.live_live_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.live_live_id_seq OWNER TO freecodecamp;

--
-- Name: live_live_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.live_live_id_seq OWNED BY public.live.live_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30) NOT NULL,
    distance numeric(6,1),
    planet_id integer NOT NULL,
    shape text
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
    age integer,
    star_id integer NOT NULL,
    shape text
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
    age integer,
    galaxy_id integer NOT NULL,
    shape text
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
-- Name: live live_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.live ALTER COLUMN live_id SET DEFAULT nextval('public.live_live_id_seq'::regclass);


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
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Our home galaxy, appearing as a bright band from Earth, with its center in the direction of Sagittarius. It contains hundreds of billions of stars, numerous nebulae, and interstellar matter, featuring a spiral arm structure. The Solar System lies on one of its spiral arms.', true, true, NULL);
INSERT INTO public.galaxy VALUES (2, 'Andromeda Galaxy', 'The closest large galaxy to the Milky Way, located in the Andromeda constellation. As a spiral galaxy with a diameter of about 220,000 light-years (slightly larger than the Milky Way), it is expected to collide with the Milky Way in about 4 billion years, eventually merging into a new galaxy called "Milkomeda."', true, false, NULL);
INSERT INTO public.galaxy VALUES (3, 'Large Magellanic Cloud', 'Named after Ferdinand Magellan, it is the fourth-largest galaxy in the Local Group, located near Dorado and Mensa. Visible only in the Southern Hemisphere, it is a satellite galaxy of the Milky Way and forms a pair with the Small Magellanic Cloud.', true, false, NULL);
INSERT INTO public.galaxy VALUES (4, 'Small Magellanic Cloud', 'Also named after Magellan, it lies in Tucana and is another satellite galaxy of the Milky Way. It interacts with the LMC, with a stream of matter exchanging between them.', true, false, NULL);
INSERT INTO public.galaxy VALUES (5, 'Triangulum Galaxy', 'A spiral galaxy in Triangulum, about 2.9 million light-years from Earth. As a member of the Local Group, its visibility is significantly affected by light pollution, making it easier to observe in extremely dark skies.', true, false, NULL);
INSERT INTO public.galaxy VALUES (6, 'Black Eye Galaxy', 'Also known as the Evil Eye Galaxy, located in Coma Berenices. It features a striking dark dust lane across its bright core, resembling an eye. This spiral galaxy has a unique appearance.', true, false, NULL);


--
-- Data for Name: live; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.live VALUES (1, 'China', 'Change series', 1, 3, 1, 1, 2007);
INSERT INTO public.live VALUES (2, 'America', 'Apollo 11', 1, 3, 1, 1, 1969);
INSERT INTO public.live VALUES (3, 'China', 'Tianwen-1', NULL, 4, 1, 1, 2021);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'moon', 384.4, 3, NULL);
INSERT INTO public.moon VALUES (2, 'Phobos', 9.3, 4, NULL);
INSERT INTO public.moon VALUES (3, 'Deimos', 23.5, 4, NULL);
INSERT INTO public.moon VALUES (4, 'Io', 421.6, 5, NULL);
INSERT INTO public.moon VALUES (5, 'Europa', 671.1, 5, NULL);
INSERT INTO public.moon VALUES (6, 'Ganymede', 1070.4, 5, NULL);
INSERT INTO public.moon VALUES (7, 'Callisto', 1882.7, 5, NULL);
INSERT INTO public.moon VALUES (8, 'Amalthea', 181.4, 5, NULL);
INSERT INTO public.moon VALUES (9, 'Titan', 1221.9, 6, NULL);
INSERT INTO public.moon VALUES (10, 'Enceladus', 238.0, 6, NULL);
INSERT INTO public.moon VALUES (11, 'Tethys', 294.7, 6, NULL);
INSERT INTO public.moon VALUES (12, 'Dione', 377.4, 6, NULL);
INSERT INTO public.moon VALUES (13, 'Rhea', 527.0, 6, NULL);
INSERT INTO public.moon VALUES (14, 'Mimas', 185.5, 6, NULL);
INSERT INTO public.moon VALUES (15, 'Iapetus', 3561.3, 6, NULL);
INSERT INTO public.moon VALUES (16, 'Titania', 435.8, 7, NULL);
INSERT INTO public.moon VALUES (17, 'Oberon', 583.5, 7, NULL);
INSERT INTO public.moon VALUES (18, 'Umbriel', 266.0, 7, NULL);
INSERT INTO public.moon VALUES (19, 'Ariel', 190.9, 7, NULL);
INSERT INTO public.moon VALUES (20, 'Miranda', 129.9, 7, NULL);
INSERT INTO public.moon VALUES (21, 'Triton', 354.8, 8, NULL);
INSERT INTO public.moon VALUES (22, 'Nereid', 5513.4, 8, NULL);
INSERT INTO public.moon VALUES (23, 'Naiad', 48.2, 8, NULL);
INSERT INTO public.moon VALUES (24, 'Thalassa', 50.1, 8, NULL);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 460000, 1, NULL);
INSERT INTO public.planet VALUES (2, 'Venus', 460000, 1, NULL);
INSERT INTO public.planet VALUES (3, 'Earth', 460000, 1, NULL);
INSERT INTO public.planet VALUES (4, 'Mars', 460000, 1, NULL);
INSERT INTO public.planet VALUES (5, 'Jupiter', 460000, 1, NULL);
INSERT INTO public.planet VALUES (6, 'Saturn', 460000, 1, NULL);
INSERT INTO public.planet VALUES (7, 'Uranus', 460000, 1, NULL);
INSERT INTO public.planet VALUES (8, 'Neptune', 460000, 1, NULL);
INSERT INTO public.planet VALUES (9, '51 Pegasi b', 500000, 2, NULL);
INSERT INTO public.planet VALUES (10, 'Kepler-452b', 600000, 2, NULL);
INSERT INTO public.planet VALUES (11, 'HD 209458b', 400000, 2, NULL);
INSERT INTO public.planet VALUES (12, 'TRAPPIST-1b', 800000, 2, NULL);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sol', 460000, 1, NULL);
INSERT INTO public.star VALUES (2, 'Sirius', 24000, 1, NULL);
INSERT INTO public.star VALUES (3, 'Vega', 45000, 1, NULL);
INSERT INTO public.star VALUES (4, 'Alpheratz', 30000, 1, NULL);
INSERT INTO public.star VALUES (5, 'Gliese 725', 1000000, 2, NULL);
INSERT INTO public.star VALUES (6, 'M31-C1', 1200000, 2, NULL);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: live_live_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.live_live_id_seq', 3, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 24, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: galaxy galaxy_galaxy_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_galaxy_id_key UNIQUE (galaxy_id);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: live live_live_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.live
    ADD CONSTRAINT live_live_id_key UNIQUE (live_id);


--
-- Name: live live_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.live
    ADD CONSTRAINT live_pkey PRIMARY KEY (live_id);


--
-- Name: moon moon_moon_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_moon_id_key UNIQUE (moon_id);


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
-- Name: planet planet_planet_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_planet_id_key UNIQUE (planet_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star star_star_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_star_id_key UNIQUE (star_id);


--
-- Name: live live_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.live
    ADD CONSTRAINT live_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: live live_moon_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.live
    ADD CONSTRAINT live_moon_id_fkey FOREIGN KEY (moon_id) REFERENCES public.moon(moon_id);


--
-- Name: live live_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.live
    ADD CONSTRAINT live_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: live live_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.live
    ADD CONSTRAINT live_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


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

