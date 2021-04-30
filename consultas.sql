
--2) modelos de auto más recurrente por edificio
SELECT DISTINCT (public.edificio_estacionamiento.id) AS Edificio, public.modelo.marca AS Marca, public.modelo.tipo AS Modelo, COUNT(public.modelo.id) AS conteo_modelos
FROM public.edificio_estacionamiento , public.contrato , public.cliente_vehiculo, public.modelo, public.vehiculo
WHERE  public.modelo.id = public.vehiculo.id_modelo 
    AND public.vehiculo.id=public.cliente_vehiculo.id_vehiculo
    AND public.cliente_vehiculo.id = public.contrato.id_clie_vehi 
    AND public.edificio_estacionamiento.id = public.contrato.id_edificio
GROUP BY public.edificio_estacionamiento.id, public.modelo.marca, public.modelo.tipo 

ORDER by public.edificio_estacionamiento.id ; 

