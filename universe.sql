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
    description character varying(100),
    age_in_million_of_years integer,
    radius_in_light_years integer,
    total_stars_in_billion integer
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
    name character varying(30),
    planet_id integer NOT NULL,
    description character varying(100),
    avg_temp_in_celsius integer
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
    name character varying(30),
    star_id integer NOT NULL,
    has_life boolean,
    description text,
    age_in_millions_of_years integer,
    has_water boolean,
    avg_orbital_speed_in_kms numeric(5,2),
    planet_type_id integer DEFAULT 1 NOT NULL
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
-- Name: planet_type; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet_type (
    name character varying(30) NOT NULL,
    description text,
    planet_type_id integer NOT NULL
);


ALTER TABLE public.planet_type OWNER TO freecodecamp;

--
-- Name: planet_type_planet_type_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_type_planet_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_type_planet_type_id_seq OWNER TO freecodecamp;

--
-- Name: planet_type_planet_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_type_planet_type_id_seq OWNED BY public.planet_type.planet_type_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    galaxy_id integer NOT NULL,
    name character varying(30),
    description character varying(100),
    age_in_millions_of_years integer
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
-- Name: planet_type planet_type_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_type ALTER COLUMN planet_type_id SET DEFAULT nextval('public.planet_type_planet_type_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Large spiral galaxy nearest to the Milky Way', 10000, 110000, 1000);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'Small spiral galaxy in the Local Group', 8000, 60000, 40);
INSERT INTO public.galaxy VALUES (4, 'Sombrero', 'Unusual galaxy with a prominent dust lane', 9000, 50000, 500);
INSERT INTO public.galaxy VALUES (5, 'Centaurus A', 'Elliptical galaxy with a dusty disk', 12600, 120000, 200);
INSERT INTO public.galaxy VALUES (6, 'Whirlpool', 'Interacting spiral galaxies', 11000, 30000, 300);
INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Spiral galaxy containing our solar system', 13600, 100000, 100);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Luna', 1, 'Moon of Earth with a rugged terrain', -20);
INSERT INTO public.moon VALUES (2, 'Phobos', 4, 'One of Mars two moons, small and irregularly shaped', -80);
INSERT INTO public.moon VALUES (3, 'Deimos', 4, 'Mars'' other moon, smaller and farther than Phobos', -75);
INSERT INTO public.moon VALUES (4, 'Ganymede', 14, 'Jupiter''s largest moon and the largest in the solar system', -160);
INSERT INTO public.moon VALUES (5, 'Callisto', 14, 'Jupiter''s second-largest moon, heavily cratered', -140);
INSERT INTO public.moon VALUES (6, 'Io', 14, 'Jupiter''s moon with active volcanoes', -150);
INSERT INTO public.moon VALUES (7, 'Europa', 14, 'Jupiter''s icy moon with a subsurface ocean', -160);
INSERT INTO public.moon VALUES (8, 'Titan', 15, 'Saturn''s largest moon, with a thick atmosphere', -180);
INSERT INTO public.moon VALUES (9, 'Enceladus', 15, 'Saturn''s icy moon with active geysers', -200);
INSERT INTO public.moon VALUES (10, 'Triton', 16, 'Neptune''s largest moon, retrograde orbit', -235);
INSERT INTO public.moon VALUES (11, 'Charon', 17, 'Pluto''s largest moon, almost half the size of Pluto', -230);
INSERT INTO public.moon VALUES (12, 'Ariel', 18, 'Uranus'' moon with varied terrain', -210);
INSERT INTO public.moon VALUES (13, 'Miranda', 18, 'Uranus'' moon with a varied and unique surface', -200);
INSERT INTO public.moon VALUES (14, 'Titania', 18, 'Uranus'' largest moon', -220);
INSERT INTO public.moon VALUES (15, 'Oberon', 18, 'Uranus'' moon with a heavily cratered surface', -220);
INSERT INTO public.moon VALUES (16, 'Ceres', 2, 'The largest object in the asteroid belt', -105);
INSERT INTO public.moon VALUES (17, 'Nereid', 16, 'Neptune''s third-largest moon', -218);
INSERT INTO public.moon VALUES (18, 'Dione', 15, 'Saturn''s fourth-largest moon', -186);
INSERT INTO public.moon VALUES (19, 'Phoebe', 15, 'Saturns irregular-shaped moon with a dark surface', -220);
INSERT INTO public.moon VALUES (20, 'Mimas', 15, 'Saturn''s small and heavily cratered moon', -200);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (2, 'Mercury', 1, false, 'Rocky planet, closest to the Sun', 4500, false, 47.87, 7);
INSERT INTO public.planet VALUES (3, 'Venus', 1, false, 'Thick atmosphere, hot surface', 4000, false, 35.02, 7);
INSERT INTO public.planet VALUES (4, 'Mars', 1, false, 'Red planet, potential for life', 4000, true, 24.08, 7);
INSERT INTO public.planet VALUES (5, 'Proxima b', 6, false, 'Habitable exoplanet', 1000, true, 18.25, 5);
INSERT INTO public.planet VALUES (6, 'Proxima c', 6, false, 'Cold exoplanet', 900, false, 20.93, 5);
INSERT INTO public.planet VALUES (7, 'Alpha Cen b', 2, false, 'Exoplanet in the Alpha Centauri system', 2000, true, 42.02, 5);
INSERT INTO public.planet VALUES (8, 'Alpha Cen c', 2, false, 'Exoplanet in the Alpha Centauri system', 1800, true, 38.75, 5);
INSERT INTO public.planet VALUES (9, 'Betelgeuse b', 3, false, 'Gas giant, orbits Betelgeuse', 5000, false, 55.63, 5);
INSERT INTO public.planet VALUES (10, 'Betelgeuse c', 3, false, 'Gas giant, orbits Betelgeuse', 4800, false, 52.79, 5);
INSERT INTO public.planet VALUES (11, 'Sirius A I', 4, false, 'Rocky planet, orbits Sirius A', 3000, false, 63.12, 5);
INSERT INTO public.planet VALUES (12, 'Antares d', 5, false, 'Gas giant, orbits Antares', 6000, false, 47.25, 5);
INSERT INTO public.planet VALUES (1, 'Earth', 1, true, 'Blue planet, supports life', 4200, true, 29.78, 7);
INSERT INTO public.planet VALUES (14, 'Jupiter', 1, false, 'Jupiter is the largest planet in our solar system and is a gas giant.', 4600, false, 47.87, 2);
INSERT INTO public.planet VALUES (15, 'Saturn', 1, false, 'Saturn is the sixth planet from the Sun and the second-largest in the Solar System, after Jupiter. It is a gas giant with an average radius of about 58,232 kilometers.', 4500, false, 34.29, 2);
INSERT INTO public.planet VALUES (16, 'Neptune', 1, false, 'Neptune is the eighth and farthest-known Solar planet. It is the fourth-largest planet by diameter and the third-largest by mass.', 4500, false, 543.56, 3);
INSERT INTO public.planet VALUES (17, 'Pluto', 1, false, 'Pluto is a dwarf planet located in the outer regions of the Solar System.', 4380, false, 4.67, 4);
INSERT INTO public.planet VALUES (18, 'Uranus', 1, false, 'Uranus is the seventh planet from the Sun in our solar system and is a gas giant.', 4500, false, 245.45, 2);


