/*Consultes BD CiclismeValora que hi ha diverses consultes que es poden resoldre amb tècniques diferents (Joins,Unions... ) 
i considera si alguna és millor a les altres.*/
/*1. Mostra una llista amb el numero de cada etapa i el nom del guanyador.*/
SELECT etapes.numero, ciclistes.nom
FROM etapes
INNER JOIN ciclistes ON etapes.ciclista = ciclistes.dorsal;

/*2. Mostra una llista amb el número de la etapa i el nom del ciclista que portava el mallot blanc 
i roig  en cada una de les etapes.*/
SELECT etapes.numero, ciclistes.nom, portar.mallot
FROM etapes
INNER JOIN ciclistes ON etapes.ciclista = ciclistes.dorsal
INNER JOIN portar ON portar.ciclista = ciclistes.dorsal
WHERE portar.mallot LIKE 'MMO';

/*3. Mostra el nom de l’equip/s i el nom del director/s on corre el ciclista o ciclistes més jove/s.*/
SELECT TOP 1 WITH TIES equips.nom, equips.director, ciclistes.edat
FROM equips
INNER JOIN ciclistes ON ciclistes.equip = equips.nom
ORDER BY ciclistes.edat;

/*4. Mostra el nom de tots els ports que es corren en la mateixa etapa que el port «Arcalis».*/
SELECT ports.nom
FROM ports
INNER JOIN etapes ON etapes.numero = ports.etapa
WHERE etapes.numero = 10;

/*5. Mostra el nom de tots els  ciclistes de l’equip/s on corre el ciclista o ciclistes més jove/s.*/

/*6. Mostra el nom de tots els ciclistes de l’equip Banesto excepte els que han guanyat alguna etapa.*/
SELECT ciclistes.nom, ciclistes.equip
FROM ciclistes
LEFT JOIN etapes ON etapes.ciclista = ciclistes.dorsal
WHERE ciclistes.equip = 'Banesto' AND etapes.ciclista IS NULL;

/*7. Mostra el nom de tots els ciclistes de l’equip banesto i que han guanyat alguna etapa.*/
SELECT DISTINCT ciclistes.nom, ciclistes.equip
FROM ciclistes
INNER JOIN etapes ON ciclistes.dorsal = etapes.ciclista
WHERE ciclistes.equip = 'Banesto';

/*8. Mostra totes les dades de tots els ports que es corren en la mateixa etapa que el port 
«Arcalis» excepte si els ha guanyat Pedro Delgado.*/
SELECT  ports.*
FROM ports
INNER JOIN etapes ON etapes.numero = ports.etapa
WHERE etapes.numero = 10 AND ports.ciclista <> 2;

/*9. Mostra el nom de TOTS els ciclistes de l’equip «Banesto» i si han guanyat alguna etapa el 
número de la etapa que han guanyat (Si han guanyat diverses etapes es mostren més d’una vegada).*/
SELECT ciclistes.nom, ciclistes.equip, etapes.numero
FROM ciclistes
LEFT JOIN etapes ON etapes.ciclista = ciclistes.dorsal
WHERE ciclistes.equip = 'Banesto';

/*10.Mostra el nom dels ciclistes de l’equip «Banesto» que  no han guanyat cap etapa.*/
SELECT ciclistes.nom, ciclistes.equip, etapes.numero
FROM ciclistes
LEFT JOIN etapes ON etapes.ciclista = ciclistes.dorsal
WHERE ciclistes.equip = 'Banesto' AND etapes.numero IS NULL;