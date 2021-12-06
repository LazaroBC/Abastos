
-- 1.- Listar los datos de los clientes. 
USE Gestion8; 
GO 
IF object_id('ListarClientes', 'P') IS NOT NULL DROP PROC ListarClientes;
GO
CREATE PROCEDURE ListarClientes
AS 
 SELECT * FROM clientes;
GO
EXEC ListarClientes-- Lo probamos 
GO

-- 2.- Listar los datos de los empleados. 
IF object_id('Listarempleados', 'P') IS NOT NULL DROP PROC Listarempleados;
GO
CREATE PROCEDURE Listarempleados
AS 
 SELECT * FROM empleados;
GO
EXEC Listarempleados-- Lo probamos
GO

-- 3.- Listar los pedidos de un determinado cliente
IF object_id('PedidosCli', 'P') IS NOT NULL DROP PROC PedidosCli; 
GO 
CREATE PROCEDURE PedidosCli @cli INT 
AS 
 SELECT * FROM pedidos WHERE clie=@cli; 
GO 
-- Lo probamos, cuando probamos un  programa debemos probarlo en distintas situaciones para comprobar que funciona en todas. 
EXEC PedidosCli 2103 -- Un cliente que tiene varios pedidos  
EXEC PedidosCli 2105 -- Un cliente que no tiene pedidos 
EXEC PedidosCli 2220 -- Un cliente que no existe 
EXEC PedidosCli      -- Si no indicamos un valor para el parámetro da error

-- 4.- Listar los pedidos de un determinado empleado

IF object_id('PedidosEmp', 'P') IS NOT NULL DROP PROC PedidosEmp; 
GO 
CREATE PROCEDURE PedidosEmp @emp INT 
AS 
 SELECT * FROM pedidos WHERE rep=@emp; 
GO 
-- Lo probamos, cuando probamos un  programa debemos probarlo en distintas situaciones para comprobar que funciona en todas. 
EXEC PedidosEmp 108  -- Un Empleado que tiene varios pedidos  
EXEC PedidosEmp 204  -- Un Empleado que no tiene pedidos 
EXEC PedidosEmp 2112 -- Un Empleado que no existe 
EXEC PedidosEmp      -- Si no indicamos un valor para el parámetro da error

-- 5.- Listar las oficinas de una determinada región

IF object_id('OficinasReg','P') IS NOT NULL DROP PROC OficinasReg;
GO
CREATE PROCEDURE OficinasReg @ofi NVARCHAR(20)
AS 
 SELECT * FROM oficinas WHERE region=@ofi
GO

EXEC OficinasReg 'este' -- Una región con varias oficinas
EXEC OficinasReg 'sur'  -- Una región sin oficinas
EXEC OficinasReg 'nor'  -- Una región que no existe
EXEC OficinasReg        -- Si no indicamos un valor para el parámetro da error 

-- 6.- Listar  los datos de los clientes asignados a un determinado representante.

IF object_id('ClientesRep', 'P') IS NOT NULL DROP PROC ClientesRep;
GO
CREATE PROCEDURE ClientesRep @cliRep INT
AS
 SELECT * FROM clientes 
 INNER JOIN empleados ON numemp = repclie 
 WHERE repclie = @cliRep
GO

EXEC ClientesRep 102 -- Un empleado con varios clientes
EXEC ClientesRep 204 -- Un empleado sin clientes
EXEC ClientesRep 566 -- Un empleado que no existe
EXEC ClientesRep     -- Si no indicamos un valor para el parámetro da error

-- 7.- Listar listar los pedidos de un determinado cliente realizados por un determinado representante.

IF object_id('PedidosCliRep', 'P') IS NOT NULL DROP PROC PedidosCliRep;
GO
CREATE PROCEDURE PedidosCliRep @cli INT, @rep INT
AS
SELECT * FROM pedidos 
WHERE clie = @cli AND rep = @rep
GO
EXEC PedidosCliRep 2108, 109 -- Un cliente que tiene varios pedidos, del representante y otros pedidos de otros rep. 
EXEC PedidosCliRep 2103, 109 -- Un cliente que no tiene pedidos del representante pero sí de otros 
EXEC PedidosCliRep 2105, 109 -- Un cliente que no tiene pedidos  
EXEC PedidosCliRep 2200, 109 -- Un cliente que no existe 
-- Aquí habría más variantes, pero con estas pruebas es suficiente.

-- 8.- Crea un procedimiento PedidosCliFab para listar los pedidos en los que un 
-- determinado cliente ha comprado productos de un determinado fabricante. 
IF object_id('PedidosCliFab', 'P') IS NOT NULL DROP PROC PedidosCliFab;
GO
CREATE PROCEDURE PedidosCliFab @cli INT,  @fab NVARCHAR(20)
AS
SELECT * FROM pedidos
WHERE clie = @cli AND fab = @fab;
GO
EXEC PedidosCliFab 2103, aci -- Un cliente que tiene varios pedidos con compras al mismo fabricante
EXEC PedidosCliFab 2101, aci -- Un cliente con pedidos a otro fabricante
EXEC PedidosCliFab 2104, aci -- Un cliente sin pedidos
EXEC PedidosCliFab 2103, corre -- Un fabricante que no existe

-- Cuidado con el tipo de datos del fabricante, es texto. 
-- Hazlo tú sól@, al final de este archivo tienes la solución. 
 
-- 9.- Crea un procedimiento Subordinados para listar los subordinados de un empleado 
-- determinado, si no se indica el empleado se entenderá el 104.  
-- Los subordinados del 104 son los empleados que lo tienen como jefe.
 IF object_id('Subordinados','P') IS NOT NULL DROP PROC Subordinados;
 GO
 CREATE PROCEDURE Subordinados @jef INT = 104
 AS
 SELECT * FROM empleados
 WHERE jefe = @jef 
 GO
EXEC Subordinados   -- Para comprobar que funciona sin parámetros, comprueba que los que salen tienen como jefe el 104 (el valor `por defecto) 
EXEC Subordinados 106 -- Un empleado que tiene varios subordinados  
EXEC Subordinados 105 -- Un empleado que no tiene subordinados 
EXEC Subordinados 300 -- Un empleado que no existe
-- Ahora nos aparece un parámetro opcional y el valor por defecto es 104 porque nos 
-- dicen “si no se indica el empleado se entenderá el 104”. 
-- Intenta hacerlo sól@, al final de este archivo tienes la solución. 

-- 10.- Crea un procedimiento EmpleadosOficina para listar los empleados de una 
-- determinada oficina, si no se indica la oficina  se entenderá la 12.
IF object_id('EmpleadosOficina','P') IS NOT NULL DROP PROC EmpleadosOficina;
GO
CREATE PROCEDURE EmpleadosOficina @ofi INT = 12
AS
SELECT * FROM empleados
WHERE oficina = @ofi
GO
EXEC EmpleadosOficina     -- Para comprobar que funciona sin parámetros 
EXEC EmpleadosOficina 21  -- Una oficina que tiene varios empleados 
EXEC EmpleadosOficina 24  -- Una oficina que no tiene empleados 
EXEC EmpleadosOficina 300 -- Una oficina que no existe