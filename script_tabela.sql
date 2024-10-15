--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.24
-- Dumped by pg_dump version 9.6.24

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

SET default_with_oids = false;

--
-- Name: tspdcep; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tspdcep (
    id integer NOT NULL,
    cep character varying(9),
    logradouro character varying(255),
    complemento character varying(255),
    bairro character varying(100),
    localidade character varying(100),
    uf character(2),
    ibge character varying(7),
    gia character varying(7),
    ddd character varying(3),
    siafi character varying(7)
);


ALTER TABLE public.tspdcep OWNER TO postgres;

--
-- Name: tspdcep_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tspdcep_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tspdcep_id_seq OWNER TO postgres;

--
-- Name: tspdcep_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tspdcep_id_seq OWNED BY public.tspdcep.id;


--
-- Name: tspdcep id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tspdcep ALTER COLUMN id SET DEFAULT nextval('public.tspdcep_id_seq'::regclass);


--
-- Name: tspdcep tspdcep_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tspdcep
    ADD CONSTRAINT tspdcep_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

