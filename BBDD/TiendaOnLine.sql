/*Consultes BD TiendaOnline*/
/*1. Mostra una llista amb TOTS els clients i el número total de compres de cada client.*/
SELECT clientes.usuario, COUNT(compras.cliente) AS [Nº Compras]
FROM clientes
INNER JOIN compras ON cliente = usuario
GROUP BY clientes.usuario;

/*2. Mostra una llista de cada compra i el total gastat  en aquesta compra*/
SELECT compras.num, SUM(precio*cantidad) Total
FROM compras
INNER JOIN lineas_compra ON compras.num= lineas_compra.n_compra
INNER JOIN productos ON productos.cod_prod = lineas_compra.cod_prod
GROUP BY compras.num;

/*3. Mostra una llista amb TOTS els clients i la quantitat total gastada per aquest client.*/
SELECT clientes.usuario, SUM(precio*cantidad) Total_Gastado
FROM clientes
INNER JOIN compras ON clientes.usuario = compras.cliente
INNER JOIN lineas_compra ON compras.num = lineas_compra.n_compra
INNER JOIN productos ON productos.cod_prod = lineas_compra.cod_prod
GROUP BY clientes.usuario;

/*4. Mostra una llista amb el nom de cada producte i el total d’unitats venudes per cada producte 
del proveïdor «LUCHER» sempre que el total d’unitat venudes supere les 3.*/
SELECT productos.nombre, SUM(lineas_compra.Cantidad) Cantidad_Comprada, proveedores.usuario
FROM productos
INNER JOIN lineas_compra ON lineas_compra.cod_prod = productos.cod_prod
INNER JOIN proveedores ON proveedores.nif = productos.proveedor
WHERE proveedores.usuario LIKE 'LUCHER' 
GROUP BY productos.nombre, proveedores.usuario
HAVING SUM(lineas_compra.Cantidad) > 3;

/*5. Mostra una llista on es puga vore quants productes ha comprat de cada tipus (cod_prod) 
cada client.*/
SELECT clientes.usuario, productos.cod_prod, SUM(lineas_compra.Cantidad) Total
FROM clientes
INNER JOIN compras ON compras.cliente = clientes.usuario
INNER JOIN lineas_compra ON lineas_compra.n_compra = compras.num
INNER JOIN productos ON productos.cod_prod = lineas_compra.cod_prod
GROUP BY  productos.cod_prod,clientes.usuario;

/*6. Mostra una llista on es puga vore la quantitat de diners gastats en cada producte per cada 
client, sempre que el client haja comprat més d’una unitat del producte.*/
SELECT productos.cod_prod, clientes.usuario, lineas_compra.Cantidad, SUM (productos.precio) AS Total
FROM productos
INNER JOIN lineas_compra ON lineas_compra.cod_prod = productos.cod_prod
INNER JOIN compras ON compras.num = lineas_compra.n_compra
INNER JOIN clientes ON clientes.usuario = compras.cliente
GROUP BY  productos.cod_prod, clientes.usuario, lineas_compra.Cantidad
HAVING lineas_compra.Cantidad > 1;

/*7. Mostra quina es la major quantitat d’unitats venudes, sumant les de totes les compres.*/
SELECT  TOP 1 productos.cod_prod, SUM(lineas_compra.Cantidad) Cantidad
FROM lineas_compra
INNER JOIN productos ON lineas_compra.cod_prod = productos.cod_prod
GROUP BY Cantidad, productos.cod_prod
ORDER BY SUM(Cantidad) DESC;

/*8. Mostra el NOM del producte amb el menor stock disponible (sense usar TOP?)*/
SELECT nombre, Stock
FROM productos
WHERE stock = (SELECT MIN(stock)FROM productos) ;