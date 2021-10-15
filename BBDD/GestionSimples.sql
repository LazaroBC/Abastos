/*3. Obtener los datos de los empleados.*/
SELECT * FROM empleados;
/*4. Listar de cada empleado su código, nombre, oficina, y fecha de contrato (fecha corta).*/
SELECT numemp, nombre, oficina, DATEPART(contrato,dmyy) FROM  empleados;
/*5. Listar de cada pedido, su número, código completo del artículo vendido y precio unitario al que se ha vendido (precio sin redondear).*/

/*6. Lo mismo que la anterior pero con precios redondeados.*/

/*7. Obtener una lista de productos por fabricante.*/

/*8. De cada producto queremos saber el id de fabricante, id de producto, su descripción y el valor de sus existencias.*/

/*9. Listar los empleados indicando código, nombre y día de la semana en que fue contratado.*/

/*10. Listar de cada empleado su código, nombre y título (sustituir la abreviatura dir por la palabra completa Director). */

/*11. Listar los datos de los empleados que no tienen oficina asignada*/

/*12. Listar los códigos de las oficinas que tienen empleados asignados.*/

/*13. Listar las oficinas de manera que las oficinas de mayores ventas aparezcan en primer lugar.*/

/*14. Listar de cada región las oficinas por orden de mejores ventas.*/

/*15. Listar de cada jefe su código y el código y nombre de sus subordinados ordenados por nombres*/

/*16. ¿En qué ciudades tenemos oficinas? */

/*17. Queremos saber el código del empleado(s) que ha realizado el pedido más caro. */

/*18. Listar las 3 mejores oficinas en cuanto a ventas.*/

/*19. Listar las 2 peores oficinas en cuanto a ventas.*/

/*20. Obtener la mejor oficina en cuanto a ventas teniendo en cuenta su objetivo, puede tener menos ventas pero que supongan un mayor porcentaje del objetivo.*/

/*21. Queremos saber los productos que tienen un precio superior o igual al precio de la mitad de los productos.*/

/*22. Listar las oficinas que han alcanzado su objetivo. */

/*23. Listar los pedidos con fechas erróneas (una fecha posterior a hoy). 
 NOTA: El resultado puede variar según la fecha en que se ejecuta la instrucción. Debería incluir la fila que has añadido al principio.*/

/*24. Listar los pedidos anteriores a 2008.*/

/*25. Listar los pedidos de este año (el año en que estamos). 
NOTA: El resultado puede variar según la fecha en que se ejecuta la instrucción. Debería incluir la fila que has añadido al principio.*/

/*26. Listar las oficinas cuyas ventas no alcanzan el 50% de su objetivo.*/

/*27.Hallar las oficinas dirigidas por el empleado 108.*/

/*28. Listar los empleados que no tienen ventas.*/

/*29. Listar los empleados que tienen ventas pero que no han alcanzado su cuota. */

/*30. Hallar los empleados a cargo del empleado 106*/

/*31. Hallar los empleados que no están a cargo del empleado 106*/

/*32. Listar las oficinas con ventas comprendidas entre 16.000 euros y 40.000. */

/*33. Listar los empleados que trabajan en las oficinas 11, 12 o 13.*/

/*34. Listar todos los nombres de empleados que empiecen por ju */

/*35. Listar los nombres de empleados que acaban en z.*/

/*36. Listar los empleados cuyo nombre contiene on.*/

/*37. Listar los empleados cuyo nombre tiene una u como segunda letra.*/

/*38. Listar los empleados cuyo nombre empieza por cualquier letra de la a a la k.*/

/*39. Listar los empleados cuyo nombre empieza por J*/

/*40. Listar los empleados cuyo nombre no empieza por J*/

/*41. Listar de cada empleado su código, nombre y título (si el título es representante deberá aparecer comercial y si es director general deberá aparecer Gerente). */

/*42. Lo mismo que la anterior pero cambiando el orden de las columnas, colocando la columna de título la primera y ordenando por ella.*/

/*43. Listar código, ciudad y región de cada oficina, si la oficina no tiene región deberá aparecer el texto "No tiene".*/

/*44. Listar código, nombre y oficina de cada empleado, si el empleado no tiene oficina deberá aparecer el texto "No tiene".*/
