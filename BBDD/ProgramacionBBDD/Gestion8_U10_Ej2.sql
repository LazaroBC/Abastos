USE Gestion8
--Ejercicios 2 de Programación en Transact-SQL 
--Usa para los ejercicios la base de datos Gestion8. 
--Para cada ejercicio crea un script que pueda ejecutarse en cualquier momento, permita crear el procedimiento 
--para obtener lo indicado, y además permita comprobar que el procedimiento funciona (como en los ejemplos 
--de la unidad didáctica). En los enunciados tienes entre paréntesis el nombre del procedimiento.  
--1.‐ Listar los datos de los empleados de una determinada oficina así como los datos de la oficina, no sacar 
--ningún mensaje adicional. Si la oficina no tiene empleados se sacarán sus datos y nulos en los campos de los 
--empleados. (EmpOficina2_1) 
IF object_id('EmpOficina2_1','P') IS NOT NULL DROP PROC EmpOficina2_1
GO
CREATE PROCEDURE EmpOficina2_1  @ofi INT
AS
SELECT oficinas.*, empleados.* FROM oficinas
LEFT JOIN empleados ON empleados.oficina = oficinas.oficina
WHERE oficinas.oficina = @ofi 
GO
EXEC EmpOficina2_1 12 -- Oficina con varios empleados
EXEC EmpOficina2_1 10 -- Oficina que no existe
EXEC EmpOficina2_1 25 -- Oficina sin empleados
EXEC EmpOficina2_1    -- Procedimiento sin datos
--2.‐ Para que la salida obtenida quede más clara, delante de la lista deberá aparecer el texto "Detalle de la 
--oficina xx:" Donde xx será el nº de la oficina. (EmpOficina2_2) 
IF object_id('EmpOficina2_2','P') IS NOT NULL DROP PROC EmpOficina2_2
GO
CREATE PROCEDURE EmpOficina2_2  @ofi INT
AS
SELECT 'Detalle de la oficina '+ CAST(@ofi AS char(3))+':'
SELECT oficinas.*, empleados.* FROM oficinas
LEFT JOIN empleados ON empleados.oficina = oficinas.oficina
WHERE oficinas.oficina = @ofi 
GO
EXEC EmpOficina2_2 12 -- Oficina con varios empleados
EXEC EmpOficina2_2 10 -- Oficina que no existe
EXEC EmpOficina2_2 25 -- Oficina sin empleados
EXEC EmpOficina2_2    -- Procedimiento sin datos

--3.‐ Y si la oficina no existe, después del listado saca un texto que diga "La oficina xx no existe".  Donde xx será 
--el nº de la oficina. (EmpOficina2_3)  
IF object_id('EmpOficina2_3','P') IS NOT NULL DROP PROC EmpOficina2_3
GO
CREATE PROCEDURE EmpOficina2_3  @ofi INT
AS
SELECT 'Detalle de la oficina '+ CAST(@ofi AS char(3))+':'
SELECT oficinas.*, empleados.* FROM oficinas
LEFT JOIN empleados ON empleados.oficina = oficinas.oficina
WHERE oficinas.oficina = @ofi 
IF (select count(1) from oficinas where oficinas.oficina = @ofi) = 0
SELECT 'La oficina ' + CAST(@ofi AS char(3)) + ' no existe.'
GO
EXEC EmpOficina2_3 12 -- Oficina con varios empleados
EXEC EmpOficina2_3 10 -- Oficina que no existe
EXEC EmpOficina2_3 25 -- Oficina sin empleados
EXEC EmpOficina2_3    -- Procedimiento sin datos
--4.‐ Ahora, si la oficina no existe tiene que aparecer el mensaje pero no la tabla vacía . (EmpOficina2_4) 
IF object_id('EmpOficina2_4','P') IS NOT NULL DROP PROC EmpOficina2_4
GO
CREATE PROCEDURE EmpOficina2_4  @ofi INT
AS
IF (select count(1) from oficinas where oficinas.oficina = @ofi) = 0
    BEGIN
        SELECT 'La oficina ' + CAST(@ofi AS char(3)) + ' no existe.'
        RETURN
    END
