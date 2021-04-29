--2) modelos de auto más recurrente por edificio
SELECT public.edificio_estacionamiento.id, public.modelo.marca, count(public.modelo.id)
FROM public.modelo, public.vehiculo, public.cliente_vehiculo, public.contrato, public.edificio_estacionamiento
WHERE public.modelo.id = public.vehiculo.id_modelo AND public.cliente_vehiculo.id_vehiculo = public.vehiculo.id AND public.contrato.id_clie_vehi = public.cliente_vehiculo.id AND public.contrato.id_edificio = public.edificio_estacionamiento.id
GROUP by public.edificio_estacionamiento.id, public.modelo.marca
HAVING count(public.modelo.id) IN
(
	SELECT count(public.modelo.id)
	FROM public.modelo, public.vehiculo, public.cliente_vehiculo, public.contrato, public.edificio_estacionamiento
	WHERE public.modelo.id = public.vehiculo.id_modelo AND public.cliente_vehiculo.id_vehiculo = public.vehiculo.id AND public.contrato.id_clie_vehi = public.cliente_vehiculo.id AND public.contrato.id_edificio = public.edificio_estacionamiento.id
	GROUP by public.edificio_estacionamiento.id
)
ORDER by public.edificio_estacionamiento.id;

--3) empleado con mayor sueldo por edificio
SELECT public.edificio_estacionamiento.id, public.empleado.rut, MAX(public.sueldo.monto)
FROM public.sueldo, public.empleado, public.edificio_estacionamiento
WHERE public.edificio_estacionamiento.id = public.empleado.id_edificio AND public.sueldo.id = public.empleado.id_sueldo 
AND public.sueldo.monto IN (SELECT MAX(public.sueldo.monto)
FROM public.sueldo, public.empleado, public.edificio_estacionamiento
WHERE public.edificio_estacionamiento.id = public.empleado.id_edificio AND public.sueldo.id = public.empleado.id_sueldo
GROUP by public.edificio_estacionamiento.id)
GROUP by public.edificio_estacionamiento.id, public.empleado.rut
ORDER by public.edificio_estacionamiento.id;

--5) version 2
DROP VIEW if exists lugar_disponible;

CREATE VIEW lugar_disponible as (SELECT count(public.lugar.id) as cantidad
FROM public.edificio_estacionamiento, public.lugar, public.contrato
WHERE public.edificio_estacionamiento.id = public.lugar.id_edificio AND NOT (public.edificio_estacionamiento.id = public.contrato.id_edificio)
GROUP by public.edificio_estacionamiento.nombre);

SELECT public.edificio_estacionamiento.nombre, count(public.lugar.id) as cantidad
FROM public.edificio_estacionamiento, public.lugar, public.contrato
WHERE public.edificio_estacionamiento.id = public.lugar.id_edificio AND NOT (public.edificio_estacionamiento.id = public.contrato.id_edificio)
GROUP by public.edificio_estacionamiento.nombre
HAVING count(public.lugar.id) IN (SELECT MAX(lugar_disponible.cantidad)
FROM lugar_disponible);

--6) lista de edificio con menos lugares disponibles
DROP VIEW if exists lugar_disponible;

CREATE VIEW lugar_disponible as (SELECT count(public.lugar.id) as cantidad
FROM public.edificio_estacionamiento, public.lugar, public.contrato
WHERE public.edificio_estacionamiento.id = public.lugar.id_edificio AND (public.edificio_estacionamiento.id = public.contrato.id_edificio)
GROUP by public.edificio_estacionamiento.nombre);

SELECT public.edificio_estacionamiento.nombre, count(public.lugar.id) as cantidad
FROM public.edificio_estacionamiento, public.lugar, public.contrato
WHERE public.edificio_estacionamiento.id = public.lugar.id_edificio AND (public.edificio_estacionamiento.id = public.contrato.id_edificio)
GROUP by public.edificio_estacionamiento.nombre
HAVING count(public.lugar.id) IN (SELECT MIN(lugar_disponible.cantidad)
FROM lugar_disponible);

