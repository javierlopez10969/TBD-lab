--
-- PostgreSQL database dump
--

-- Dumped from database version 12.6
-- Dumped by pg_dump version 13.2

-- Started on 2021-04-23 01:09:47
--Crear base de datos
drop database if exists estacionamientosdb;

/*
--dropear tablas--
drop table if exists cliente
    CASCADE; 
drop table if exists cliente_vehiculo CASCADE; 
drop table if exists vehiculo CASCADE; 
drop table if exists modelo CASCADE; 
drop table if exists pago CASCADE; 
drop table if exists contrato CASCADE; 
drop table if exists lugar_cliente_vehiculo CASCADE; 
drop table if exists lugar CASCADE;
drop table if exists edificio_estacionamiento CASCADE; 
drop table if exists empleado CASCADE; 
drop table if exists comuna CASCADE; 
drop table if exists sueldo CASCADE; 
*/

create database estacionamientosdb;
\c estacionamientosdb;
--SET statement_timeout = 0;
--SET lock_timeout = 0;
--SET idle_in_transaction_session_timeout = 0;
--SET client_encoding = 'UTF8';
--SET standard_conforming_strings = on;
--SELECT pg_catalog.set_config('search_path', '', false);
--SET check_function_bodies = false;
--SET xmloption = content;
--SET client_min_messages = warning;
--SET row_security = off;

--SET default_tablespace = '';

--SET default_table_access_method = heap;

--
-- TOC entry 203 (class 1259 OID 16559)
-- Name: cliente; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cliente (
    id bigint NOT NULL,
    first_name character varying(32) NOT NULL,
    last_name character varying(32) NOT NULL,
    gender character varying(32) NOT NULL,
    fecha_de_nacimiento date NOT NULL,
    id_comuna bigint NOT NULL
);


ALTER TABLE public.cliente OWNER TO postgres;

--
-- TOC entry 202 (class 1259 OID 16557)
-- Name: cliente_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.cliente_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cliente_id_seq OWNER TO postgres;

--
-- TOC entry 2954 (class 0 OID 0)
-- Dependencies: 202
-- Name: cliente_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.cliente_id_seq OWNED BY public.cliente.id;


--
-- TOC entry 207 (class 1259 OID 16575)
-- Name: cliente_vehiculo; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cliente_vehiculo (
    id bigint NOT NULL,
    id_cliente bigint NOT NULL,
    id_vehiculo bigint NOT NULL
);


ALTER TABLE public.cliente_vehiculo OWNER TO postgres;

--
-- TOC entry 206 (class 1259 OID 16573)
-- Name: cliente_vehiculo_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.cliente_vehiculo_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cliente_vehiculo_id_seq OWNER TO postgres;

--
-- TOC entry 2955 (class 0 OID 0)
-- Dependencies: 206
-- Name: cliente_vehiculo_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.cliente_vehiculo_id_seq OWNED BY public.cliente_vehiculo.id;


--
-- TOC entry 213 (class 1259 OID 16609)
-- Name: comuna; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.comuna (
    id bigint NOT NULL,
    nombre character varying(32) NOT NULL,
    id_region integer NOT NULL
);


ALTER TABLE public.comuna OWNER TO postgres;

--
-- TOC entry 212 (class 1259 OID 16607)
-- Name: comuna_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.comuna_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.comuna_id_seq OWNER TO postgres;

--
-- TOC entry 2956 (class 0 OID 0)
-- Dependencies: 212
-- Name: comuna_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.comuna_id_seq OWNED BY public.comuna.id;


--
-- TOC entry 217 (class 1259 OID 16630)
-- Name: contrato; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.contrato (
    id bigint NOT NULL,
    fecha_de_inicio date NOT NULL,
    fecha_de_termino date NOT NULL,
    horario_de_inicio character varying(8) NOT NULL,
    horario_de_termino character varying(8) NOT NULL,
    id_pago bigint NOT NULL,
    id_edificio bigint NOT NULL,
    id_clie_vehi bigint NOT NULL
);


