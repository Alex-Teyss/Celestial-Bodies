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
-- Name: exoplanet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.exoplanet (
    exoplanet_id integer NOT NULL,
    name character varying(100) NOT NULL,
    star_id integer,
    discovery_date date,
    mass_earth_masses double precision,
    orbital_period_days double precision
);


ALTER TABLE public.exoplanet OWNER TO freecodecamp;

--
-- Name: exoplanet_exoplanet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.exoplanet_exoplanet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.exoplanet_exoplanet_id_seq OWNER TO freecodecamp;

--
-- Name: exoplanet_exoplanet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.exoplanet_exoplanet_id_seq OWNED BY public.exoplanet.exoplanet_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(100) NOT NULL,
    description text,
    has_life boolean,
    galaxy_types numeric,
    age_in_millions_of_years integer,
    distance_from_earth integer
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(100) NOT NULL,
    planet_id integer,
    description text,
    planet_types numeric,
    has_life boolean,
    age_in_millions_of_years integer,
    distance_from_earth integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(100) NOT NULL,
    star_id integer,
    description text,
    planet_types numeric,
    has_life boolean,
    age_in_millions_of_years integer,
    distance_from_earth integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(100) NOT NULL,
    galaxy_id integer,
    description text,
    planet_types numeric,
    has_life boolean,
    age_in_millions_of_years integer,
    distance_from_earth integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: exoplanet exoplanet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.exoplanet ALTER COLUMN exoplanet_id SET DEFAULT nextval('public.exoplanet_exoplanet_id_seq'::regclass);


