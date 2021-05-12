SELECT public.edificio_estacion.nombre, count(public.lugar.id_lugar) as cantidad_lugar_usado
FROM public.edificio_estacion, public.lugar, public.lugar_cliente_vehiculo, public.cliente_vehiculo, public.contrato
WHERE public.edificio_estacion.id_edificio = public.lugar.id_edificio AND public.lugar.id_lugar = public.lugar_cliente_vehiculo.id_lugar AND public.cliente_vehiculo.id_cliente_vehiculo = public.lugar_cliente_vehiculo.id_cliente_vehiculo AND public.cliente_vehiculo.id_cliente_vehiculo = public.contrato.id_cliente_vehiculo AND public.contrato.id_edificio = public.edificio_estacion.id_edificio
GROUP by public.edificio_estacion.id_edificio
ORDER by public.edificio_estacion.id_edificio;



