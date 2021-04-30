DROP VIEW if exists lugar_disponible;

CREATE VIEW lugar_disponible as (SELECT count(public.lugar.id_lugar) as cantidad
FROM public.edificio_estacion, public.lugar, public.contrato
WHERE public.edificio_estacion.id_edificio = public.lugar.id_edificio AND (public.edificio_estacion.id_edificio = public.contrato.id_edificio)
GROUP by public.edificio_estacion.nombre);

SELECT public.edificio_estacion.nombre, count(public.lugar.id_lugar) as cantidad
FROM public.edificio_estacion, public.lugar, public.contrato
WHERE public.edificio_estacion.id_edificio = public.lugar.id_edificio AND (public.edificio_estacion.id_edificio = public.contrato.id_edificio)
GROUP by public.edificio_estacion.nombre
HAVING count(public.lugar.id_lugar) IN (SELECT MIN(lugar_disponible.cantidad)
FROM lugar_disponible);
