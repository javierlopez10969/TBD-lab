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


