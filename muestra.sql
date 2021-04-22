CREATE TABLE IF not exists pago
(
	id_pago serial primary key,
	monto integer,
	fecha_pago date
);

CREATE TABLE IF not exists cliente
(
	id_cliente serial primary key,
	nombre varchar(32),
	apellido varchar(32)
);

CREATE TABLE IF not exists contrato
(
	id_contrato serial primary key,
	fecha_inicio date,
	fecha_final date,
	horario_inicio time without time zone,
	horario_final time without time zone,
	id_edificio serial
);

CREATE TABLE IF not exists edificio_estacion
(
	id_edificio serial primary key,
	direccion varchar(50),
	numero_edificio integer,
	nombre varchar,
	id_comuna serial
);

CREATE TABLE IF not exists comuna
(
	id_comuna serial primary key,
	nombre varchar(32)
);

CREATE TABLE IF not exists cliente_vehiculo
(
	id_cliente_vehiculo serial primary key,
	id_cliente serial,
	id_vehiculo serial
);

CREATE TABLE IF not exists lugar_cliente_vehiculo
(
	id_lugar_cliente_vehiculo serial primary key,
	id_cliente_vehiculo serial,
	id_lugar serial
);

CREATE TABLE IF not exists vehiculo
(
	id_vehiculo serial primary key,
	patente varchar(32),
	ano date
);

CREATE TABLE IF not exists lugar
(
	id_lugar serial primary key,
	piso integer,
	numero integer,
	id_edificio serial
);

CREATE TABLE IF not exists empleado
(
	rut_empleado serial primary key,
	nombre varchar(32),
	apellido varchar(32),
	tipo varchar(16),
	id_edificio serial
);

CREATE TABLE IF not exists modelo
(
	id_modelo serial primary key,
	nombre varchar(32),
	marca varchar(32),
	tipo varchar(32)
);

CREATE TABLE IF not exists sueldo
(
	id_sueldo serial primary key,
	monto integer
);

ALTER TABLE contrato
ADD FOREIGN KEY (id_edificio) REFERENCES edificio_estacion(id_edificio);

ALTER TABLE edificio_estacion
ADD FOREIGN KEY (id_comuna) REFERENCES comuna(id_comuna);

ALTER TABLE cliente_vehiculo
ADD FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente);

ALTER TABLE cliente_vehiculo
ADD FOREIGN KEY (id_vehiculo) REFERENCES vehiculo(id_vehiculo);

ALTER TABLE lugar_cliente_vehiculo
ADD FOREIGN KEY (id_cliente_vehiculo) REFERENCES cliente_vehiculo(id_cliente_vehiculo);

ALTER TABLE lugar_cliente_vehiculo
ADD FOREIGN KEY (id_lugar) REFERENCES lugar(id_lugar);

ALTER TABLE lugar
ADD FOREIGN KEY (id_edificio) REFERENCES edificio_estacion(id_edificio);

ALTER TABLE empleado
ADD FOREIGN KEY (id_edificio) REFERENCES edificio_estacion(id_edificio);