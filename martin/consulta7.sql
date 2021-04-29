DROP VIEW if exists max_cantidad_cliente_por_edificio;
DROP VIEW if exists cantidad_auto;

CREATE VIEW cantidad_auto as (SELECT public.edificio_estacion.id_edificio, public.cliente.id_cliente, count(public.vehiculo.id_vehiculo) as cantidad
FROM public.edificio_estacion, public.cliente, public.cliente_vehiculo, public.vehiculo, public.contrato
WHERE public.cliente.id_cliente = public.cliente_vehiculo.id_cliente AND public.vehiculo.id_vehiculo = public.cliente_vehiculo.id_vehiculo AND public.cliente_vehiculo.id_cliente_vehiculo = public.contrato.id_cliente_vehiculo AND public.contrato.id_edificio = public.edificio_estacion.id_edificio
GROUP by public.edificio_estacion.id_edificio, public.cliente.id_cliente
ORDER by public.edificio_estacion.id_edificio);

CREATE VIEW max_cantidad_cliente_por_edificio as (SELECT cantidad_auto.id_edificio, MAX(cantidad_auto.cantidad) as cantidad
FROM cantidad_auto
GROUP by cantidad_auto.id_edificio);

SELECT public.edificio_estacion.nombre, cantidad_auto.id_cliente, cantidad_auto.cantidad
FROM public.edificio_estacion, cantidad_auto, max_cantidad_cliente_por_edificio
WHERE public.edificio_estacion.id_edificio = cantidad_auto.id_edificio AND cantidad_auto.id_edificio = max_cantidad_cliente_por_edificio.id_edificio AND cantidad_auto.cantidad = max_cantidad_cliente_por_edificio.cantidad
GROUP by public.edificio_estacion.nombre, cantidad_auto.id_cliente, cantidad_auto.cantidad;


