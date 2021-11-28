/*Ejercicios de Actualización de datos */
 
-- Nota Importante: Para hacer los ejercicios tienes que utilizar la base de datos 
-- Gestion8 que está en el portal. En algunos ejercicios se indica el número de filas 
-- que deben ser afectadas por la instrucción, y en los casos de modificación de 
-- datos, los valores tal como deben quedar. 
 

-- 1. Crear una copia de empleados con el nombre Nuevaempleados, lo mismo para la 
-- tabla de oficinas (Nuevaoficinas), la de clientes (Nuevaclientes), la de productos 
-- (Nuevaproductos) y la de pedidos (Nuevapedidos). 

-- A partir de este momento estas tablas servirán para tener una copia original de 
-- las tablas que vamos a modificar, las tablas creadas sólo se utilizarán en el 
-- ejercicio 23. 

 

-- 2. Añadir una nueva oficina para la ciudad de Elx, con el número de oficina 40, 
-- con director 108 y con un objetivo de 100.000€. 
INSERT INTO oficinas
    (oficina,ciudad,region,dir,objetivo,ventas)
VALUES  (40, 'Elx','este',108,100000,NULL);

 

-- 3. Añadir un nuevo empleado numemp:115, nombre:Luis Garcia, oficina:40, sin 
-- objetivo ni ventas ni director 
INSERT INTO empleados
    (numemp, nombre, oficina)
VALUES (115,'Luis Garcia',40)

-- 4. Crear una tabla (Oeste) con todas las oficinas del Oeste, la tabla tendrá los 
-- mismos datos que oficinas. 

-- (3 filas afectadas) 
CREATE TABLE oeste (oficinaOeste INT
					, ciudadOeste nvarchar(20)
					, regionOeste nvarchar(20)
					, dirOeste INT
					, objetivoOeste MONEY
					, ventasOeste MONEY);
INSERT INTO oeste SELECT oficina
						, ciudad
						, region 
						, dir
						, objetivo
						, ventas
						FROM oficinas
						WHERE region =  'oeste';
 

-- 5. Añadir a la tabla Oeste las oficinas del Este. 

-- (6 filas afectadas) 

INSERT INTO oeste SELECT oficina
						, ciudad
						, region 
						, dir
						, objetivo
						, ventas
						FROM oficinas
						WHERE region =  'este';
 

-- 6. Añadir a la oficina 40 un empleado Antonio García López, con número de empleado 
-- 435, contratado hoy sin ventas con cuota 1200,45 € con título Vendedor, de momento 
-- no le asignaremos jefe. 
INSERT INTO empleados (numemp
					,nombre
					,edad
					,oficina
					,titulo
					,contrato
					,jefe
					,cuota
					,ventas)
					VALUES (435
						,'Antonio García López'
						,NULL
						,40
						,'Vendedor'
						,GETDATE()
						,NULL
						,1200,45);
 

-- 7. Añadir a la oficina 40 otro empleado, Luis Valverde, con número de empleado 
-- 436, con los mismos datos que el anterior pero su jefe será el director de la 
-- oficina 40 (no sabemos qué número tiene este director). 
 INSERT INTO empleados (numemp
					,nombre
					,edad
					,oficina
					,titulo
					,contrato
					,jefe
					,cuota
					,ventas)
					VALUES (436
						,'Luis Valverde'
						,NULL
						,40
						,'Vendedor'
						,GETDATE()
						,(SELECT dir FROM oficinas WHERE oficina = 40)
						,1200,45);

-- 8. Subir un 5% el precio de todos los productos del fabricante QSA. 
-- (3 filas afectadas) 

-- Los productos se quedan así: 

-- idfab idproducto precio 

-- ----- ---------- ------ 

-- qsa   xk47       3,73 

-- qsa   xk48       1,41 

-- qsa   xk48a      1,55 



 

9. Poner a cero las ventas y cuota del empleado Luis Garcia, si hay varios con el 
mismo nombre actualizarlos todos. 

(1 filas afectadas) 
 

10. Cambiar los empleados de la oficina 40 a la oficina 30. 
(3 filas afectadas) 

 

11. Actualizar los pedidos del fabricante rei dejando como representante el 
empleado asignado al cliente. 

(2 filas afectadas) 

