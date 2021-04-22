--Crear base de datos
drop database if exists estacionamientosdb;
create database estacionamientosDB;
--Botar bse de datos--
--drop database estacionamientosdb;

--Crear las tablas--

--Tabla de Cliente--
create table cliente (
	id BIGSERIAL NOT NULL PRIMARY KEY,
	first_name VARCHAR(32) NOT NULL,
	last_name VARCHAR(32) NOT NULL,
	gender VARCHAR(10) NOT NULL,
    fecha_de_nacimiento DATE NOT NULL
);
--Tabla de Cliente_Vehiculo--
create table cliente_vehiculo(
    id BIGSERIAL NOT NULL PRIMARY KEY,
    CONSTRAINT id_cliente
        FOREIGN KEY(id)
            REFERENCES cliente(id),
    CONSTRAINT id_vehiculo 
        FOREIGN KEY(id)
            REFERENCES vehiculo(id)
);
--Tabla de Vehiculo--
create table vehiculo (
    id BIGSERIAL NOT NULL PRIMARY KEY,
    patente VARCHAR(32) NOT NULL,
    año VARCHAR(32) NOT NULL

);
--Tabla de Modelo--
create table modelo (
    id BIGSERIAL NOT NULL PRIMARY KEY,
    nombre VARCHAR(32) NOT NULL,
	marca VARCHAR(32) NOT NULL,
    tipo VARCHAR(32) NOT NULL
);

--tabla de pago--
create table pago(
    id BIGSERIAL NOT NULL PRIMARY KEY,
    monto INT NOT NULL,
    fecha_de_pago VARCHAR(32) NOT NULL
);


--Tabla de Contrato--
create table contrato(
    id BIGSERIAL NOT NULL PRIMARY KEY,
    fecha_de_inicio DATE NOT NULL,
    fecha_de_termino DATE NOT NULL,
    horario_de_inicio VARCHAR(8) NOT NULL,
    horario_de_termino VARCHAR(8) NOT NULL
);

--Tabla de lugar_cliente_vehiculo--
create table lugar_cliente_vehiculo(
    id BIGSERIAL NOT NULL PRIMARY KEY,
    CONSTRAINT id_cliente_vehiculo
        FOREIGN KEY(id)
            REFERENCES cliente_vehiculo(id),
    CONSTRAINT id_lugar 
        FOREIGN KEY(id)
            REFERENCES lugar(id)
);

--Tabla de lugar--
create table lugar(
    id BIGSERIAL NOT NULL PRIMARY KEY,
    piso INT NOT NULL,
    numero INT NOT NULL,
	CONSTRAINT id_edificio
        FOREIGN KEY(id)
            REFERENCES edificio_estacionamiento(id)
);

--Tabla de Edificio_Estacionamiento--
create table edificio_estacionamiento(
    id BIGSERIAL NOT NULL PRIMARY KEY,
	direccion VARCHAR(100) NOT NULL,
	numero_edificio INT NOT NULL,
	nombre VARCHAR(32) NOT NULL,
	CONSTRAINT id_comuna
        FOREIGN KEY(id)
            REFERENCES comuna(id)
	
);

--Tabla de Empleado--
create table empleado(
    id BIGSERIAL NOT NULL PRIMARY KEY,
	rut VARCHAR(14) NOT NULL,
	nombre VARCHAR(32) NOT NULL,
	tipo VARCHAR(32) NOT NULL,
	CONSTRAINT id_edificio
        FOREIGN KEY(id)
            REFERENCES edificio_estacionamiento(id)
);
--Tabla de Comuna--
create table comuna(
    id BIGSERIAL NOT NULL PRIMARY KEY,
	nombre VARCHAR(32) NOT NULL
);
--Tabla de Sueldo--
create table sueldo(
    id BIGSERIAL NOT NULL PRIMARY KEY,
	monto INT NOT NULL
);