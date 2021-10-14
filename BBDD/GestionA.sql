/*Ejercicios sobre la Base de Datos GestionA*/
USE GestionA;
/*1- Escribe 3 sentencias equivalentes para obtener todos los datos de la tabla Productos. */
SELECT * FROM productos;
SELECT idfab, idproducto,descripcion, precio, existencias FROM productos;
SELECT productos.* FROM productos;
/*2.-  Listar  nombres,  oficinas  (código  de  la  oficina),  y  fechas  de  contrato  de  todos  los  empleados*/
SELECT  nombre, oficina, contrato FROM empleados;
/*3.- Cambia la consulta para que aparezca en el encabezado: Empleado | oficina | Fecha de contrato.*/
SELECT  nombre AS Empleado, oficina Oficina, contrato 'Fecha de contrato' FROM empleados;
/*4.- Listar una tarifa de productos, la tarifa es un listado donde aparece el código, nombre y precio de los productos, 
recuerda que el código del producto está formado por dos campos.*/
SELECT  idproducto, descripcion, precio FROM productos;
/*5.-  Cambia  la  consulta  anterior  para  que  aparezca  una  sóla  columna  para  el  código  del  
producto y en esta columna aparecerá el idfab e idproducto juntos.*/
SELECT  idfab + idproducto AS codigo , descripcion, precio FROM productos;
/*6.- Cambia la consulta anterior para que ahora en la columna Codigo aparezca el código del 
producto de la forma ACI – 41003 (el idfab e idproducto separados por un guión).*/
SELECT  idfab + '-' + idproducto AS codigo , descripcion, precio FROM productos;
/*7.-  Listar  la  ciudad,  región  y  el  superávit  de  cada  oficina.  El  superávit  es  el  volumen  de  
ventas  que  se  encuentran  por  encima  o  por  debajo  del  objetivo  de  la  oficina.  Si  la  oficina  ha  
vendido más que su objetivo el superavit será positivo, si ha vendido menos será negativo.*/
SELECT  ciudad, region, ventas-objetivo AS Superavit FROM oficinas;
/*8.- De cada producto queremos saber el id de fabricante, id de producto, su descripción, sus 
existencias  (unidades  en  el  almacen),  su  precio  y  el  valor  de  sus  existencias  (las  existencias  
convertidas a euros).*/
SELECT  idfab as Fabricante, idproducto Producto, descripcion, existencias, precio, (existencias * precio) Valor FROM productos;
/*9.- El precio que aparece en la tabla productos no lleva el IVA incluido, lista los productos 
añadiendo  una  columna  que  sea  Precio  Con  IVA,  todos  nuestros  productos  tienen  un  IVA  del  
18%. Limítate a obtener el valor, luego en los ejercicios posteriores lo dejaremos “bonito”. */
SELECT  idfab as Fabricante, idproducto Producto, descripcion, existencias, precio,  (precio + (precio*0.18)) AS 'Precio con IVA' FROM productos;
/*10.-  En  la  consulta  anterior  el  precio  con  IV A  aparece  con  muchos  decimales,  modifica  la  
consulta para que aparezca redondeado a 2 decimales. Lo mismo de antes, haz que salga el valor 
redondeado sin preocuparte del formato.*/
SELECT  idfab as Fabricante, idproducto Producto, descripcion, existencias, precio, ROUND((precio + (precio*0.18)),2) AS 'Precio con IVA' FROM productos;
/*11.-  En  la  consulta  anterior  el  precio  con  IVA  ya  aparece  redondeado  pero  siguen  los  
muchos  decimales,  lo  tenemos  que  formatear.  Para  formatear  número  lo  mejor  es  utilizar  la  
función STR que además (si lo queremos) redondea.
Entonces, si la función STR me permite redondear y dejarlo más bonito, ¿para qué utilizar 
ROUND? 
La función STR convierte el resultado a cadena (valor alfanumérico), mientras que ROUND 
sigue dando un número, lo verás con el siguiente ejemplo. */
SELECT  idfab as Fabricante, idproducto Producto, descripcion, existencias, precio, STR((precio + (precio*0.18)),10,2) AS 'Precio con IVA' FROM productos;
/*12.- Añade a la consulta anterior la valoración de las existencias pero ahora cogiendo como 
precio el precio con IVA.*/
SELECT  idfab as Fabricante, idproducto Producto, descripcion, existencias, precio, STR((precio + (precio*0.18)),10,2) AS 'Precio con IVA', STR(existencias *(precio + (precio*0.18)),10,2) AS 'Valor con IVA' FROM productos;
/*13.- Listar el nombre, mes y año de contrato de cada empleado (quiero el mes y el año en 
columnas separadas con los encabezados Mes de contrato y Año de contrato).*/
SELECT nombre, MONTH(contrato) AS Mes, YEAR(contrato) AS Año FROM empleados;
/*14.- De cada empleado quiero su código, nombre, fecha de contrato y la fecha de hoy.*/
SELECT numemp AS Código, nombre, contrato AS 'Fecha Contrato', GETDATE() AS 'Fecha de hoy' FROM empleados;
/*15.- Quiero que ahora las fechas aparezcan sin la hora, la fecha de contrato con el año de 4 
dígitos, y la fecha de hoy con 2 dígitos para el año.*/
SELECT numemp AS Código, nombre, CONVERT(varchar,contrato, 101) AS 'Fecha Contrato', CONVERT(varchar,GETDATE(),3) AS 'Fecha de hoy' FROM empleados;
/*16.- Añade a la consulta anterior el número de días trabajados.
Puedes practicar con las funciones de fechas.*/
SELECT numemp AS Código, nombre, CONVERT(varchar,contrato, 101) AS 'Fecha Contrato', CONVERT(varchar,GETDATE(),3) AS 'Fecha de hoy', DATEDIFF(DAY,contrato, GETDATE()) AS 'Días Trabajados' FROM empleados;
/*17.-  Listar  las  ventas  de  cada  oficina  con  el  formato:  22  tiene  ventas  de  186,042.00  €  
Tienen que aparecer 3 columnas. 
Cuando  no  queremos  que  aparezca  nada  en  el  encabezado  rellenamos  los  corchetes  con  
blancos. 
Aparece  siempre  en  el  resultado  tantas  columnas  como  términos  (separados  por  comas)  
aparezcan en la lista de selección. */
SELECT oficina, 'Tiene ventas de' AS [ ], ventas FROM oficinas;
SELECT oficina, 'Tiene ventas de' AS [ Tiene ventas de ], ventas FROM oficinas;
/*18.- Rectifica el ejercicio anterior para que el literal aparezca en la primera columna. Sólo 
tendremos dos columnas. 
Pista:  Ojo  la  columna  oficina  es  de  tipo  numérico,  luego  nos  dará  problemas  en  la  
concatenación.
Si intentamos concatenar oficina + ' tiene ventas de '  nos sale el siguiente error: 
 “Error de conversión al convertir el valor varchar ' tiene ventas de ' al tipo de datos int”. 
Según nos dice ha intentado convertir ' tiene ventas de ' al tipo int ¿Por qué? 
Se  ha  encontrado  un  campo  entero  (oficina)  seguido  de  +  ,  luego  entiende  que  tiene  que  
sumar oficina a lo que viene detrás ‘tiene ventas de’ como no es entero lo intenta convertir para 
hacer la suma y claro, da error.  
Esto  nos  indica  que  tenemos  que  hacer  que  oficina  sea  una  cadena  para  que  pueda  
concatenar, para ello utilizamos la función STR() que convierte números a alfanuméricos. 
Recuerda que tienes que aprender a interpretar los mensajes de error.*/
SELECT STR(oficina) + 'Tiene ventas de' AS [ ], ventas FROM oficinas;