Estos son los pedidos afectados y cómo deben quedar, los pedidos en los que el 
representante ya es el correcto no se tienen que actualizar: 
codigo numpedido clie rep fab                   

------ --------- ---- --- --- 

20     113042    2113 104 rei  

21     113045    2112 108 rei  
 
IES ABASTOS - © Cristina Ausina    Actualizar datos - Ejercicios  2/4 
 

Ayuda: Intenta primero sacar la consulta que obtiene los pedidos a actualizar y 
después convertir a UPDATE. 

 

12. Actualizar el campo objetivo de la oficina 30 con las cuotas de los empleados 
asignados a ella. 

La oficina 30 se quedará con un objetivo de 2400,90€ 
 

13. Actualizar el precio de los productos de BIC obteniendo el nuevo valor del 
precio medio del artículo vendido en los pedidos (si hay pedidos). 
Estos son los productos que tenemos de BIC, precio es el precio actual, media es 
el precio medio de pedidos, y nuevo el valor que deberá quedar en precio después 
de actualizar: 

idfab idproducto precio media   nuevo 

----- ---------- ------ ------- ----- 

bic   41003        6,52 5,1566   5,16 

bic   41089        2,25 NULL     2,25 

bic   41672        1,80 NULL     1,80 
 

Ayuda: Primero intenta sacar la lista anterior y después redactar la UPDATE. 
Se puede hacer de dos formas, actualizando únicamente los productos de BIC que 
tienen pedidos, o actualizando todos los productos de BIC. 
En cualquiera de los dos casos los productos deberán acabar con el precio que 
aparece en la columna Nuevo. 

 

14. Pasar los pedidos de octubre 1989 a diciembre 2008. 
(3 filas afectadas) 
 

15. Pasar ahora los pedidos de diciembre 2008 al mes y año actual. 
(5 filas afectadas) 

 

 

16. Queremos actualizar el importe de los pedidos del mes actual con el precio 
almacenado en la tabla productos. 

 

Ayuda: En un primer paso obtener los pedidos del mes actual obteniendo también el 
precio unitario dentro del pedido y el precio del producto de la tabla de 
productos. Nota, la fecha del pedido será del mes y año actuales. 
codigo numpedido fechapedido             cant importe precio pedido precio 
------ --------- ----------------------- ---- ------- ------------- ------ 
1      110036    2010-11-12 00:00:00.000    9   22,50          2,50   NULL 
2      110037    2010-11-12 00:00:00.000    7   31,50          4,50  45,00 
6      112979    2010-11-12 00:00:00.000    6  150,00         25,00   NULL 
9      112989    2010-11-10 00:00:00.000    6   14,58          2,43   2,43 
16     113013    2010-11-28 00:00:00.000    1    6,52          6,52   5,16 
 

Actualizar después la tabla de pedidos cambiando los importes para que el precio 
unitario corresponda con el precio del producto. 

Los pedidos de los productos que no tienen precio se quedarán como estaban. 
 

(3 filas afectadas) 

Los pedidos deben quedar de la siguiente forma: 

codigo numpedido fechapedido             cant importe precio pedido precio 
------ --------- ----------------------- ---- ------- ------------- ------ 
1      110036    2010-11-12 00:00:00.000    9   22,50          2,50   NULL 
2      110037    2010-11-12 00:00:00.000    7  315,00         45,00  45,00 
6      112979    2010-11-12 00:00:00.000    6  150,00         25,00   NULL 
9      112989    2010-11-10 00:00:00.000    6   14,58          2,43   2,43 
16     113013    2010-11-28 00:00:00.000    1    5,16          5,16   5,16 
 
 
IES ABASTOS - © Cristina Ausina    Actualizar datos - Ejercicios  3/4 
17. Se ven algunos productos que no tienen precio, ahora vamos a actualizar el 
precio de estos productos con el precio medio utilizado en los pedidos donde 
aparecen. 
 

Ayuda: Primero sacamos los productos que queremos actualizar con los pedidos 
correspondientes: 
 

idfab idproducto precio codigo numpedido fechapedido              importe   precio              
                                                                            pedido 
