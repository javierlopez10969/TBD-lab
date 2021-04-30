--7) lista de clientes con más autos por edificio
DROP VIEW if exists max_cantidad_cliente_por_edificio;
DROP VIEW if exists cantidad_auto;

CREATE VIEW cantidad_auto as (SELECT public.edificio_estacionamiento.id as Edesid, public.cliente.id as Clid, count(public.vehiculo.id) as cantidad
FROM public.edificio_estacionamiento, public.cliente, public.cliente_vehiculo, public.vehiculo, public.contrato
WHERE public.cliente.id = public.cliente_vehiculo.id_cliente AND public.vehiculo.id = public.cliente_vehiculo.id_vehiculo AND public.cliente_vehiculo.id = public.contrato.id_clie_vehi AND public.contrato.id_edificio = public.edificio_estacionamiento.id
GROUP by public.edificio_estacionamiento.id, public.cliente.id
ORDER by public.edificio_estacionamiento.id);

CREATE VIEW max_cantidad_cliente_por_edificio as (SELECT cantidad_auto.Edesid, MAX(cantidad_auto.cantidad) as cantidad
FROM cantidad_auto
GROUP by cantidad_auto.Edesid);

SELECT public.edificio_estacionamiento.nombre, cantidad_auto.Clid, cantidad_auto.cantidad
FROM public.edificio_estacionamiento, cantidad_auto, max_cantidad_cliente_por_edificio
WHERE public.edificio_estacionamiento.id = cantidad_auto.Edesid AND cantidad_auto.Edesid = max_cantidad_cliente_por_edificio.Edesid AND cantidad_auto.cantidad = max_cantidad_cliente_por_edificio.cantidad
GROUP by public.edificio_estacionamiento.nombre, cantidad_auto.Clid, cantidad_auto.cantidad;


--8) lugar más usado por edificio
SELECT public.edificio_estacionamiento.nombre, count(public.lugar.id) as cantidad_lugar_usado
FROM public.edificio_estacionamiento, public.lugar, public.lugar_cliente_vehiculo, public.cliente_vehiculo, public.contrato
WHERE public.edificio_estacionamiento.id = public.lugar.id_edificio AND public.lugar.id = public.lugar_cliente_vehiculo.id_lugar AND public.cliente_vehiculo.id = public.lugar_cliente_vehiculo.id_clie_vehi AND public.cliente_vehiculo.id = public.contrato.id_clie_vehi AND public.contrato.id_edificio = public.edificio_estacionamiento.id
GROUP by public.edificio_estacionamiento.id
ORDER by public.edificio_estacionamiento.id;
