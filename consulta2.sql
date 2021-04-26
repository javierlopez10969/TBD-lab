SELECT public.modelo.nombre, public.edificio_estacion.nombre, count(public.edificio_estacion.nombre)
FROM public.modelo, public.vehiculo, public.cliente_vehiculo, public.contrato, public.edificio_estacion
WHERE public.modelo.id_modelo = public.vehiculo.id_modelo AND public.vehiculo.id_vehiculo = public.cliente_vehiculo.id_vehiculo AND public.contrato.id_cliente_vehiculo = public.cliente_vehiculo.id_cliente_vehiculo AND public.contrato.id_edificio = public.edificio_estacion.id_edificio
GROUP BY public.edificio_estacion.nombre, public.modelo.nombre;
