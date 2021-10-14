/* ORDER BY*/
/*1.- Obtener un listado de oficinas ordenado por región.
Nota. Se añade la ciudad a la lista de selección para que el resultado sea más 'útil', define 
mejor qué oficinas salen, aquí la ciudad de la oficina actúa un poco como de nombre/descripción.*/
SELECT oficina, ciudad, region FROM oficinas ORDER BY region;
/*2.- Mostrar las ventas de cada oficina, ordenadas por orden alfabético de región y dentro de 
cada región por ciudad.*/
SELECT oficina, region, ciudad FROM oficinas ORDER BY region, ciudad;
/*3.-  Listar  las  oficinas  de  manera  que  las  oficinas  de  mayores  ventas  aparezcan  en  primer 
lugar. */
SELECT oficina, ciudad, ventas FROM oficinas ORDER BY ventas DESC;
/*4.- Listar las oficinas de modo que las de mayor superavit aparezcan las primeras.*/
SELECT oficina, ciudad, ventas-objetivo as Superavit FROM oficinas ORDER BY Superavit DESC ;
/*5.- Lo mismo que el anterior pero ahora queremos que aparezcan ordenadas dentro de cada  
región para poder saber así cuáles son las mejores dentro de cada región.
En  este  caso  hemos  utilizado  el  alias  de  columna  para  hacer  referencia  a  la  columna 
calculada  y  también  se  puede  observar  que  las  filas  aparecen  ordenadas  por  región  ascendente 
(no  hemos  incluido  nada  después  del  nombre  de  la  columna)  y  dentro  de  cada  región  por 
superávit y descendente.*/
SELECT oficina, ciudad, region,  ventas-objetivo as Superavit FROM oficinas ORDER BY region, Superavit DESC ;
/*6.- Queremos obtener un listado (director, oficina, ciudad) que nos permita saber de forma 
rápida las oficinas que dirigen los directores, para ver si tenemos directores “sobrecargados” de 
oficinas. De momento saldrán también las oficinas que no tienen director.*/
SELECT dir, oficina, ciudad FROM oficinas ORDER BY dir;
/*7.-  Salen  primero  las  oficinas  que  no  tienen  director  (el  campo  dir  es  nulo),  como  son  las 
que menos nos interesan hacemos que salgan al final.
Para que salgan al final basta con ordenar por orden descendente de director, el valor NULL 
es siempre el “menor”.*/
SELECT dir, oficina, ciudad FROM oficinas ORDER BY dir DESC;
/*8.- Queremos poder saber de forma rápida cuáles son los productos de menor precio, tienen 
que salir todos los productos.*/
SELECT * FROM productos ORDER BY precio;
/*9.- Queremos poder averiguar de forma rápida cuáles son los productos de menor precio de 
cada fabricante, tienen que salir todos los productos.*/
SELECT * FROM productos ORDER BY precio, idfab;
/*10.- Lo mismo pero ahora nos interesan los de mayor precio. */
SELECT * FROM productos ORDER BY precio DESC, idfab;