--
-- Data for Name: planet_type; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet_type VALUES ('Gas Giant', 'Enormous planets composed mainly of hydrogen and helium, like Jupiter and Saturn, with thick atmospheres and no solid surfaces.', 2);
INSERT INTO public.planet_type VALUES ('Ice Giant', 'Planets like Uranus and Neptune, larger than terrestrial planets but smaller than gas giants, with icy cores and thick atmospheres.', 3);
INSERT INTO public.planet_type VALUES ('Dwarf Planet', 'Celestial bodies that orbit the sun but are not large enough to be considered full-fledged planets, like Pluto and Eris.', 4);
INSERT INTO public.planet_type VALUES ('Exoplanet', 'Planets located outside our solar system, orbiting stars beyond the Sun.', 5);
INSERT INTO public.planet_type VALUES ('Rogue Planet', 'Planetary-mass objects not bound to any star, drifting alone through space without orbiting any sun.', 6);
INSERT INTO public.planet_type VALUES ('Other', 'Other', 1);
INSERT INTO public.planet_type VALUES ('Terrestial Planet', 'Small, rocky worlds with solid surfaces, similar to Earth, Mercury, Venus, and Mars.', 7);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 1, 'Sol', 'Our sun', 4600);
INSERT INTO public.star VALUES (2, 5, 'Alpha Centauri', 'Brightest star in Centaurus', 6000);
INSERT INTO public.star VALUES (3, 1, 'Betelgeuse', 'Red supergiant in Orion', 8000);
INSERT INTO public.star VALUES (4, 2, 'Sirius', 'Brightest star in the sky', 200);
INSERT INTO public.star VALUES (5, 2, 'Antares', 'Red supergiant in Scorpius', 12000);
INSERT INTO public.star VALUES (6, 5, 'Proxima Centauri', 'Closest known star to Sun', 5000);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 50, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 18, true);


--
-- Name: planet_type_planet_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_type_planet_type_id_seq', 7, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 39, true);


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
-- Name: moon moon_name_key1; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key1 UNIQUE (name);


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
-- Name: planet_type planet_type_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_type
    ADD CONSTRAINT planet_type_name_key UNIQUE (name);


--
-- Name: planet_type planet_type_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_type
    ADD CONSTRAINT planet_type_pkey PRIMARY KEY (planet_type_id);


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
-- Name: planet planet_planet_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_planet_type_id_fkey FOREIGN KEY (planet_type_id) REFERENCES public.planet_type(planet_type_id);


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
