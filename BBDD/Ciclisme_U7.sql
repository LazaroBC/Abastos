/*Consultes BD Ciclisme*/
/*1. Mostra totes les dades del port més alt de la volta.*/

SELECT TOP 1 * 
FROM ports
ORDER BY altura DESC;

/*2. Mostra una llista amb les dades dels ports que son més alts que tots els port de l’etapa 10;*/
SELECT  p1.*
FROM ports p1
WHERE p1.altura > ALL (SELECT altura FROM ports p2 WHERE p2.etapa = 10);


/*3. Mostra les dades del ciclista que ha guanyat més etapes.*/
SELECT  TOP 1 ciclistes.nom, ciclistes.dorsal, ciclistes.edat, ciclistes.equip,  COUNT(etapes.ciclista) etapas
FROM ciclistes
INNER JOIN etapes ON etapes.ciclista = ciclistes.dorsal
GROUP BY etapes.ciclista, ciclistes.nom, ciclistes.dorsal, ciclistes.edat, ciclistes.equip
ORDER BY etapas DESC;

/*4. Mostra una llista amb les dades ciclistes que corren al mateix equip que el ciclista  que ha 
guanyat més etapes.*/
SELECT ciclistes.*
FROM ciclistes
INNER JOIN equips ON ciclistes.equip  = equips.nom
INNER JOIN etapes ON etapes.ciclista = ciclistes.dorsal 
WHERE EXISTS (SELECT TOP 1 count(etapes.ciclista) 
                            FROM etapes
                            GROUP BY etapes.ciclista) 
;
/*5. Mostra una llista amb la informació dels ciclistes que corren al mateix equip que el ciclista 
que ha guanyat més etapes i que han portat algun mallot (nom dels ciclistes, la etapa i color 
del mallot que portaven).*/
SELECT DISTINCT ciclistes.nom, portar.etapa, portar.mallot, ciclistes.equip
FROM ciclistes
INNER JOIN equips ON ciclistes.equip  = equips.nom
INNER JOIN etapes ON etapes.ciclista = ciclistes.dorsal
INNER JOIN portar ON ciclistes.dorsal = portar.ciclista
WHERE EXISTS (SELECT TOP 1 count(etapes.ciclista) 
                            FROM etapes
                            GROUP BY etapes.ciclista)  AND ciclistes.equip ='Banesto';

/*6. Mostra les dades de l’etapa amb la major  mitja d’altura entre tots els seus ports.*/
SELECT etapes.*, Media
FROM
(SELECT etapa, AVG(ports.altura) AS Media
FROM ports
GROUP BY etapa) AS medias
INNER JOIN etapes ON etapes.numero = medias.etapa
WHERE Media >= ALL (SELECT AVG(ports.altura)
FROM ports
GROUP BY etapa);

/*7. Mostra les dades dels ciclistes (son 3) amb major edat.*/
SELECT TOP 1 WITH TIES ciclistes.*
FROM ciclistes
ORDER BY ciclistes.edat DESC;

/*8. Mostra les dades dels ciclistes amb més edat que la edat mitja de tots els ciclistes.*/
SELECT ciclistes.nom, ciclistes.equip, edat
FROM ciclistes
WHERE ciclistes.edat > ALL (SELECT  AVG(ciclistes.edat) 
							FROM ciclistes)
GROUP BY  ciclistes.equip, ciclistes.nom, edat;

/*9. Mostra les dades dels ciclistes amb major edat de cada equip.*/
SELECT c1.nom, c1.equip, edat
FROM ciclistes c1
WHERE c1.edat >= ALL (SELECT MAX(c2.edat) 
							FROM ciclistes c2
							WHERE c2.equip = c1.equip)
GROUP BY  c1.equip, c1.nom, edat;


/*10. Mostra les dades dels ciclistes amb major edat que la mitja d’edat del seu equip.*/


/*11. Mostra les dades de tots els ciclistes dels equips on corren els ciclistes amb major edat (els 
de la consulta 7)*/

SELECT *
FROM ciclistes 
WHERE equip IN (SELECT equip
FROM ciclistes
WHERE edat >= ALL (SELECT edat FROM ciclistes));