----- ---------- ------ ------ --------- -----------------------  --------- ------ 
aci      41001    NULL   NULL  NULL      NULL                      NULL     NULL 
aci      41002    NULL   10    112992    1990-04-15 20:00:00.000    7,60     0,76 
aci      41002    NULL   18    113027    2008-02-05 00:00:00.000  450,00    8,3333 
aci      41003    NULL   15    113012    2008-05-05 00:00:00.000   37,45     1,07 
aci      41004    NULL   3     112963    2008-05-10 00:00:00.000    3,276    0,117 
aci      41004    NULL   4     112968    1990-01-11 00:00:00.000   39,78     1,17 
aci      41004    NULL   7     112983    2008-05-10 00:00:00.000    7,02     1,17 
aci      4100x    NULL   25    113055    2009-04-01 00:00:00.000    1,50     0,25 
aci      4100x    NULL   26    113057    2008-11-01 00:00:00.000   NULL     NULL 
aci      4100y    NULL   8     112987    2008-01-01 00:00:00.000  275,00    25,00 
aci      4100z    NULL   1     110036    2008-12-12 00:00:00.000   22,50     2,50 
aci      4100z    NULL   6     112979    2008-12-12 00:00:00.000  150,00    25,00 
  

Vemos que el producto ACI 41001 no se podrá actualizar porque no tiene pedidos 
Pero los demás se actualizarán con el precio medio de sus pedidos, deberán quedar 
así: 

idfab idproducto precio 

----- ---------- ------ 

aci   41001      NULL 

aci   41002       4,55 

aci   41003       1,07 

aci   41004       0,82 

aci   4100x       0,25 Tiene 2 pedidos pero uno sin precio por lo que no cuenta 
aci   4100y      25,00 

aci   4100z      13,75  
 

(7 filas afectadas) 
 

18. Eliminar el empleado 435  
 

19. Eliminar los pedidos del representante 105. 

(5 filas afectadas) 
 

20. Eliminar los pedidos del representante Luis Antonio. 
(2 filas afectadas) 

 

21. Eliminar las oficinas que no tengan empleados. 

(11 filas afectadas) 
 

22.1. Intenta eliminar el empleado 102. 
 

Te saldrá un error :”Instrucción DELETE en conflicto con la restricción...” 
 

22.2. Reflexiona sobre el error y elabora una consulta que liste los empleados que 
pueden dar problemas (aquí no se trata de utilizar operaciones aprendidas en este 
tema sino de practicar la integridad referencial y de paso recordar instrucciones 
vistas en temas anteriores). 

numemp 

------ 

101 

102 

103 
 
IES ABASTOS - © Cristina Ausina    Actualizar datos - Ejercicios  4/4 
104 

105 

106 

107 

108 

109 

110 

111 
 

(11 filas afectadas) 

  

22.3. Elabora ahora una consulta que liste los que se pueden borrar sin problemas, 
estos son: 

numemp 

----------- 

112 

113 

114 

115 

436 
 

22.4 Borra el primero de la lista anterior, éste sí lo puedes borrar. 
 

23. Eliminar los pedidos de productos de ACI cuyo precio de venta en el pedido no 
corresponda con el precio unitario del producto de la tabla de productos. 
(4 filas afectadas) 

 

24. Ahora vamos a recuperar las tablas tal cual estaban al principio, para ello 
utilizaremos las copias realizadas al principio de Nuevaoficinas, etc. 
Lo más cómodo será vaciar las tablas y rellenarlas de nuevo con los datos de las 
tablas Nueva... 

Pero como las tablas tienen claves ajenas y la tabla de pedidos un campo de 
identidad, lo tendrás que hacer de forma que no dé error. 
Al final las tablas pedidos, clientes,... deben tener los mismos datos que 
NuevaPedidos, NuevaClientes... 

 

24.1 Empieza por eliminar los datos de las tablas.  
 

Ayuda: Recuerda el campo de identidad (codigo) que tenemos en la tabla de pedidos, 
cuando insertemos las filas deberá empezar otra vez por el valor 1, para poder 
eliminar todas las filas igual tienes que eliminar algunos valores (por lo de la 
integridad referencial), hazlo siempre con SQL . 
 

24.2. Inserta los datos de las tablas Nueva.. a las tablas normales. 
 

Ayuda: Necesitarás una o varias instrucciones por cada tabla (recuerda las reglas 
de integridad referencial), en algunos casos las filas se tendrán que rellenar en 
varios pasos, y el orden en que rellenes las tablas también es importante.