ALTER TABLE public.contrato OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 16628)
-- Name: contrato_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.contrato_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.contrato_id_seq OWNER TO postgres;

--
-- TOC entry 2957 (class 0 OID 0)
-- Dependencies: 216
-- Name: contrato_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.contrato_id_seq OWNED BY public.contrato.id;


--
-- TOC entry 215 (class 1259 OID 16617)
-- Name: edificio_estacionamiento; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.edificio_estacionamiento (
    id bigint NOT NULL,
    direccion character varying(100) NOT NULL,
    numero_edificio integer NOT NULL,
    nombre character varying(32) NOT NULL,
    id_comuna bigint NOT NULL
);


ALTER TABLE public.edificio_estacionamiento OWNER TO postgres;

--
-- TOC entry 214 (class 1259 OID 16615)
-- Name: edificio_estacionamiento_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.edificio_estacionamiento_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.edificio_estacionamiento_id_seq OWNER TO postgres;

--
-- TOC entry 2958 (class 0 OID 0)
-- Dependencies: 214
-- Name: edificio_estacionamiento_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.edificio_estacionamiento_id_seq OWNED BY public.edificio_estacionamiento.id;


--
-- TOC entry 224 (class 1259 OID 16748)
-- Name: empleado; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.empleado (
    id bigint NOT NULL,
    rut character varying(13) NOT NULL,
    nombre character varying(100) NOT NULL,
    tipo character varying(50) NOT NULL,
    id_edificio bigint NOT NULL,
    id_sueldo bigint NOT NULL,
    id_comuna bigint NOT NULL
);


ALTER TABLE public.empleado OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 16643)
-- Name: lugar; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.lugar (
    id bigint NOT NULL,
    piso integer NOT NULL,
    numero integer NOT NULL,
    id_edificio bigint NOT NULL
);


ALTER TABLE public.lugar OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 16656)
-- Name: lugar_cliente_vehiculo; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.lugar_cliente_vehiculo (
    id bigint NOT NULL,
    id_clie_vehi bigint NOT NULL,
    id_lugar bigint NOT NULL
);


ALTER TABLE public.lugar_cliente_vehiculo OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 16654)
-- Name: lugar_cliente_vehiculo_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.lugar_cliente_vehiculo_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.lugar_cliente_vehiculo_id_seq OWNER TO postgres;

--
-- TOC entry 2959 (class 0 OID 0)
-- Dependencies: 220
-- Name: lugar_cliente_vehiculo_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.lugar_cliente_vehiculo_id_seq OWNED BY public.lugar_cliente_vehiculo.id;


--
-- TOC entry 218 (class 1259 OID 16641)
-- Name: lugar_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.lugar_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.lugar_id_seq OWNER TO postgres;

--
-- TOC entry 2960 (class 0 OID 0)
-- Dependencies: 218
-- Name: lugar_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.lugar_id_seq OWNED BY public.lugar.id;


--
-- TOC entry 209 (class 1259 OID 16593)
-- Name: modelo; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.modelo (
    id bigint NOT NULL,
    nombre character varying(32) NOT NULL,
    marca character varying(32) NOT NULL,
    tipo character varying(32) NOT NULL
);


ALTER TABLE public.modelo OWNER TO postgres;

--
-- TOC entry 208 (class 1259 OID 16591)
-- Name: modelo_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.modelo_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.modelo_id_seq OWNER TO postgres;

--
-- TOC entry 2961 (class 0 OID 0)
-- Dependencies: 208
-- Name: modelo_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.modelo_id_seq OWNED BY public.modelo.id;


--
-- TOC entry 211 (class 1259 OID 16601)
-- Name: pago; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pago (
    id bigint NOT NULL,
    monto integer NOT NULL,
    fecha_pago character varying(32) NOT NULL
);


ALTER TABLE public.pago OWNER TO postgres;

--
-- TOC entry 210 (class 1259 OID 16599)
-- Name: pago_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.pago_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pago_id_seq OWNER TO postgres;

