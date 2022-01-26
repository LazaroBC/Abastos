--BASE DE DATOS cilisme

-- 1.- Mostrar el nombre de los puertos de más de 600 m de altura, el total de km de la etapa 
-- y el nombre del ciclista que ha pasado primero dicho puerto
SELECT ports.nom Nombre, etapes.kms, ciclistes.nom
FROM ports
INNER JOIN etapes ON etapes.numero = ports.etapa
INNER JOIN ciclistes ON ciclistes.dorsal = ports.ciclista 
WHERE ports.altura>600;

-- 2.- Mostrar la media de altura de los puertos de cada etapa.
SELECT ports.etapa, AVG(altura) Media
FROM ports
GROUP BY etapa;

-- 3.- Mostrar el nombre del ganador del puerto/s con menos altura.
SELECT TOP 1 WITH TIES ciclistes.nom
FROM ports
INNER JOIN ciclistes ON ciclistes.dorsal = ports.ciclista
ORDER BY ports.altura;

-- 4.- Mostrar el nombre del equipo/s que ha ganado más etapas y cuantas son.
SELECT TOP 1 WITH TIES equips.nom, COUNT(etapes.numero) Numero_Etapas
FROM etapes
INNER JOIN ciclistes ON etapes.ciclista = ciclistes.dorsal
INNER JOIN equips ON equips.nom = ciclistes.equip
GROUP BY equips.nom
ORDER BY equips.nom;

-- 5.- Nombre de los compañeros de equipo del ciclista con el mallot amarillo en la 1ª etapa.
SELECT DISTINCT nom
FROM ciclistes
LEFT JOIN portar ON ciclistes.dorsal =  portar.ciclista
WHERE ciclistes.equip = ALL (SELECT ciclistes.equip FROM ciclistes
INNER JOIN portar ON portar.ciclista = ciclistes.dorsal
WHERE portar.etapa = 1 AND portar.mallot = 'MGE');



-- 5.- Bajar la cantidad de todos los premnios del mallot a la mitad.
UPDATE mallots
SET premi = premi/2;

-- 7.- Crea un procedimiento almacenado que reciba el número de etapa y el color de un mallot 
-- y permita guardar en una variable el nombre del ciclista ganador en esa etapa.
-- USE ciclisme;
-- IF object_id('C_Ganador','P') IS NOT NULL  DROP PROC C_Ganador;
-- GO
-- CREATE PROCEDURE C_Ganador @etap INT
-- AS
-- SELECT 



-- 8.-Crea un procedimiento almacenado que muestre el premio total en metálico que ha ganado cada equipo suando un cursor. 


