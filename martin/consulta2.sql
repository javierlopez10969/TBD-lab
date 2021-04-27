SELECT public.edificio_estacion.id_edificio, public.modelo.marca, count(public.modelo.id_modelo)
FROM public.modelo, public.vehiculo, public.cliente_vehiculo, public.contrato, public.edificio_estacion
WHERE public.modelo.id_modelo = public.vehiculo.id_modelo AND public.cliente_vehiculo.id_vehiculo = public.vehiculo.id_vehiculo AND public.contrato.id_cliente_vehiculo = public.cliente_vehiculo.id_cliente_vehiculo AND public.contrato.id_edificio = public.edificio_estacion.id_edificio
GROUP by public.edificio_estacion.id_edificio, public.modelo.marca
HAVING count(public.modelo.id_modelo) IN
(
	SELECT count(public.modelo.id_modelo)
	FROM public.modelo, public.vehiculo, public.cliente_vehiculo, public.contrato, public.edificio_estacion
	WHERE public.modelo.id_modelo = public.vehiculo.id_modelo AND public.cliente_vehiculo.id_vehiculo = public.vehiculo.id_vehiculo AND public.contrato.id_cliente_vehiculo = public.cliente_vehiculo.id_cliente_vehiculo AND public.contrato.id_edificio = public.edificio_estacion.id_edificio
	GROUP by public.edificio_estacion.id_edificio
)
ORDER by public.edificio_estacion.id_edificio;