--
-- TOC entry 2962 (class 0 OID 0)
-- Dependencies: 210
-- Name: pago_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.pago_id_seq OWNED BY public.pago.id;


--
-- TOC entry 223 (class 1259 OID 16679)
-- Name: sueldo; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sueldo (
    id bigint NOT NULL,
    monto integer NOT NULL
);


ALTER TABLE public.sueldo OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 16677)
-- Name: sueldo_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.sueldo_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sueldo_id_seq OWNER TO postgres;

--
-- TOC entry 2963 (class 0 OID 0)
-- Dependencies: 222
-- Name: sueldo_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.sueldo_id_seq OWNED BY public.sueldo.id;


--
-- TOC entry 205 (class 1259 OID 16567)
-- Name: vehiculo; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.vehiculo (
    id bigint NOT NULL,
    patente character varying(32) NOT NULL,
    fecha_fabricacion character varying(32) NOT NULL,
    id_modelo bigint NOT NULL
);


ALTER TABLE public.vehiculo OWNER TO postgres;

--
-- TOC entry 204 (class 1259 OID 16565)
-- Name: vehiculo_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.vehiculo_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.vehiculo_id_seq OWNER TO postgres;

--
-- TOC entry 2964 (class 0 OID 0)
-- Dependencies: 204
-- Name: vehiculo_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.vehiculo_id_seq OWNED BY public.vehiculo.id;


--
-- TOC entry 2751 (class 2604 OID 16562)
-- Name: cliente id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cliente ALTER COLUMN id SET DEFAULT nextval('public.cliente_id_seq'::regclass);


--
-- TOC entry 2753 (class 2604 OID 16578)
-- Name: cliente_vehiculo id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cliente_vehiculo ALTER COLUMN id SET DEFAULT nextval('public.cliente_vehiculo_id_seq'::regclass);


--
-- TOC entry 2756 (class 2604 OID 16612)
-- Name: comuna id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comuna ALTER COLUMN id SET DEFAULT nextval('public.comuna_id_seq'::regclass);


--
-- TOC entry 2758 (class 2604 OID 16633)
-- Name: contrato id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contrato ALTER COLUMN id SET DEFAULT nextval('public.contrato_id_seq'::regclass);


--
-- TOC entry 2757 (class 2604 OID 16620)
-- Name: edificio_estacionamiento id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.edificio_estacionamiento ALTER COLUMN id SET DEFAULT nextval('public.edificio_estacionamiento_id_seq'::regclass);


--
-- TOC entry 2759 (class 2604 OID 16646)
-- Name: lugar id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lugar ALTER COLUMN id SET DEFAULT nextval('public.lugar_id_seq'::regclass);


--
-- TOC entry 2760 (class 2604 OID 16659)
-- Name: lugar_cliente_vehiculo id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lugar_cliente_vehiculo ALTER COLUMN id SET DEFAULT nextval('public.lugar_cliente_vehiculo_id_seq'::regclass);


--
-- TOC entry 2754 (class 2604 OID 16596)
-- Name: modelo id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.modelo ALTER COLUMN id SET DEFAULT nextval('public.modelo_id_seq'::regclass);


--
-- TOC entry 2755 (class 2604 OID 16604)
-- Name: pago id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pago ALTER COLUMN id SET DEFAULT nextval('public.pago_id_seq'::regclass);


--
-- TOC entry 2761 (class 2604 OID 16682)
-- Name: sueldo id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sueldo ALTER COLUMN id SET DEFAULT nextval('public.sueldo_id_seq'::regclass);


--
-- TOC entry 2752 (class 2604 OID 16570)
-- Name: vehiculo id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vehiculo ALTER COLUMN id SET DEFAULT nextval('public.vehiculo_id_seq'::regclass);





--
-- TOC entry 2965 (class 0 OID 0)
-- Dependencies: 202
-- Name: cliente_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cliente_id_seq', 1, false);


