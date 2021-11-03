/*Consultas multitabla*/
/*1. Modifica la definición de la tabla pedidos para que las columnas rep, clie, fab y producto no 
admitan valores nulos. Haz lo mismo con la columna repclie de la tabla Clientes. */
/*2.  Listar los códigos y nombres de los empleados de las oficinas del Este con su oficina y ciudad. */
SELECT empleados.numemp AS Código, empleados.nombre, oficinas.oficina, oficinas.ciudad, oficinas.region
FROM empleados
INNER JOIN oficinas 
ON oficinas.oficina = empleados.oficina
WHERE oficinas.region LIKE 'este';
/*3. Listar todos los pedidos mostrando su número, importe, nombre de cliente, y el límite de 
crédito del cliente correspondiente.*/
SELECT pedidos.numpedido, pedidos.importe, clientes.nombre, clientes.limitecredito
FROM pedidos
LEFT JOIN clientes
ON clientes.numclie = pedidos.clie;
/*4. Listar las oficinas con objetivo superior a 60.000 euros indicando para cada una el nombre 
de su director.*/
SELECT oficinas.*, empleados.nombre
FROM oficinas
LEFT JOIN empleados
ON oficinas.dir = empleados.numemp
WHERE oficinas.objetivo > 60000;
/*5. Listar todos los pedidos, mostrando el precio y  la descripción del producto.*/
SELECT pedidos.*, productos.precio, productos.descripcion
FROM pedidos
INNER JOIN productos
ON idfab = pedidos.fab AND idproducto = producto
ORDER BY pedidos.codigo;
/*6. Listar los pedidos superiores a 250 euros, incluyendo el nombre del vendedor que tomó el 
pedido y el nombre del cliente que lo solicitó.*/
SELECT pedidos.*, clientes.nombre, empleados.nombre
FROM (pedidos INNER JOIN clientes ON pedidos.clie =clientes.numclie) 
INNER JOIN empleados
ON clientes.repclie = empleados.numemp
WHERE pedidos.importe > 250;
SELECT pedidos.*, empleados.nombre AS Vendedor, clientes.nombre AS Cliente
FROM pedidos
INNER JOIN empleados ON numemp = rep
INNER JOIN clientes ON numclie = clie
WHERE pedidos.importe > 250;
/*7. Listar los pedidos superiores a 250 euros, mostrando además el nombre del cliente que 
solicitó  el pedido y el nombre del vendedor asignado a ese cliente y la ciudad de la oficina donde el vendedor trabaja.*/
SELECT pedidos.*, clientes.nombre AS Cliente, empleados.nombre AS Vendedor, oficinas.ciudad AS Ciudad
FROM pedidos
INNER JOIN clientes ON pedidos.clie = clientes.numclie
INNER JOIN empleados ON empleados.numemp = clientes.repclie
LEFT JOIN oficinas ON empleados.oficina = oficinas.oficina
WHERE pedidos.importe > 250;
/*8. Hallar los pedidos recibidos los días en que un nuevo empleado fue contratado. */
SELECT numpedido, fechapedido, rep, numemp, nombre, contrato  
FROM pedidos,  empleados  
WHERE fechapedido=contrato;
/*9. Listar los empleados que tienen una cuota superior al objetivo de al menos una oficina. La 
oficina puede ser cualquiera no tiene porqué ser la del empleado.*/
SELECT numemp, nombre, cuota, empleados.oficina AS [Su oficina], oficinas.oficina, objetivo 
FROM empleados, oficinas 
WHERE cuota > objetivo;
/*10. Listar los empleados con una cuota superior a la de su jefe, los campos a obtener son el 
número, nombre y cuota del empleado y número, nombre y cuota de su jefe.*/
SELECT empleados.numemp, empleados.nombre, empleados.cuota, jefes.numemp AS Jefe, jefes.nombre AS [Nombre Jefe], jefes.cuota AS [Cuota Jefe]
FROM empleados
INNER JOIN empleados AS jefes ON empleados.jefe = jefes.numemp
WHERE empleados.cuota > jefes.cuota;
/*11. Desde el entorno gráfico cambia el empleado 111, asígnale el jefe 110 y la oficina 21. 
Después cambia la sentencia anterior para que salgan también los empleados cuyo jefe no 
tenga cuota.*/
SELECT empleados.numemp, empleados.nombre, empleados.cuota, jefes.numemp AS Jefe, jefes.nombre AS [Nombre Jefe], jefes.cuota AS [Cuota Jefe]
FROM empleados
INNER JOIN empleados AS jefes ON empleados.jefe = jefes.numemp
WHERE empleados.cuota > jefes.cuota OR jefes.cuota IS NULL;
/*12. Listar las oficinas (código) que no tienen empleados, resolver el 
problema de dos formas (con JOIN y sin utilizar la composición de tablas).*/
SELECT oficinas.oficina
FROM oficinas
LEFT JOIN empleados ON oficinas.oficina = empleados.oficina
WHERE empleados.numemp IS NULL;

SELECT oficina 
FROM oficinas 
EXCEPT 
SELECT oficina 
FROM empleados;
/*13. Obtener los productos (código completo) que no aparecen en ningún pedido. */
SELECT idfab, idproducto 
FROM productos 
EXCEPT 
SELECT fab, producto 
FROM pedidos;
/*14. Obtener los empleados de GestionSimples que aparecen en GestionA con otra oficina.*/
SELECT numemp, oficina 
FROM gestionsimples.dbo.empleados 
EXCEPT 
SELECT numemp, oficina 
FROM gestionA.dbo.empleados; 
/*Hace dos cosnsultas independientes, como si tuviera la primera ; al final */
SELECT numemp, oficina 
FROM gestionsimples.dbo.empleados
SELECT numemp, oficina 
FROM gestionA.dbo.empleados; 
/* Obtener los empleados de GestionSimples que aparecen en GestionA con la misma oficina.*/
SELECT numemp, oficina 
FROM gestionsimples.dbo.empleados
INTERSECT
SELECT numemp, oficina 
FROM gestionA.dbo.empleados; 

