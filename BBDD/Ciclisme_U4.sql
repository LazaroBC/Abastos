/*1. Mostra les dades de tots els ciclistes de la competició.*/
SELECT * FROM ciclistes;

/*2. Mostra el dorsal i el nom de tots els ciclistes de l’equip «Kelme».*/
SELECT dorsal, nom 
FROM ciclistes
WHERE equip LIKE 'Kelme';

SELECT dorsal, nom, equip
FROM ciclistes
WHERE equip LIKE 'Kelme';

/*3. Mostra el nom i la edat dels ciclistes de l’equip «Kelme» majors de 30 anys.*/
SELECT nom, edat
FROM ciclistes
WHERE equip LIKE 'Kelme' AND edat > 30;

/*4. Mostra el nom dels ports ordenats pel nombre d’etapa en el que es pugen.*/
SELECT nom, etapa
FROM dbo.ports
ORDER BY etapa;

/*5. Mostra el nom dels ports de 1ª categoria ordenats pel nombre d’etapa en el que es pugen.*/
SELECT nom, categoria + 'ª' AS Categoría, etapa
FROM dbo.ports
WHERE categoria LIKE '1' ORDER BY etapa;

/*6. Mostra les dades de «portar» ordenades per mallot i per etapa.*/
SELECT *
FROM portar
ORDER BY mallot, etapa;

/*7. Mostra el tipus,color i premi EN EUROS (està en pessetes) de cada mallot.*/
SELECT tipus, color,FORMAT(premi/166.3860,'N2') AS premi
FROM mallots;

/*8. Mostra el nom dels ports i l’altura en kilòmetres (està guardada en metres).*/
SELECT nom, CONVERT(FLOAT,altura)/1000
FROM dbo.ports;

/*9. Mostra l’etapa i els km de les etapes entre 30 i 150 km.*/
SELECT numero AS etapa, kms
FROM etapes
WHERE kms>=30 and kms <=150;
/*10. Mostra els ciclistes que NO són de l’equip «Kelme» ni del «Banesto».*/
SELECT *
FROM ciclistes
WHERE equip <> 'Kelme' AND equip <>'Banesto';

/*11. Mostra el nom dels ciclistes que comencen per «Al».*/
SELECT nom 
FROM ciclistes
WHERE nom LIKE 'Al%';
/*12. Mostra el nom dels ciclistes que comencen per «Al» però no siguen  «Zulle».*/
SELECT nom 
FROM ciclistes
WHERE nom LIKE 'Al%' AND nom NOT LIKE '%Zulle';

/*13. Mostra el nom i l’altura dels 3 ports més alts.*/
SELECT TOP 3 WITH TIES nom, altura
FROM ciclisme.dbo.ports
ORDER BY altura;









 