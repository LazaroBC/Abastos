/*Consultes BD TiendaOnline*/
/*1. Llistat dels clients que no han comprat res encara.*/
SELECT clientes.usuario
    FROM clientes
        WHERE clientes.usuario  NOT IN (SELECT compras.cliente
                                        FROM compras);
/*2. Dades de la compra més barata.*/
SELECT TOP 1 lineas_compra.n_compra AS CompraMásBarata, SUM(lineas_compra.Cantidad * productos.precio) AS Total_Compra
FROM lineas_compra
INNER JOIN productos ON productos.cod_prod = lineas_compra.cod_prod
GROUP BY lineas_compra.n_compra
ORDER BY Total_Compra;
/*3. Mitja de la nombra de compres (simplement del número de compres que tenen a la taula, no 
importen les línies de la compra o unitats dels productes) que fan els clients de «Valencia».*/

/*4. Nom del producte més venut i total d’unitats venudes.*/

/*5. Dades dels clients que han comprat algun producte del/s mateix/os proveïdor/s que el client 
«JUAPAS». Es a dir els clients que tenen compres de productes d’algún proveïdor de la 
llista de proveïdors que apareixen a les compres del client «JUAPAS».*/