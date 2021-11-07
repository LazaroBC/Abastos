/*Consultes BD Exemples*/
/*1. Mostra el nombre total de treballadors.*/
SELECT COUNT(nombre) AS Empleado
FROM empleados;
/*2. Mostra el nombre total de treballadors que tenen algun projecte assignat*/
SELECT COUNT(codp)
FROM empleados;
/*3. Mostra el nombre de treballadors de cada projecte*/
SELECT empleados.nombre, proyectos.nombre
FROM empleados
INNER JOIN proyectos ON empleados.codp = proyectos.codproy;
/*4. Mostra la mitja de la quantitat demanada a cada comanda(pedido) de ProductosPedido.*/
SELECT numpedido, AVG(cantidad) Media
FROM ProductosPedido
GROUP BY NumPedido;
/*5. Mostra la suma dels preus totals de les files (fet a la unitat anterior) de cada comanda de 
ProductosPedido. Es a dir, el preu total de cada compra.*/
SELECT Numpedido, SUM(Precio*Cantidad) AS Precio_Total
FROM ProductosPedido
INNER JOIN ProductosPed ON ProductosPed.RefeProducto= ProductosPedido.RefeProducto
GROUP BY NumPedido;
/*6. Mostra les compres on el preu total és major de 150 €.*/
SELECT Numpedido, SUM(ProductosPed.Precio*ProductosPedido.Cantidad) AS Precio_Total
FROM ProductosPedido
INNER JOIN ProductosPed ON ProductosPed.RefeProducto= ProductosPedido.RefeProducto
GROUP BY NumPedido
HAVING SUM(Precio*Cantidad) < 1000;
/*7. Mostra el total de diners gastats en cada proveïdor excepte «CARMELO DIAZ S.L.».*/
/*8. Mostra una llista amb TOTS els productes i la menor quantitat d’unitats comprades de 
cadascun en alguna de les comandes.*/