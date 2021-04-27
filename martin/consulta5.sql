SELECT public.edificio_estacion.nombre, count(public.lugar.id_lugar)
FROM public.edificio_estacion, public.lugar, public.lugar_cliente_vehiculo, public.cliente_vehiculo, public.contrato
WHERE public.edificio_estacion.id_edificio = public.lugar.id_edificio AND NOT (public.edificio_estacion.id_edificio = public.lugar.id_edificio AND public.lugar.id_lugar = public.lugar_cliente_vehiculo.id_lugar AND public.cliente_vehiculo.id_cliente_vehiculo = public.lugar_cliente_vehiculo.id_cliente_vehiculo AND public.contrato.id_cliente_vehiculo = public.cliente_vehiculo.id_cliente_vehiculo)
GROUP by public.edificio_estacion.nombre
ORDER by count(public.lugar.id_lugar) DESC;
