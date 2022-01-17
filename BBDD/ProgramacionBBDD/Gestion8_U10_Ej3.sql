-- 1.- Redactar un procedimiento que nos devuelva cuántos pedidos ha realizado un determinado representante,
-- si el representante no existe devolverá 0.
USE Gestio8;
GO
IF Object_id('ListarPedidosRep','P') IS NOT NULL DROP PROC ListarPedidosRep;
GO
CREATE PROCEDURE ListarPedidosRep @repr INT
AS
IF (SELECT @repr FROM pedidos) IS NULL 
    BEGIN
    SELECT repr = 0, COUNT(numpedido) FROM pedidos
    END
    ELSE
    SELECT rep AS Empleado, COUNT(numpedido) AS Cantidad
        FROM pedidos 
        WHERE rep = @repr;
GO
EXEC ListarPedidosRep 110;
EXEC ListarPedidosRep 5;


-- 2.- Como el valor devuelto es un entero podríamos haber utilizado el RETURN en vez de un parámetro de salida:
-- En este caso no definimos parámetro de salida (OUTPUT), sólo el de entrada.