--
-- TOC entry 2966 (class 0 OID 0)
-- Dependencies: 206
-- Name: cliente_vehiculo_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cliente_vehiculo_id_seq', 1, false);


--
-- TOC entry 2967 (class 0 OID 0)
-- Dependencies: 212
-- Name: comuna_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.comuna_id_seq', 1, false);


--
-- TOC entry 2968 (class 0 OID 0)
-- Dependencies: 216
-- Name: contrato_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.contrato_id_seq', 1, false);


--
-- TOC entry 2969 (class 0 OID 0)
-- Dependencies: 214
-- Name: edificio_estacionamiento_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.edificio_estacionamiento_id_seq', 1, false);


--
-- TOC entry 2970 (class 0 OID 0)
-- Dependencies: 220
-- Name: lugar_cliente_vehiculo_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.lugar_cliente_vehiculo_id_seq', 1, false);


--
-- TOC entry 2971 (class 0 OID 0)
-- Dependencies: 218
-- Name: lugar_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.lugar_id_seq', 1, false);


--
-- TOC entry 2972 (class 0 OID 0)
-- Dependencies: 208
-- Name: modelo_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.modelo_id_seq', 1, false);


--
-- TOC entry 2973 (class 0 OID 0)
-- Dependencies: 210
-- Name: pago_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.pago_id_seq', 1, false);


--
-- TOC entry 2974 (class 0 OID 0)
-- Dependencies: 222
-- Name: sueldo_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.sueldo_id_seq', 1, false);


--
-- TOC entry 2975 (class 0 OID 0)
-- Dependencies: 204
-- Name: vehiculo_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.vehiculo_id_seq', 1, false);


--
-- TOC entry 2763 (class 2606 OID 16564)
-- Name: cliente cliente_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cliente
    ADD CONSTRAINT cliente_pkey PRIMARY KEY (id);


--
-- TOC entry 2767 (class 2606 OID 16580)
-- Name: cliente_vehiculo cliente_vehiculo_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cliente_vehiculo
    ADD CONSTRAINT cliente_vehiculo_pkey PRIMARY KEY (id);


--
-- TOC entry 2773 (class 2606 OID 16614)
-- Name: comuna comuna_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comuna
    ADD CONSTRAINT comuna_pkey PRIMARY KEY (id);


--
-- TOC entry 2777 (class 2606 OID 16635)
-- Name: contrato contrato_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contrato
    ADD CONSTRAINT contrato_pkey PRIMARY KEY (id);


--
-- TOC entry 2775 (class 2606 OID 16622)
-- Name: edificio_estacionamiento edificio_estacionamiento_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.edificio_estacionamiento
    ADD CONSTRAINT edificio_estacionamiento_pkey PRIMARY KEY (id);


--
-- TOC entry 2785 (class 2606 OID 16752)
-- Name: empleado empleado_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.empleado
    ADD CONSTRAINT empleado_pkey PRIMARY KEY (id);


--
-- TOC entry 2781 (class 2606 OID 16661)
-- Name: lugar_cliente_vehiculo lugar_cliente_vehiculo_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lugar_cliente_vehiculo
    ADD CONSTRAINT lugar_cliente_vehiculo_pkey PRIMARY KEY (id);


--
-- TOC entry 2779 (class 2606 OID 16648)
-- Name: lugar lugar_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lugar
    ADD CONSTRAINT lugar_pkey PRIMARY KEY (id);


--
-- TOC entry 2769 (class 2606 OID 16598)
-- Name: modelo modelo_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.modelo
    ADD CONSTRAINT modelo_pkey PRIMARY KEY (id);


--
-- TOC entry 2771 (class 2606 OID 16606)
-- Name: pago pago_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pago
    ADD CONSTRAINT pago_pkey PRIMARY KEY (id);


--
-- TOC entry 2783 (class 2606 OID 16684)
-- Name: sueldo sueldo_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sueldo
    ADD CONSTRAINT sueldo_pkey PRIMARY KEY (id);


