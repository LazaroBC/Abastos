/*Consultes BD Ciclisme*/
/*1. Mostra totes les dades del port més alt de la volta.*/

SELECT TOP 1 * 
FROM ports
ORDER BY altura DESC;

/*2. Mostra una llista amb les dades dels ports que son més alts que tots els port de l’etapa 10;*/

/*3. Mostra les dades del ciclista que ha guanyat més etapes.*/
SELECT  TOP 1 ciclistes.nom, ciclistes.dorsal, ciclistes.edat, ciclistes.equip,  COUNT(etapes.ciclista) etapas
FROM ciclistes
INNER JOIN etapes ON etapes.ciclista = ciclistes.dorsal
GROUP BY etapes.ciclista, ciclistes.nom, ciclistes.dorsal, ciclistes.edat, ciclistes.equip
ORDER BY etapas DESC;

/*4. Mostra una llista amb les dades ciclistes que corren al mateix equip que el ciclista  que ha 
guanyat més etapes.*/

/*5. Mostra una llista amb la informació dels ciclistes que corren al mateix equip que el ciclista 
que ha guanyat més etapes i que han portat algun mallot (nom dels ciclistes, la etapa i color 
del mallot que portaven).*/

/*6. Mostra les dades de l’etapa amb la major  mitja d’altura entre tots els seus ports.*/

/*7. Mostra les dades dels ciclistes (son 3) amb major edat.*/

/*8. Mostra les dades dels ciclistes amb més edat que la edat mitja de tots els ciclistes.*/

/*9. Mostra les dades dels ciclistes amb major edat de cada equip.*/

/*10. Mostra les dades dels ciclistes amb major edat que la mitja d’edat del seu equip.*/

/*11. Mostra les dades de tots els ciclistes dels equips on corren els ciclistes amb major edat (els 
de la consulta 7)*/