--7) lista de clientes con más autos por edificio
DROP VIEW if exists max_cantidad_cliente_por_edificio;
DROP VIEW if exists cantidad_auto;

CREATE VIEW cantidad_auto as (SELECT public.edificio_estacionamiento.id, public.cliente.id, count(public.vehiculo.id) as cantidad
FROM public.edificio_estacionamiento, public.cliente, public.cliente_vehiculo, public.vehiculo, public.contrato
WHERE public.cliente.id = public.cliente_vehiculo.id_cliente AND public.vehiculo.id = public.cliente_vehiculo.id_vehiculo AND public.cliente_vehiculo.id = public.contrato.id_clie_vehi AND public.contrato.id_edificio = public.edificio_estacionamiento.id
GROUP by public.edificio_estacionamiento.id, public.cliente.id
ORDER by public.edificio_estacionamiento.id);

CREATE VIEW max_cantidad_cliente_por_edificio as (SELECT cantidad_auto.id_edificio, MAX(cantidad_auto.cantidad) as cantidad
FROM cantidad_auto
GROUP by cantidad_auto.id_edificio);

SELECT public.edificio_estacionamiento.nombre, cantidad_auto.id_cliente, cantidad_auto.cantidad
FROM public.edificio_estacionamiento, cantidad_auto, max_cantidad_cliente_por_edificio
WHERE public.edificio_estacionamiento.id = cantidad_auto.id_edificio AND cantidad_auto.id_edificio = max_cantidad_cliente_por_edificio.id_edificio AND cantidad_auto.cantidad = max_cantidad_cliente_por_edificio.cantidad
GROUP by public.edificio_estacionamiento.nombre, cantidad_auto.id_cliente, cantidad_auto.cantidad;


--8) lugar más usado por edificio
SELECT public.edificio_estacion.nombre, count(public.lugar.id_lugar) as cantidad_lugar_usado
FROM public.edificio_estacion, public.lugar, public.lugar_cliente_vehiculo, public.cliente_vehiculo, public.contrato
WHERE public.edificio_estacion.id_edificio = public.lugar.id_edificio AND public.lugar.id_lugar = public.lugar_cliente_vehiculo.id_lugar AND public.cliente_vehiculo.id_cliente_vehiculo = public.lugar_cliente_vehiculo.id_cliente_vehiculo AND public.cliente_vehiculo.id_cliente_vehiculo = public.contrato.id_cliente_vehiculo AND public.contrato.id_edificio = public.edificio_estacion.id_edificio
GROUP by public.edificio_estacion.id_edificio
ORDER by public.edificio_estacion.id_edificio;

--9) edificio con más empleados, indicando el número de empleados de ese edificio
DROP VIEW if exists empleados_disponible;

CREATE VIEW empleados_disponible as (SELECT public.edificio_estacionamiento.id, count(public.empleado.id) as cantidad
FROM public.edificio_estacionamiento, public.empleado
WHERE public.edificio_estacionamiento.id = public.empleado.id_edificio 
GROUP by public.edificio_estacionamiento.id
ORDER by public.edificio_estacionamiento.id);

SELECT public.edificio_estacionamiento.nombre, empleados_disponible.cantidad as empleados_en_total
FROM empleados_disponible, public.edificio_estacionamiento
WHERE empleados_disponible.id = public.edificio_estacionamiento.id AND empleados_disponible.cantidad IN (SELECT MAX(empleados_disponible.cantidad)
FROM empleados_disponible)
GROUP by public.edificio_estacionamiento.nombre, empleados_disponible.cantidad;

--10) lista de sueldos por tipo de empleado por edificio, destacar la comuna del edificio
SELECT public.edificio_estacionamiento.nombre, public.empleado.tipo as tipo_empleo, public.sueldo.monto, public.comuna.nombre as comuna_del_empleado 
FROM public.comuna, public.edificio_estacionamiento, public.empleado, public.sueldo
WHERE public.comuna.id = public.empleado.id_comuna AND public.edificio_estacionamiento.id = public.empleado.id_edificio 
AND public.empleado.id_sueldo = public.sueldo.id
ORDER by public.edificio_estacionamiento.nombre DESC, public.empleado.tipo DESC;