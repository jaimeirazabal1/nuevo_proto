--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.4
-- Dumped by pg_dump version 9.3.4
-- Started on 2014-05-11 14:28:24 VET

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- TOC entry 176 (class 3079 OID 11829)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2045 (class 0 OID 0)
-- Dependencies: 176
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 175 (class 1259 OID 16460)
-- Name: controlador; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE controlador (
    id integer NOT NULL,
    controlador character varying(100),
    created timestamp without time zone DEFAULT now()
);


ALTER TABLE public.controlador OWNER TO postgres;

--
-- TOC entry 174 (class 1259 OID 16458)
-- Name: controlador_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE controlador_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.controlador_id_seq OWNER TO postgres;

--
-- TOC entry 2046 (class 0 OID 0)
-- Dependencies: 174
-- Name: controlador_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE controlador_id_seq OWNED BY controlador.id;


--
-- TOC entry 173 (class 1259 OID 16450)
-- Name: permiso; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE permiso (
    id integer NOT NULL,
    titulo character varying(100),
    hidden integer,
    usuario_id integer,
    activo integer,
    controlador_id integer
);


ALTER TABLE public.permiso OWNER TO postgres;

--
-- TOC entry 172 (class 1259 OID 16448)
-- Name: permiso_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE permiso_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.permiso_id_seq OWNER TO postgres;

--
-- TOC entry 2047 (class 0 OID 0)
-- Dependencies: 172
-- Name: permiso_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE permiso_id_seq OWNED BY permiso.id;


--
-- TOC entry 171 (class 1259 OID 16440)
-- Name: usuario; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE usuario (
    id integer NOT NULL,
    nombre_usuario character varying(50) NOT NULL,
    password character varying(100),
    created timestamp without time zone,
    admin integer
);


ALTER TABLE public.usuario OWNER TO postgres;

--
-- TOC entry 170 (class 1259 OID 16438)
-- Name: usuario_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE usuario_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.usuario_id_seq OWNER TO postgres;

--
-- TOC entry 2048 (class 0 OID 0)
-- Dependencies: 170
-- Name: usuario_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE usuario_id_seq OWNED BY usuario.id;


--
-- TOC entry 1915 (class 2604 OID 16463)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY controlador ALTER COLUMN id SET DEFAULT nextval('controlador_id_seq'::regclass);


--
-- TOC entry 1914 (class 2604 OID 16453)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY permiso ALTER COLUMN id SET DEFAULT nextval('permiso_id_seq'::regclass);


--
-- TOC entry 1913 (class 2604 OID 16443)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY usuario ALTER COLUMN id SET DEFAULT nextval('usuario_id_seq'::regclass);


--
-- TOC entry 2037 (class 0 OID 16460)
-- Dependencies: 175
-- Data for Name: controlador; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO controlador (id, controlador, created) VALUES (1, 'permiso/ver_permisos', '2014-05-11 07:20:09.645689');
INSERT INTO controlador (id, controlador, created) VALUES (2, 'controlador/actualizar', '2014-05-11 07:20:09.661816');
INSERT INTO controlador (id, controlador, created) VALUES (3, 'usuario/login', '2014-05-11 07:20:09.669724');
INSERT INTO controlador (id, controlador, created) VALUES (4, 'usuario/lista', '2014-05-11 07:20:09.678228');
INSERT INTO controlador (id, controlador, created) VALUES (5, 'usuario/logout', '2014-05-11 07:20:09.686471');
INSERT INTO controlador (id, controlador, created) VALUES (6, 'usuario/eliminar', '2014-05-11 07:20:09.727896');
INSERT INTO controlador (id, controlador, created) VALUES (7, 'usuario/nuevo', '2014-05-11 07:20:09.736063');
INSERT INTO controlador (id, controlador, created) VALUES (8, 'usuario/menus', '2014-05-11 07:20:09.744214');


--
-- TOC entry 2049 (class 0 OID 0)
-- Dependencies: 174
-- Name: controlador_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('controlador_id_seq', 8, true);


--
-- TOC entry 2035 (class 0 OID 16450)
-- Dependencies: 173
-- Data for Name: permiso; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO permiso (id, titulo, hidden, usuario_id, activo, controlador_id) VALUES (3, 'entrar', 0, 2, 1, 3);
INSERT INTO permiso (id, titulo, hidden, usuario_id, activo, controlador_id) VALUES (4, 'Permisos de Usuarios', 1, 1, 1, 1);
INSERT INTO permiso (id, titulo, hidden, usuario_id, activo, controlador_id) VALUES (5, 'Actualizar Lista de Controladores', NULL, 1, 1, 2);
INSERT INTO permiso (id, titulo, hidden, usuario_id, activo, controlador_id) VALUES (1, 'Autenticar Usuario', NULL, 1, 1, 3);
INSERT INTO permiso (id, titulo, hidden, usuario_id, activo, controlador_id) VALUES (6, 'Lista de Usuarios', NULL, 1, 1, 4);
INSERT INTO permiso (id, titulo, hidden, usuario_id, activo, controlador_id) VALUES (2, 'Salir del Sistema', NULL, 1, 1, 5);
INSERT INTO permiso (id, titulo, hidden, usuario_id, activo, controlador_id) VALUES (7, NULL, 1, 1, 1, 6);
INSERT INTO permiso (id, titulo, hidden, usuario_id, activo, controlador_id) VALUES (8, 'Nuevo Usuario', NULL, 1, 1, 7);
INSERT INTO permiso (id, titulo, hidden, usuario_id, activo, controlador_id) VALUES (9, 'Inicio de Usuario', NULL, 1, 1, 8);


--
-- TOC entry 2050 (class 0 OID 0)
-- Dependencies: 172
-- Name: permiso_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('permiso_id_seq', 19, true);


--
-- TOC entry 2033 (class 0 OID 16440)
-- Dependencies: 171
-- Data for Name: usuario; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO usuario (id, nombre_usuario, password, created, admin) VALUES (1, 'admin', '21232f297a57a5a743894a0e4a801fc3', '2014-05-10 19:20:27.551914', 1);


--
-- TOC entry 2051 (class 0 OID 0)
-- Dependencies: 170
-- Name: usuario_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('usuario_id_seq', 17, true);


--
-- TOC entry 1924 (class 2606 OID 16466)
-- Name: controlador_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY controlador
    ADD CONSTRAINT controlador_pkey PRIMARY KEY (id);


--
-- TOC entry 1922 (class 2606 OID 16455)
-- Name: permiso_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY permiso
    ADD CONSTRAINT permiso_pkey PRIMARY KEY (id);


--
-- TOC entry 1918 (class 2606 OID 16447)
-- Name: usuario_nombre_usuario_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY usuario
    ADD CONSTRAINT usuario_nombre_usuario_key UNIQUE (nombre_usuario);


--
-- TOC entry 1920 (class 2606 OID 16445)
-- Name: usuario_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY usuario
    ADD CONSTRAINT usuario_pkey PRIMARY KEY (id);


--
-- TOC entry 2044 (class 0 OID 0)
-- Dependencies: 5
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2014-05-11 14:28:24 VET

--
-- PostgreSQL database dump complete
--