--
-- TOC entry 2765 (class 2606 OID 16572)
-- Name: vehiculo vehiculo_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vehiculo
    ADD CONSTRAINT vehiculo_pkey PRIMARY KEY (id);


--
-- TOC entry 2791 (class 2606 OID 16718)
-- Name: contrato id_clie_vehi; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contrato
    ADD CONSTRAINT id_clie_vehi FOREIGN KEY (id_clie_vehi) REFERENCES public.cliente_vehiculo(id);


--
-- TOC entry 2795 (class 2606 OID 16733)
-- Name: lugar_cliente_vehiculo id_clie_vehi; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lugar_cliente_vehiculo
    ADD CONSTRAINT id_clie_vehi FOREIGN KEY (id_clie_vehi) REFERENCES public.cliente_vehiculo(id);


--
-- TOC entry 2788 (class 2606 OID 16703)
-- Name: cliente_vehiculo id_cliente; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cliente_vehiculo
    ADD CONSTRAINT id_cliente FOREIGN KEY (id_cliente) REFERENCES public.cliente(id);


--
-- TOC entry 2786 (class 2606 OID 16693)
-- Name: cliente id_comuna; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cliente
    ADD CONSTRAINT id_comuna FOREIGN KEY (id_comuna) REFERENCES public.comuna(id);


--
-- TOC entry 2790 (class 2606 OID 16723)
-- Name: edificio_estacionamiento id_comuna; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.edificio_estacionamiento
    ADD CONSTRAINT id_comuna FOREIGN KEY (id_comuna) REFERENCES public.comuna(id);


--
-- TOC entry 2799 (class 2606 OID 16763)
-- Name: empleado id_comuna; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.empleado
    ADD CONSTRAINT id_comuna FOREIGN KEY (id_comuna) REFERENCES public.comuna(id);


--
-- TOC entry 2792 (class 2606 OID 16708)
-- Name: contrato id_edificio; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contrato
    ADD CONSTRAINT id_edificio FOREIGN KEY (id_edificio) REFERENCES public.edificio_estacionamiento(id);


--
-- TOC entry 2794 (class 2606 OID 16728)
-- Name: lugar id_edificio; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lugar
    ADD CONSTRAINT id_edificio FOREIGN KEY (id_edificio) REFERENCES public.edificio_estacionamiento(id);


--
-- TOC entry 2798 (class 2606 OID 16758)
-- Name: empleado id_edificio; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.empleado
    ADD CONSTRAINT id_edificio FOREIGN KEY (id_edificio) REFERENCES public.edificio_estacionamiento(id);


--
-- TOC entry 2796 (class 2606 OID 16738)
-- Name: lugar_cliente_vehiculo id_lugar; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lugar_cliente_vehiculo
    ADD CONSTRAINT id_lugar FOREIGN KEY (id_lugar) REFERENCES public.lugar(id);


--
-- TOC entry 2787 (class 2606 OID 16743)
-- Name: vehiculo id_modelo; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vehiculo
    ADD CONSTRAINT id_modelo FOREIGN KEY (id_modelo) REFERENCES public.modelo(id);


--
-- TOC entry 2793 (class 2606 OID 16713)
-- Name: contrato id_pago; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contrato
    ADD CONSTRAINT id_pago FOREIGN KEY (id_pago) REFERENCES public.pago(id);


--
-- TOC entry 2797 (class 2606 OID 16753)
-- Name: empleado id_sueldo; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.empleado
    ADD CONSTRAINT id_sueldo FOREIGN KEY (id_sueldo) REFERENCES public.sueldo(id);


--
-- TOC entry 2789 (class 2606 OID 16698)
-- Name: cliente_vehiculo id_vehiculo; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cliente_vehiculo
    ADD CONSTRAINT id_vehiculo FOREIGN KEY (id_vehiculo) REFERENCES public.vehiculo(id);


-- Completed on 2021-04-23 01:09:48

--
-- PostgreSQL database dump complete
--

