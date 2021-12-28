--1.- Vamos a seguir con el procedimiento de los ejercicios anteriores. Ahora refina el procedimiento (llama al
--nuevo procedimiento CuantosPedRep3_3) para que el valor devuelto nos permita saber si el representante
--existe o no (utilizando RETURN).
--En el ejercicio anterior el representante 200 no existe, pues en vez de responder El representante no tiene
--pedidos, sería más exacto responder El representante no existe.
--Si quieres alguna pista sobre cómo resolverlo sigue leyendo.
--Fijaremos que el procedimiento devuelve un valor imposible (por ejemplo -1) si el representante no existe.
--Inténtalo antes de ver la solución.

--2.- Ahora vamos a refinarlo más, es muy engorroso repetir por cada ejecución el IF con los diferentes PRINT
--según el caso. Así que vamos a definir un procedimiento para solucionar el problema, vamos a definir un
--nuevo procedimiento (ImprimePedRep) que nos imprima el resultado.
--Es decir vamos a crear un nuevo procedimiento que imprima el nº de pedidos de un determinado
--representante pero este procedimiento utilizará el procedimiento anterior para saber cuántos pedidos tiene el
--representante.

--3.- Redacta un procedimiento (PrecioArti4_1) que nos devuelva el precio de un determinado artículo.
--Si el producto no existe el procedimiento devolverá -1, si no tiene precio devolverá 0.

--4.- Redacta un procedimiento (DescArti4_1) que nos devuelva la descripción de un determinado artículo.

--5.- ¿Qué habría que cambiar del procedimiento anterior si la descripción admitiese valores nulos?
--Para poder probar el procedimiento tenemos que cambiar la definición de la tabla productos para permitir
--valores nulos en descripción. También tenemos que añadir un nuevo producto y no asignarle descripción.
--El nuevo procedimiento se llamará DescArti4_2.

--6.- El cliente nos pide que si el producto no tiene descripción que no aparezca nada en la descripción, y si el
--producto no existe el procedimiento debe devolver -1. DescArti4_3

--7.- Redacta un procedimiento (PrecioMensual4_1) que nos devuelva el precio medio de venta de un
--determinado artículo un determinado mes del año en curso.
--Consideraremos tres casos:
--• que tenga pedidos en el periodo indicado, en este caso el resultado será el precio medio del artículo
--• que el artículo no tenga pedidos (ninguno o ninguno en el periodo) en este caso se devolverá precio cero.
--• que el artículo no exista en este caso se devolverá -1.

--8.- Redacta un procedimiento (OficinaMayor4_1) que nos devuelva el código de la oficina que tiene más
--empleados, si hay más de una, devolverá el código mayor.

--9.- Crea un procedimiento (OficinasReg4_1) de nos devuelva cuántas oficinas se encuentran en una
--determinada región. Házlo con un parámetro de salida.

--10.- Crea un procedimiento (OficinasReg4_2) de nos devuelva cuántas oficinas se encuentran en una
--determinada región. Házlo con RETURN.