--
-- Data for Name: exoplanet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.exoplanet VALUES (1, 'Proxima Centauri b', 2, '2016-08-24', 1.07, 11.2);
INSERT INTO public.exoplanet VALUES (2, 'TRAPPIST-1e', NULL, '2017-02-22', 0.77, 6.1);
INSERT INTO public.exoplanet VALUES (3, 'Kepler-186f', NULL, '2014-04-17', 1.17, 129.9);
INSERT INTO public.exoplanet VALUES (4, 'HD 40307 g', NULL, '2012-11-08', 7.1, 197.8);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Our home galaxy, a large spiral galaxy', true, 4, 13600, 0);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Nearest major galaxy to the Milky Way', false, 3, 10000, 2537000);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'Third-largest galaxy in the Local Group', false, 5, 5000, 3000000);
INSERT INTO public.galaxy VALUES (4, 'Messier 87', 'Supergiant elliptical galaxy with a supermassive black hole', false, 0, 12000, 53490000);
INSERT INTO public.galaxy VALUES (5, 'Large Magellanic Cloud', 'Satellite galaxy of the Milky Way', false, 7, 1101, 163000);
INSERT INTO public.galaxy VALUES (6, 'Sombrero Galaxy', 'Peculiar galaxy of unclear classification', false, 1, 13250, 29350000);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Luna', 1, 'Earth''s only natural satellite', 0, false, 4510, 0);
INSERT INTO public.moon VALUES (2, 'Phobos', 2, 'Larger and inner moon of Mars', 0, false, 4503, 225);
INSERT INTO public.moon VALUES (3, 'Deimos', 2, 'Smaller and outer moon of Mars', 0, false, 4503, 225);
INSERT INTO public.moon VALUES (4, 'Ganymede', 3, 'Largest moon of Jupiter and in the Solar System', 0, false, 4503, 779);
INSERT INTO public.moon VALUES (6, 'Ganymede', 5, 'Largest moon in the Solar System', 0, false, 4503, 779);
INSERT INTO public.moon VALUES (7, 'Callisto', 5, 'Third-largest moon in the Solar System', 0, false, 4503, 779);
INSERT INTO public.moon VALUES (8, 'Titan', 6, 'Largest moon of Saturn', 0, false, 4503, 1434);
INSERT INTO public.moon VALUES (9, 'Enceladus', 6, 'Ice-covered moon with subsurface ocean', 0, false, 4503, 1434);
INSERT INTO public.moon VALUES (10, 'Mimas', 6, 'Smallest astronomical body known to be rounded by self-gravitation', 0, false, 4503, 1434);
INSERT INTO public.moon VALUES (11, 'Miranda', 7, 'Smallest of Uranus''s five round satellites', 0, false, 4503, 2871);
INSERT INTO public.moon VALUES (12, 'Ariel', 7, 'Fourth-largest of Uranus''s moons', 0, false, 4503, 2871);
INSERT INTO public.moon VALUES (13, 'Umbriel', 7, 'Third-largest of Uranus''s moons', 0, false, 4503, 2871);
INSERT INTO public.moon VALUES (14, 'Titania', 7, 'Largest moon of Uranus', 0, false, 4503, 2871);
INSERT INTO public.moon VALUES (15, 'Oberon', 7, 'Outermost of Uranus''s five major moons', 0, false, 4503, 2871);
INSERT INTO public.moon VALUES (16, 'Triton', 8, 'Largest natural satellite of Neptune', 0, false, 4503, 4495);
INSERT INTO public.moon VALUES (17, 'Nereid', 8, 'Third-largest moon of Neptune', 0, false, 4503, 4495);
INSERT INTO public.moon VALUES (21, 'Amalthea', 5, 'Third moon of Jupiter by distance', 0, false, 4503, 779);
INSERT INTO public.moon VALUES (22, 'Dione', 6, 'Fourth-largest moon of Saturn', 0, false, 4503, 1434);
INSERT INTO public.moon VALUES (23, 'Tethys', 6, 'Mid-sized moon of Saturn', 0, false, 4503, 1434);
INSERT INTO public.moon VALUES (24, 'Iapetus', 6, 'Third-largest natural satellite of Saturn', 0, false, 4503, 1434);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 1, 'Our home planet', 1, true, 4540, 0);
INSERT INTO public.planet VALUES (2, 'Mars', 1, 'The Red Planet', 1, false, 4603, 225);
INSERT INTO public.planet VALUES (3, 'Jupiter', 1, 'Largest planet in our solar system', 5, false, 4603, 779);
INSERT INTO public.planet VALUES (4, 'Proxima Centauri b', 2, 'Potentially habitable exoplanet', 2, false, 4850, 40000000);
INSERT INTO public.planet VALUES (5, 'Jupiter', 1, 'Largest planet in our solar system', 5, false, 4603, 779);
INSERT INTO public.planet VALUES (6, 'Saturn', 1, 'Known for its prominent ring system', 5, false, 4503, 1434);
INSERT INTO public.planet VALUES (7, 'Uranus', 1, 'Ice giant with a tilted axis of rotation', 3, false, 4503, 2871);
INSERT INTO public.planet VALUES (8, 'Neptune', 1, 'Windiest planet in our solar system', 3, false, 4503, 4495);
INSERT INTO public.planet VALUES (9, 'Proxima Centauri b', 2, 'Potentially habitable exoplanet', 2, false, 4850, 40000000);
INSERT INTO public.planet VALUES (13, 'Proxima Centauri c', 2, 'Super-Earth exoplanet orbiting Proxima Centauri', 2, false, 4850, 40000000);
INSERT INTO public.planet VALUES (14, 'Alpha Centauri Bb', 5, 'Unconfirmed exoplanet orbiting Alpha Centauri B', 1, false, 5300, 40000000);
INSERT INTO public.planet VALUES (15, 'Luhman 16 AB b', 6, 'Hypothetical planet orbiting Luhman 16 AB', 5, false, 500, 64000000);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 'Our solar system''s star', 8, true, 4600, 0);
INSERT INTO public.star VALUES (2, 'Proxima Centauri', 1, 'Closest star to the Solar System', 1, false, 4850, 4);
INSERT INTO public.star VALUES (3, 'Betelgeuse', 1, 'Red supergiant in Orion', 0, false, 8, 643);
INSERT INTO public.star VALUES (4, 'Sirius', 1, 'Brightest star in Earth''s night sky', 0, false, 230, 9);
INSERT INTO public.star VALUES (5, 'Alpha Centauri A', 1, 'Primary component of the Alpha Centauri system', 0, false, 5300, 4);
INSERT INTO public.star VALUES (6, 'VY Canis Majoris', 1, 'One of the largest known stars', 0, false, 8, 3900);


--
-- Name: exoplanet_exoplanet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.exoplanet_exoplanet_id_seq', 4, true);


--
-- Name: exoplanet exoplanet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.exoplanet
    ADD CONSTRAINT exoplanet_pkey PRIMARY KEY (exoplanet_id);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: exoplanet is_unique_exoplanet_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.exoplanet
    ADD CONSTRAINT is_unique_exoplanet_id UNIQUE (exoplanet_id);


--
-- Name: galaxy is_unique_galaxy_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT is_unique_galaxy_id UNIQUE (galaxy_id);


--
-- Name: moon is_unique_planet; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT is_unique_planet UNIQUE (moon_id);


--
-- Name: planet is_unique_planet_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT is_unique_planet_id UNIQUE (planet_id);


--
-- Name: star is_unique_star_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT is_unique_star_id UNIQUE (star_id);


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
-- Name: exoplanet exoplanet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.exoplanet
    ADD CONSTRAINT exoplanet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


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
