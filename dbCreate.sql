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


--Crear las tablas--

--Tabla de Cliente--
CREATE TABLE IF not exists cliente (
	id BIGSERIAL NOT NULL PRIMARY KEY,
	first_name VARCHAR(32) NOT NULL,
	last_name VARCHAR(32) NOT NULL,
	gender VARCHAR(10) NOT NULL,
    fecha_de_nacimiento DATE NOT NULL
);


--Tabla de Vehiculo--
CREATE TABLE IF not exists vehiculo (
    id BIGSERIAL NOT NULL PRIMARY KEY,
    patente VARCHAR(32) NOT NULL,
    año VARCHAR(32) NOT NULL

);

--Tabla de Cliente_Vehiculo--
CREATE TABLE IF not exists  cliente_vehiculo(
    id BIGSERIAL NOT NULL PRIMARY KEY,
    CONSTRAINT id_cliente
        FOREIGN KEY(id)
            REFERENCES cliente(id),
    CONSTRAINT id_vehiculo 
        FOREIGN KEY(id)
            REFERENCES vehiculo(id)
);

--Tabla de Modelo--
create table IF not exists  modelo (
    id BIGSERIAL NOT NULL PRIMARY KEY,
    nombre VARCHAR(32) NOT NULL,
	marca VARCHAR(32) NOT NULL,
    tipo VARCHAR(32) NOT NULL
);

--tabla de pago--
create table IF not exists  pago(
    id BIGSERIAL NOT NULL PRIMARY KEY,
    monto INT NOT NULL,
    fecha_de_pago VARCHAR(32) NOT NULL
);

--Tabla de Comuna--
CREATE TABLE IF not exists  comuna(
    id BIGSERIAL NOT NULL PRIMARY KEY,
	nombre VARCHAR(32) NOT NULL
);

--Tabla de Edificio_Estacionamiento--
create table IF not exists edificio_estacionamiento(
    id BIGSERIAL NOT NULL PRIMARY KEY,
	direccion VARCHAR(100) NOT NULL,
	numero_edificio INT NOT NULL,
	nombre VARCHAR(32) NOT NULL,
	CONSTRAINT id_comuna
        FOREIGN KEY(id)
            REFERENCES comuna(id)
);

--Tabla de Contrato--
create table IF not exists contrato(
    id BIGSERIAL NOT NULL PRIMARY KEY,
    fecha_de_inicio DATE NOT NULL,
    fecha_de_termino DATE NOT NULL,
    horario_de_inicio VARCHAR(8) NOT NULL,
    horario_de_termino VARCHAR(8) NOT NULL,
    CONSTRAINT id_edificio
        FOREIGN KEY(id)
            REFERENCES edificio_estacionamiento(id)
);

--Tabla de lugar--
create table IF not exists lugar(
    id BIGSERIAL NOT NULL PRIMARY KEY,
    piso INT NOT NULL,
    numero INT NOT NULL,
	CONSTRAINT id_edificio
        FOREIGN KEY(id)
            REFERENCES edificio_estacionamiento(id)
);

--Tabla de lugar_cliente_vehiculo--
create table IF not exists lugar_cliente_vehiculo(
    id BIGSERIAL NOT NULL PRIMARY KEY,
    CONSTRAINT id_cliente_vehiculo
        FOREIGN KEY(id)
            REFERENCES cliente_vehiculo(id),
    CONSTRAINT id_lugar 
        FOREIGN KEY(id)
            REFERENCES lugar(id)
);

--Tabla de Empleado--
create table IF not exists empleado(
    id BIGSERIAL NOT NULL PRIMARY KEY,
	rut VARCHAR(14) NOT NULL,
	nombre VARCHAR(32) NOT NULL,
	tipo VARCHAR(32) NOT NULL,
	CONSTRAINT id_edificio
        FOREIGN KEY(id)
            REFERENCES edificio_estacionamiento(id)
);

--Tabla de Sueldo--
CREATE TABLE IF not exists sueldo(
    id BIGSERIAL NOT NULL PRIMARY KEY,
	monto INT NOT NULL
);

--Botar bse de datos--
--drop database estacionamientosdb;
