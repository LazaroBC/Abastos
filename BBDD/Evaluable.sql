/*EVALUABLE*/
/*1. Llistat amb el nom de tots els llibres que ha demanat l’usuari 'JUALOR'.*/
SELECT libros.nombre
FROM libros
INNER JOIN pide ON libros.id_libro = pide.id_libro
INNER JOIN usuarios ON pide.usuario = usuarios.usuario
WHERE usuarios.usuario LIKE 'JUALOR';

/*2. Llistat amb el nom i la data de tots els llibres demanats en l’any 2018. */
SELECT libros.nombre, pide.fecha
FROM libros
INNER JOIN pide ON pide.id_libro = libros.id_libro
WHERE YEAR(pide.fecha) = 2018;

/*3. Llistat de llibres (nom y quantitat) cedits per l’usuari 'JUAPAS'.*/
SELECT libros.nombre, cede.cantidad 
FROM libros
INNER JOIN cede ON cede.id_libro = libros.id_libro
INNER JOIN usuarios ON usuarios.usuario = cede.usuario
WHERE usuarios.usuario = 'JUAPAS'
GROUP BY libros.nombre, cede.cantidad;

/*4. Llistat d’usuaris que encara no han demanat cap llibre.*/
SELECT usuarios.usuario
FROM usuarios
LEFT JOIN pide ON pide.usuario = usuarios.usuario
WHERE usuarios.usuario <> ALL (SELECT usuario FROM pide);
SELECT usuarios.usuario FROM usuarios
ORDER BY usuario 
DESC;
SELECT pide.usuario FROM pide
ORDER BY usuario 
DESC;

/*5. Quantitat total de llibres, independentment del títol, que ha demanat cada usuari.*/
SELECT usuarios.usuario, COUNT(pide.usuario) Cantidad
FROM libros
INNER JOIN pide ON pide.id_libro = libros.id_libro
INNER JOIN usuarios ON usuarios.usuario = pide.usuario
GROUP BY usuarios.usuario, pide.usuario;

/*6. Quantitat total de llibres, independentment del títol, que ha cedit cada usuari.*/
SELECT cede.usuario, SUM(cantidad) Libros_cedidos
FROM cede 
GROUP BY usuario;

/*7. Nom i nombre d’exemplars cedits de cada llibre (només la informació de 'cede',
ignoreu els llibres de «balance» o de 'cantidad' a la taula 'libros').*/
SELECT libros.nombre, SUM(cede.cantidad) Cant_cedida
FROM libros
INNER JOIN cede ON cede.id_libro = libros.id_libro
GROUP BY libros.nombre;

/*8. Quin és el llibre/s del que s’han cedit més còpies i quantes son?*/

SELECT libros.nombre, SUM(c1.cantidad) AS Unidades
FROM libros
INNER JOIN cede c1 ON libros.id_libro = c1.id_libro
GROUP BY libros.nombre
HAVING SUM(c1.cantidad) >= ALL (SELECT SUM(c2.cantidad) FROM cede c2 GROUP BY c2.id_libro);

/* DUDA */ /*¿Por qué esta consulta no da más de un resultado?*/
SELECT TOP 1 WITH TIES libros.nombre, SUM(cede.cantidad) Cant_cedida
FROM libros
INNER JOIN cede ON cede.id_libro = libros.id_libro
GROUP BY libros.nombre
ORDER BY Cant_cedida DESC, libros.nombre; 


/*9. Quin és el llibre/s del que s’han demanat menys còpies i quantes son?*/
SELECT TOP 1 WITH TIES libros.nombre, COUNT(pide.id_libro) Pedidos
FROM libros
INNER JOIN pide ON libros.id_libro = pide.id_libro
GROUP BY libros.nombre
ORDER BY Pedidos ASC;

SELECT libros.nombre, COUNT(p1.id_libro) AS Unidades
FROM libros
INNER JOIN pide p1 ON libros.id_libro = p1.id_libro
GROUP BY libros.nombre
HAVING COUNT(p1.id_libro) <= ALL (SELECT COUNT(p2.id_libro) FROM pide p2 GROUP BY p2.id_libro);

/*10. Llistat amb el total de llibres demanats pels usuaris de cada ciutat, amb subtotals per
cada usuari i el total absolut de llibres demanats.*/

/*11. Mitja de la qualificació que donen als llibres que han demanat els usuaris de
'Valencia'.*/
/*12. Llistat amb l’usuari o usuaris que han demanat més llibres i quina es eixa quantitat.*/
/*13. Llistat d’usuaris que son de la mateixa ciutat o ciutats que l’usuari que ha cedit el
llibre 'RVJ7973'.*/
/*14. Usuari, 'id_libro' i qualificació de les persones que han demanat un llibre al que han
donat la qualificació més alta que el llibre ha rebut (no =5, la qualificació més alta del
llibre a la taula 'pide', si només en té una, podria ser inclús un 0).*/
/*15. Fes que l’usuari 'ROSIBA' haja cedit 3 còpies del llibre '1984'. Pots triar la qualificació
que li posa.*/
/*16. Actualitza TOTS els llibres sense autor per tal que pose 'Anonimo'*/
/*17. Borra les peticions de llibres de l’usuari 'LUIPAR'.*/
/*18. Actualitza el 'balance' de cada usuari restant 2 unitats a l’actual.*/
/*19. Actualitza de nou el 'balance' de cada usuari per restar-li a cadascun el nombre de
llibres que ha demanat.*/
/*20. Actualitza el 'balance' per última vegada per sumar ara la quantitat de llibres que ha
cedit (si ha cedit 3 còpies d’un mateix llibre conten com a 3, no com a 1).*/