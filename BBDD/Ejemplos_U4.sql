
/* 1. Mostra en dni i l’especialitat de cada treballador */
SELECT dni, especialidad FROM empleados;
/*2. Mostra les dades dels empleats del departament «IT».*/
SELECT * FROM empleados WHERE dpto LIKE 'IT';
/*3. Mostra els treballadors que participen al projecte «MAD20»*/
SELECT nombre, codp FROM empleados WHERE codp LIKE 'MAD20';
/*4. Mostra els treballadors que NO participen al projecte «MAD20»*/
SELECT nombre, codp FROM empleados WHERE codp NOT LIKE 'MAD20' OR codp IS NULL;
/*5. Mostra els treballadors que no participen a cap projecte.*/
SELECT nombre, codp FROM empleados WHERE codp IS NULL;
/*6. Mostra els projectes treballadors del departament «IT» que participen al projecte «MAD20».*/
SELECT nombre, codp, dpto FROM empleados WHERE codp LIKE 'MAD20' AND dpto LIKE 'IT';
/*7. Mostra els projectes treballadors del departament «IT» que NO participen al projecte «MAD20».*/
SELECT nombre, codp, dpto FROM empleados WHERE (codp NOT LIKE 'MAD20' OR codp IS NULL) AND dpto LIKE 'IT';
/*8. Mostra les comandes (pedidos) entre el 12/06/2013 i el 15/06/2013.*/
SELECT * FROM Pedidos WHERE CAST( Fecha AS NVARCHAR(10)) BETWEEN '2013-06-12' AND '2013-06-15';
/*9. Mostra el nom dels proveïdors que contenen algun 8 al seu codi.*/
SELECT NombreProveedor, CodProveedor FROM Proveedores WHERE CodProveedor LIKE'%8%';
/*10. Mostra el nom i el preu dels productes EN PESSETES (el preu està en euros).*/
SELECT NombreProducto, ROUND(Precio * 166.39, 0,1) AS 'Precio en Pesetas' FROM ProductosPed;
/*11. A ProductosPedido mostra el Número, la referència i la suma de la quantitat més el doble 
del número de comanda (Sí, ja sé que no té sentit, es per practicar); anomena «Càlcul» al resultat.*/
SELECT NumPedido, RefeProducto, Cantidad + (NumPedido *2) AS 'Cálculo' FROM ProductosPedido;
/*12. Mostra el nom i el preu del producte més barat.*/
SELECT TOP 1 WITH TIES NombreProducto, Precio FROM ProductosPed ORDER BY Precio ;
/*13. Mostra el nom i el preu dels 2 productes més cars.*/
SELECT TOP 2 WITH TIES NombreProducto, Precio FROM ProductosPed ORDER BY Precio DESC;
