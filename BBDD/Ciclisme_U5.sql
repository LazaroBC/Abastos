/*Consultes BD CiclismeValora que hi ha diverses consultes que es poden resoldre amb tècniques diferents (Joins,Unions... ) 
i considera si alguna és millor a les altres.*/
/*1. Mostra una llista amb el numero de cada etapa i el nom del guanyador.*/
SELECT etapes.numero, ciclistes.nom
FROM etapes
INNER JOIN ciclistes ON etapes.ciclista = ciclistes.dorsal;

/*2. Mostra una llista amb el número de la etapa i el nom del ciclista que portava el mallot blanc 
i roig  en cada una de les etapes.*/

/*3. Mostra el nom de l’equip/s i el nom del director/s on corre el ciclista o ciclistes més jove/s.*/

/*4. Mostra el nom de tots els ports que es corren en la mateixa etapa que el port «Arcalis».*/

/*5. Mostra el nom de tots els  ciclistes de l’equip/s on corre el ciclista o ciclistes més jove/s.*/

/*6. Mostra el nom de tots els ciclistes de l’equip Banesto excepte els que han guanyat alguna etapa.*/

/*7. Mostra el nom de tots els ciclistes de l’equip banesto i que han guanyat alguna etapa.*/

/*8. Mostra totes les dades de tots els ports que es corren en la mateixa etapa que el port 
«Arcalis» excepte si els ha guanyat Pedro Delgado.*/

/*9. Mostra el nom de TOTS els ciclistes de l’equip «Banesto» i si han guanyat alguna etapa el 
número de la etapa que han guanyat (Si han guanyat diverses etapes es mostren més d’una vegada).*/

/*10.Mostra el nom dels ciclistes de l’equip «Banesto» que  no han guanyat cap etapa.*/