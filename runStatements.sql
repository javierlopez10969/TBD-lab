--Script para ejecutar las consulatas a la base de datos


\echo 1) lista de clientes que gasta más por edificio 
\echo 
\echo 
SELECT public.edificio_estacionamiento.id edificio, public.cliente.first_name nombre, MAX(public.pago.monto) pago
FROM public.pago, public.cliente, public.cliente_vehiculo, public.contrato, public.edificio_estacionamiento
WHERE public.cliente.id = public.cliente_vehiculo.id_cliente AND public.cliente_vehiculo.id = public.contrato.id_clie_vehi AND public.contrato.id_pago = public.pago.id AND public.contrato.id_edificio = public.edificio_estacionamiento.id AND public.pago.monto IN 
(
	SELECT MAX(public.pago.monto)
	FROM public.pago, public.contrato, public.edificio_estacionamiento
	WHERE public.edificio_estacionamiento.id = public.contrato.id_edificio AND public.pago.id = public.contrato.id_pago
	GROUP by public.edificio_estacionamiento.id
)
GROUP by public.edificio_estacionamiento.id, public.cliente.first_name
ORDER by public.edificio_estacionamiento.id;

\echo 
\echo 2) modelos de autos más recurrentes por edificio
\echo 
\echo 
SELECT public.edificio_estacionamiento.id as Edificio, public.modelo.marca, count(public.modelo.id)
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

\echo 
\echo 3) empleado con mayor sueldo por edificio
\echo 
\echo 
SELECT edificio.id as Edificio , empleado.rut rut, sueldo.monto sueldo
FROM public.sueldo sueldo
INNER JOIN public.empleado empleado ON empleado.id_sueldo = sueldo.id
INNER JOIN public.edificio_estacionamiento edificio ON empleado.id_edificio = edificio.id 

INNER JOIN (
    SELECT public.edificio_estacionamiento.id, MAX(public.sueldo.monto) sueldomax
    FROM public.sueldo 
    INNER JOIN public.empleado ON public.empleado.id_sueldo = public.sueldo.id
    INNER JOIN public.edificio_estacionamiento ON public.empleado.id_edificio = public.edificio_estacionamiento.id 
    GROUP BY public.edificio_estacionamiento.id
) maximo ON sueldo.monto = maximo.sueldomax AND maximo.id = id_edificio
ORDER BY id_edificio ASC;

\echo 
\echo 4) lista de comunas con la cantidad de clientes que residen en ellas
\echo 
\echo 
SELECT public.comuna.nombre, count(public.cliente.id)
FROM public.comuna, public.cliente
WHERE public.comuna.id = public.cliente.id_comuna
GROUP by public.comuna.nombre;

\echo 
\echo 5) lista de edificio con más lugares disponibles (sin contrato)
\echo 
\echo 
SELECT public.edificio_estacionamiento.nombre, count(public.lugar.id)
FROM public.edificio_estacionamiento, public.lugar, public.lugar_cliente_vehiculo, public.cliente_vehiculo, public.contrato
WHERE public.edificio_estacionamiento.id = public.lugar.id_edificio AND NOT (public.edificio_estacionamiento.id = public.lugar.id_edificio 
AND public.lugar.id = public.lugar_cliente_vehiculo.id_lugar AND public.cliente_vehiculo.id = public.lugar_cliente_vehiculo.id_clie_vehi 
AND public.contrato.id_clie_vehi = public.cliente_vehiculo.id)
GROUP by public.edificio_estacionamiento.nombre
ORDER by count(public.lugar.id) DESC;


\echo 
\echo 6) lista de edificio con menos lugares disponibles
\echo 
\echo 
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

\echo 
\echo 9) edificio con más empleados, indicando el número de empleados de ese edificio
\echo 
\echo 

SELECT public.edificio_estacionamiento.id as id_edificio, public.edificio_estacionamiento.nombre as nombre_edificio, COUNT(public.empleado.id_edificio) as empleados_totales
FROM public.empleado, public.edificio_estacionamiento
WHERE empleado.id_edificio = edificio_estacionamiento.id 
GROUP by public.edificio_estacionamiento.id, public.edificio_estacionamiento.nombre 
ORDER BY COUNT(*) DESC
LIMIT 1;


\echo 
\echo 10) lista de sueldos por tipo de empleado por edificio, destacar la comuna del edificio
\echo 
\echo 
SELECT  public.empleado.tipo as empleado, public.sueldo.monto as sueldo, public.edificio_estacionamiento.nombre as nombre_edificio, public.comuna.nombre as comuna_edificio
FROM public.comuna, public.edificio_estacionamiento, public.empleado, public.sueldo
WHERE public.sueldo.id = public.empleado.id_sueldo AND public.empleado.id_edificio = public.edificio_estacionamiento.id 
AND public.comuna.id = public.edificio_estacionamiento.id_comuna
ORDER by public.empleado.tipo, public.sueldo.monto, public.edificio_estacionamiento.nombre, public.comuna.nombre


