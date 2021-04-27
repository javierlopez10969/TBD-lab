SELECT public.cliente.id_cliente, public.pago.monto
FROM public.cliente, public.cliente_vehiculo, public.contrato, public.pago
WHERE public.cliente.id_cliente = public.cliente_vehiculo.id_cliente AND public.contrato.id_cliente_vehiculo = public.cliente_vehiculo.id_cliente_vehiculo AND public.contrato.id_pago = public.pago.id_pago
ORDER BY public.pago.monto