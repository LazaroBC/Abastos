/*Selección de filas*/
/*1. Listar los códigos de empleado de los directores de las oficinas. */
SELECT dir FROM oficinas;
/*2. En el ejemplo anterior, si un mismo empleado dirige varias oficinas (por ejemplo el 108), 
su código aparece repetido en el resultado. Para evitarlo modifica la consulta.*/
SELECT DISTINCT dir FROM oficinas;
/*3. Si un mismo empleado dirige oficinas en varias regiones quiero que aparezca una vez con 
cada una de las regiones en las que dirige.*/
SELECT DISTINCT dir, region FROM oficinas;
/*4. Queremos el código, ciudad y ventas de las 10 mejores oficinas en cuanto a ventas. 
Pista: ordenamos las oficinas por ventas de mayor a menor y sacamos las 10 primeras. */
FROM oficinas;
/*5. En  la  instrucción  anterior  si  hay  varias  oficinas  que  tienen  las  mismas  ventas  que  la  
décima, puede que no aparezcan todas, cambia la instrucción para que sí aparezcan todas.
Con la cláusula WITH TIES sacamos los empates.*/
/*6. Queremos poder saber de forma rápida cuáles son los 5 productos de menor precio.
Aquí tenemos un problema, hay productos sin precio (precio nulo) por lo que salen primero 
estos. Pero lo que nos interesa son los cinco precios más bajos, por lo que tenemos que eliminar 
de la consulta los productos que no tienen precio. Además lo que nos interesan son los precios, 
no los productos que tienen esos precios.*/
/*7. Modifica la consulta anterior para que se solucione el problema. 
*/
/*Se  seleccionan  los  productos  con  precio  (WHERE  precio  IS  NOT  NULL),  se  ordenan  por  
precio (ORDER BY precio) y se sacan los cinco primeros (TOP 5), como nos interesan los precios 
no  los  productos  aosicados  a  estos  precio,  no  hace  falta  sacar  los  empates  (no  ponemos  WITH  
TIES).*/
/*8. Listar los “buenos” vendedores (los que han vendido más que lo que marca su cuota).*/
/*9. Hallar vendedores contratados antes de 1988.
Observa  que  en  la  primera  solución  comparo  la  fecha  del  contrato  con  una fecha  concreta  
(una constante de tipo fecha) por lo que hay que escribir la fecha entre comillas, mientras que en 
la  segunda  comparo  el  resultado  de  la  función  YEAR  (un  número)  con  un  valor  concreto  que  
también tiene que ser un número por eso no lleva las comillas. 
Es muy importante, cuando escribimos una comparación comprobar que lo que ponemos de 
cada  lado  del  operador  de  comparación  es  del  mismo  tipo  de  datos,  nos  evitará  muchos  
problemas.*/
/*10. Hallar oficinas cuyas ventas estén por debajo del 80% de su objetivo:
Recuerda que (objetivo * 80) / 100 es lo mismo que objetivo * 0.80 
Objetivo * 8 / 100 es lo mismo que objetivo * 0.08 
Base + Base * 18 / 100 es lo mismo que base * 1.18   (siempre 1 + el % que sumas) 
Base – Base * 5 /100 es lo mismo que base * 0.95      (siempre 1 – el % que descuentas) 
En  todos  estos  casos  la  segunda  opción  es  mejor  porque  involucra  una  sóla  operación  
aritmética (la multiplicación) mientras que en la primera se tiene que realizar una (una división) o 
dos más (una suma/resta y una división).*/
/*11. Hallar las oficinas dirigidas por el empleado 108:
Sacamos  dir  en  la  lista  de  selección  para  que  aparezca  en  el  resultado  y  así  poder  
comprobar  que  funciona  pero  no  es  imprescindible,  puedo  tener  el  campo  en  el  WHERE  y  no  
tenerlo en la lista de selección. */
/*12. Hallar las oficinas no dirigidas por el empleado 108:
¡Ojo  con  este  tipo  de  comparaciones!  porque  el  valor  NULL  no  cumple  la  condición  y  las  
oficinas  que  no  tienen  director  no  saldrán.  Si  queremos  que  salgan  debemos  añadir  otra  
condicón:*/
/*13. Hallar vendedores cuyas ventas estén comprendidas entre 20.000 euros y 50.000.
¡Ojo  con  el  separador  de  miles!    En  SQL  NUNCA  utilices  el  separador  de  miles  y  para  
separar la parte decimal de la parte entera utiliza SIEMPRE el punto.  
 
O bien
Esta solución es más facil de leer e interpretar.*/
/*14. Listar el código y nombre de los empleados que no estén asignados a ninguna oficina.
La oficina la sacamos para comprobar que salen los que tienen que salir.*/
/*15. Obtener los empleados que trabajan en las oficinas 11, 20 o 22:
O bien
Esta solución es más facil de leer e interpretar.*/
/*16. Obtener los empleados que NO trabajan en las oficinas 11, 20 o 22: 
¡Ojo con el operador AND! Son los empleados que no son de la 11 NI (No y) de la 12 ni de 
la 22. Cuando se combinan varias condiciones, sobre todo con negaciones (distinto es no igual) 
es facil equivocarse. 
O bien*/
/*17. Listar los vendedores asignados a alguna oficina.*/
/*18. Obtener el código y nombre de los empleados cuyo nombre empiece por An */
/*19. Lo mismo pero de los empleados cuyo nombre acabe por ez.*/
/*20. Lo mismo pero de los empleados cuyo nombre contiene on.*/
/*21. Obtiene  el  código  y  nombre  de  los  empleados  cuyo  nombre  que  empiece  por  cualquier  
letra de la a a la d
Es equivalente a escribir:*/
/*22. Listar los nombres de los empleados que no han alcanzado su cuota y cuyas ventas sean 
inferiores a 150.000€.*/
/*23. Hallar las oficinas no dirigidas por el empleado 108
Tenemos  que  añadir  la  última  condición  (OR  dis  IS  NULL)  si  queremos  que  salgan  las  
oficinas que no tienen director. Para esas oficinas la condición dir = 108 da como resultado NULL, 
por lo que NOT dir=108 da también NULL*/
