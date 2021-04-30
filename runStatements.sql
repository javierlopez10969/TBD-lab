--Script para ejecutar las consulatas a la base de datos
/*
1) lista de clientes que gasta más por edificio
2) modelos de auto más recurrente por edificio
3) empleado con mayor sueldo por edificio
4) lista de comunas con la cantidad de clientes que residen en ellas
5) lista de edificio con más lugares disponibles (sin contrato)
6) lista de edificio con menos lugares disponibles
7) lista de clientes con más autos por edificio
8) lugar más usado por edificio
9) edificio con más empleados, indicando el número de empleados de ese edificio
10) lista de sueldos por tipo de empleado por edificio, destacar la comuna del edificio
*/

--1) lista de clientes que gasta más por edificio
SELECT public.edificio_estacionamiento.id, public.cliente.first_name, MAX(public.pago.monto)
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

--4) lista de comunas con la cantidad de clientes que residen en ellas
SELECT public.comuna.nombre, count(public.cliente.id)
FROM public.comuna, public.cliente
WHERE public.comuna.id = public.cliente.id_comuna
GROUP by public.comuna.nombre;

--5) lista de edificio con más lugares disponibles (sin contrato)
SELECT public.edificio_estacionamiento.nombre, count(public.lugar.id)
FROM public.edificio_estacionamiento, public.lugar, public.lugar_cliente_vehiculo, public.cliente_vehiculo, public.contrato
WHERE public.edificio_estacionamiento.id = public.lugar.id_edificio AND NOT (public.edificio_estacionamiento.id = public.lugar.id_edificio 
AND public.lugar.id = public.lugar_cliente_vehiculo.id_lugar AND public.cliente_vehiculo.id = public.lugar_cliente_vehiculo.id_clie_vehi 
AND public.contrato.id_clie_vehi = public.cliente_vehiculo.id)
GROUP by public.edificio_estacionamiento.nombre
ORDER by count(public.lugar.id) DESC;

--9)

SELECT public.edificio_estacionamiento.id as id_edificio, public.edificio_estacionamiento.nombre as nombre_edificio, COUNT(public.empleado.id_edificio) as empleados_totales
FROM public.empleado, public.edificio_estacionamiento
WHERE empleado.id_edificio = edificio_estacionamiento.id 
GROUP by public.edificio_estacionamiento.id, public.edificio_estacionamiento.nombre 
ORDER BY COUNT(*) DESC
LIMIT 1;


--10)
SELECT  public.empleado.tipo as empleado, public.sueldo.monto as sueldo, public.edificio_estacionamiento.nombre as nombre_edificio, public.comuna.nombre as comuna_edificio
FROM public.comuna, public.edificio_estacionamiento, public.empleado, public.sueldo
WHERE public.sueldo.id = public.empleado.id_sueldo AND public.empleado.id_edificio = public.edificio_estacionamiento.id 
    AND public.comuna.id = public.edificio_estacionamiento.id_comuna
ORDER by public.empleado.tipo, public.sueldo.monto, public.edificio_estacionamiento.nombre, public.comuna.nombre


