SELECT public.edificio_estacion.id_edificio, public.cliente.nombre, MAX(public.pago.monto)
FROM public.pago, public.cliente, public.cliente_vehiculo, public.contrato, public.edificio_estacion
WHERE public.cliente.id_cliente = public.cliente_vehiculo.id_cliente AND public.cliente_vehiculo.id_cliente_vehiculo = public.contrato.id_cliente_vehiculo AND public.contrato.id_pago = public.pago.id_pago AND public.contrato.id_edificio = public.edificio_estacion.id_edificio AND public.pago.monto IN 
(
	SELECT MAX(public.pago.monto)
	FROM public.pago, public.contrato, public.edificio_estacion
	WHERE public.edificio_estacion.id_edificio = public.contrato.id_edificio AND public.pago.id_pago = public.contrato.id_pago
	GROUP by public.edificio_estacion.id_edificio
)
GROUP by public.edificio_estacion.id_edificio, public.cliente.nombre
ORDER by public.edificio_estacion.id_edificio;