ELSE
SELECT 'Detalle de la oficina '+ CAST(@ofi AS char(3))+':'
SELECT oficinas.*, empleados.* FROM oficinas
LEFT JOIN empleados ON empleados.oficina = oficinas.oficina
WHERE oficinas.oficina = @ofi 
GO
EXEC EmpOficina2_4 12 -- Oficina con varios empleados
EXEC EmpOficina2_4 10 -- Oficina que no existe
EXEC EmpOficina2_4 25 -- Oficina sin empleados
EXEC EmpOficina2_4    -- Procedimiento sin datos
--5.‐ Obtener una estadística de número de pedidos (cuántos)  e importe total vendido por un determinado 
--empleado.  Si el empleado no tiene pedidos saldrá una tabla vacía.  (PedidosRep2_5)
IF object_id('PedidosRep2_5','P') IS NOT NULL DROP PROC PedidosRep2_5
GO
CREATE PROCEDURE PedidosRep2_5 @rep INT
AS
SELECT @rep AS Num_Empleado, COUNT(@rep) AS Cant_Ped, SUM(importe) AS Importe_total
FROM pedidos
WHERE rep = @rep;
GO

EXEC PedidosRep2_5 103 -- Empleado con más de un pedido
EXEC PedidosRep2_5 104 -- Empleado sin pedidos o no existente
EXEC PedidosRep2_5     -- Procedimiento sin datos

--6.‐ Añadir a la información obtenida el nombre y nº de oficina del empleado.  (PedidosRep2_6)  
IF object_id('PedidosRep2_6','P') IS NOT NULL DROP PROC PedidosRep2_6
GO
CREATE PROCEDURE PedidosRep2_6 @rep INT
AS
SELECT @rep AS Num_Empleado, empleados.nombre AS Nombre, empleados.oficina AS Oficina, COUNT(@rep) AS Cant_Ped, SUM(importe) AS Importe_total
FROM pedidos
INNER JOIN empleados ON empleados.numemp = pedidos.rep
WHERE rep = @rep;
GO

EXEC PedidosRep2_6 103 -- Empleado con más de un pedido
EXEC PedidosRep2_6 104 -- Empleado sin pedidos o no existente
EXEC PedidosRep2_6     -- Procedimiento sin datos
--7.‐ Ahora, si el empleado no tiene pedidos a contabilizar que no aparezca la tabla vacía.  (PedidosRep2_7) 
--8.‐ Lo mismo pero ahora que aparezca el empleado (su código, nombre y código de oficina) aunque no tenga 
--pedidos.  (PedidosRep2_8) 
IF object_id('PedidosRep2_6','P') IS NOT NULL DROP PROC PedidosRep2_6
GO
CREATE PROCEDURE PedidosRep2_6 @rep INT
AS
SELECT @rep AS Num_Empleado, empleados.nombre AS Nombre, empleados.oficina AS Oficina, COUNT(@rep) AS Cant_Ped, SUM(importe) AS Importe_total
FROM pedidos
INNER JOIN empleados ON empleados.numemp = pedidos.rep
WHERE rep = @rep
GROUP BY rep, nombre, oficina;
GO

EXEC PedidosRep2_6 101 -- Empleado con más de un pedido
EXEC PedidosRep2_6 104 -- Empleado sin pedidos o no existente
EXEC PedidosRep2_6     -- Procedimiento sin datos

--9.‐ Listar los pedidos de un determinado cliente en un determinado mes y determinado año. Sólo queremos el 
--código del cliente  y sólo de los clientes que tienen pedidos en el periodo indicado. (PedCliMensual_2_9)   
IF object_id('PedCliMensual_2_9','P') IS NOT NULL DROP PROC PedCliMensual_2_9
GO
CREATE PROCEDURE PedCliMensual_2_9 @anyo INT, @mes INT, @cli INT
AS
SELECT clie AS Código_cliente
FROM pedidos
WHERE YEAR(fechapedido) = @anyo AND MONTH(fechapedido) = @mes AND clie = @cli
;
GO

EXEC PedCliMensual_2_9 2008, 01, 2103 -- Cliente con pedido el 2008-01-01 
EXEC PedCliMensual_2_9 2008, 07, 2114 -- Cliente con pedido el 2008-07-06
EXEC PedCliMensual_2_9 2007, 10       -- Periodo sin datos en el cliente
EXEC PedCliMensual_2_9                -- Procedimiento sin datos

