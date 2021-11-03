/*1. Mostra l’altura total que es puja entre tots els ports de la volta.*/
SELECT SUM(altura) AS Total_Subido
FROM ports;

/*2. Mostra l’alçada total dels ports que es pugen en l’etapa 10.*/
SELECT SUM(altura) AS Altura_Total_Etapa_10
FROM ports
WHERE etapa = 10;

/*3. Mostra la mitja de la pendent dels ports que on ha passat primer algun ciclista de l’equip 
«Banesto».*/
SELECT AVG(altura) AS Altura_Media, ciclistes.nom
FROM ports
LEFT JOIN ciclistes ON dorsal=ciclista
WHERE equip LIKE 'Banesto' GROUP BY ciclistes.nom;

SELECT AVG(altura) AS Altura_Media, etapa
FROM ports
LEFT JOIN ciclistes ON dorsal=ciclista
WHERE equip LIKE 'Banesto' GROUP BY etapa;

/*4. Mostra el port més alt que ha guanyat algun corredor mentre portava el mallot de la 
muntanya (MMO).*/

/*5. Mostra una llista amb els guanyadors d’etapa i quantes etapes han guanyat.*/
SELECT ciclistes.nom, COUNT(etapes.ciclista) AS Cant_Etapas
FROM ciclistes
INNER JOIN etapes ON etapes.ciclista = ciclistes.dorsal
GROUP BY ciclistes.nom;
/*6. Mostra una llista amb els corredors de l’equip «Banesto» que han passat primers per algun 
port i quants ports son.*/

SELECT  COUNT(ciclistes.nom) AS Cantidad_Puertos, ciclistes.nom
FROM ciclistes
INNER JOIN ports ON ciclistes.dorsal = ports.ciclista
WHERE ciclistes.equip LIKE 'Banesto'
GROUP BY ciclistes.nom;

/*7. Mostra una llista amb els corredors que han guanyat més d’una etapa. */
SELECT etapes.ciclista
FROM ciclistes
INNER JOIN etapes ON etapes.ciclista=ciclistes.dorsal
GROUP BY etapes.ciclista
HAVING COUNT(etapes.ciclista) >1;


/*8. Mostra una llista amb les etapes on entre tots els ports es puja un total de més de 1200m.*/

SELECT  etapes.numero, SUM(ports.altura) Altura
FROM etapes
INNER JOIN ports ON etapes.numero = ports.etapa
GROUP BY etapes.numero
HAVING SUM(ports.altura) > 1200;

/*9. Mostra una llista amb TOTS els equips i el número de corredors que tenen.*/
SELECT equips.nom, COUNT(ciclistes.equip) AS CANT_Ciclistas
FROM equips
LEFT JOIN ciclistes ON ciclistes.equip = equips.nom
GROUP BY equips.nom;

/*10. Mostra una llista amb TOTS els equips i el número d’etapes que han guanyat*/