--10.‐ Ahora el código del  cliente  deberá aparecer aunque no tenga pedidos en el período. 
--(PedCliMensual_2_10)
IF object_id('PedCliMensual_2_10','P') IS NOT NULL DROP PROC PedCliMensual_2_10
GO
CREATE PROCEDURE PedCliMensual_2_10 @anyo INT, @mes INT, @cli INT
AS
SELECT 'Codigo a buscar ' + CAST(@cli AS char(4)) ;
SELECT clie AS Código_cliente
FROM pedidos
WHERE YEAR(fechapedido) = @anyo AND MONTH(fechapedido) = @mes AND clie = @cli
;
GO

EXEC PedCliMensual_2_10 2008, 01, 2103 -- Cliente con pedido el 2008-01-01 
EXEC PedCliMensual_2_10 2008, 07, 2114 -- Cliente con pedido el 2008-07-06
EXEC PedCliMensual_2_10 2007, 10, 2104     -- Periodo sin datos en el cliente
EXEC PedCliMensual_2_10          -- Procedimiento sin datos

--11.‐ Rectificar el ejercicio anterior para que salga el texto "el cliente  xxx no existe" en vez de una tabla vacía. 
--(PedCliMensual_2_11)
--10.‐ Ahora el código del  cliente  deberá aparecer aunque no tenga pedidos en el período. 
--(PedCliMensual_2_10)
IF object_id('PedCliMensual_2_10','P') IS NOT NULL DROP PROC PedCliMensual_2_10
GO
CREATE PROCEDURE PedCliMensual_2_10 @anyo INT, @mes INT, @cli INT
AS
SELECT 'Codigo a buscar ' + CAST(@cli AS char(4)) ;
IF (select clie from pedidos where YEAR(fechapedido) = @anyo AND MONTH(fechapedido) = @mes AND clie = @cli) IS NULL
    BEGIN
        SELECT 'El ciente ' + CAST(@cli AS char(4)) + ' no existe.'
        RETURN
    END
ELSE
SELECT clie AS Código_cliente
FROM pedidos
WHERE YEAR(fechapedido) = @anyo AND MONTH(fechapedido) = @mes AND clie = @cli
;

GO

EXEC PedCliMensual_2_10 2008, 01, 2103 -- Cliente con pedido el 2008-01-01 
EXEC PedCliMensual_2_10 2008, 07, 2114 -- Cliente con pedido el 2008-07-06
EXEC PedCliMensual_2_10 2007, 10, 2104     -- Periodo sin datos en el cliente
EXEC PedCliMensual_2_10          -- Procedimiento sin datos


--12.‐ Lo mismo que la anterior pero si no se indica el año se entenderá que se refiere al año actual. 
--(PedCliMensual_2_12)


USE Gestion8;
--12.‐ Lo mismo que la anterior pero si no se indica el año se entenderá que se refiere al año actual. 
--(PedCliMensual_2_12) /
-- SELECT CONVERT(INT,(YEAR(GETDATE())))
IF object_id('PedCliMensual_2_10','P') IS NOT NULL DROP PROC PedCliMensual_2_10
GO

CREATE PROCEDURE PedCliMensual_2_10 @anyo INT, @mes INT, @cli INT
AS
SELECT 'Codigo a buscar ' + CAST(@cli AS char(4)) ;
IF (select clie from pedidos where YEAR(fechapedido) = @anyo AND MONTH(fechapedido) = @mes AND clie = @cli) IS NULL
    BEGIN
        SELECT 'El ciente ' + CAST(@cli AS char(4)) + ' no existe.'
        RETURN
    END
ELSE
SELECT clie AS Código_cliente
FROM pedidos
WHERE YEAR(fechapedido) = @anyo AND MONTH(fechapedido) = @mes AND clie = @cli
;

GO

EXEC PedCliMensual_2_10 2008, 01, 2103 -- Cliente con pedido el 2008-01-01 
EXEC PedCliMensual_2_10 2008, 07, 2114 -- Cliente con pedido el 2008-07-06
EXEC PedCliMensual_2_10 2007, 10, 2104 -- Periodo sin datos en el cliente
EXEC PedCliMensual_2_10 NULL, 08, 2109 -- Procedimiento sin datos