/*Ejercicios de Consultas de resumen 
Si en la tabla de pedidos no tienes el pedido de codigo 31, copia el pedido de código 13 cambiando los 
valores de código (pon 31), numpedido (pon 113070), fechapedido (pon una fecha posterior al día en que 
estás.  
1.  ¿Cuál es la cuota media y las ventas medias de los empleados?
Cuota media           Ventas medias 

--------------------- --------------------- 

22750,00              33846,1538 
 

Advertencia: valor NULL eliminado por el agregado u otra operación SET. 
 

Nota:El mensaje de advertencia que aparece es debido a que en las columnas hay valores nulos y nos 
advierte de que no se han tenido en cuenta, en lo sucesivo no se indicará la advertencia en el 
resultado a obtener aunque sí aparezca cuando se ejecute la consulta.
*/

/* 1.2 Modificar la consulta para que el resultado sea este: 
Cuota media           Ventas medias 

--------------------- --------------------- 

22750,00              33846,15
*/

/*2. ¿De media, cuánto superávit obtienen los empleados,  considerando superávit  la diferencia entre lo 
vendido y su cuota? 
Superávit medio 

--------------------- 

13283,3333
*/
/*3.  ¿Cuál es el total de cuotas y total de ventas de todos los empleados? 
Total cuotas          Total ventas 

--------------------- --------------------- 

273000,00             440000,00
*/
/*4. ¿Cuántas oficinas tenemos en Valencia? 
Valencianas 

----------- 

4 
*/

/*5. ¿Cuántas oficinas tienen empleados? 
Oficinas con empleados 

---------------------- 

5
*/

/*6. ¿Cuántos empleados  superan su cuota (tienen superávit positivo)? 
Empleados buenos 

---------------- 

9
*/

/*7. ¿Cuántas oficinas  tienen empleados que superan su cuota (tienen superávit positivo)? 
Oficinas buenas 

--------------- 
4
*/

/*8. ¿ Cuál es el importe total de los pedidos realizados por el empleado Luis Antonio? 
Importe vendido 

--------------------- 

46,08
*/

/*9. Hallar el precio medio de los productos del fabricante ACI. 
precio medio 

--------------------- 

NULL

Nota: Observamos que cuando todos los precios son nulos, el resultado es nulo.
*/

/*9.2 Repetir la consulta para el fabricante Bic. 
precio medio 

--------------------- 

3,5233
*/

/*10. Calcular el importe medio de los pedidos realizados por el cliente 2103. 
importe medio 

--------------------- 

183,824 
*/

/*11. ¿Entre qué cuotas se mueven los empleados? 
Cuota mínima          Cuota máxima 

--------------------- --------------------- 

3000,00
*/

/*12. Hallar en qué fecha se realizó el primer pedido. 
Primer pedido 

------------- 

04/07/1989
*/

/*13. Hallar el mejor superávit  de todos los empleados. 
Mejor superavit 

--------------------- 

81000,00
*/

/*14. Hallar cuántos pedidos hay de más de 250 euros. 
Superiores a 250 

---------------- 

4
*/

/*15. ¿Cuántos títulos de empleados se usan? 
Cuántos títulos 

--------------- 

3*/

/*17. Hallar el importe medio de pedidos realizados por cada empleado.
rep         Importe medio 

----------- --------------------- 

101         88,76 
102         25,92 
103         21,00 
105         154,5492 
106         23,04 
107         114,7733 
108         40,9042 
109         42,4333 
110         159,6066
*/

/*18. Repetir la consulta pero para que también salgan los empleados que no han vendido nada. 
numemp      Importe medio 

----------- --------------------- 

101         88,76
102         25,92
103         21,00
104         NULL 
105         154,5492
106         23,04 
107         114,7733
108         40,9042 
109         42,4333 
110         159,6066 
111         NULL 
112         NULL 
113         NULL 
114         NULL
*/

/*19. ¿ Cuál es en cada una de las oficinas, el rango de cuotas asignadas a sus empleados?.  
oficina     Cuota mínima          Cuota máxima 

----------- --------------------- --------------------- 
11          27500,00              27500,00 
12          20000,00              30000,00 
13          35000,00              40000,00 
21          10000,00              35000,00 
22          30000,00              30000,00 
23          NULL                  NULL 
24          NULL                  NULL 
25          NULL                  NULL 
26          NULL                  NULL 
27          NULL                  NULL 
28          NULL                  NULL 
29          NULL                  NULL 
30          NULL                  NULL 
31          NULL                  NULL
*/

/*20. Listar cuántos empleados  están asignados a cada oficina, incluso las que no tienen. 
oficina     Empleados 

----------- ----------- 

11          1 
12          3 
13          2 
21          3 
22          1 
23          0 
24          0 
25          0 
26          0 
27          0 
28          0 
29          0 
30          0 
31          0 
*/

/*21. Listar cuántos clientes son atendidos por cada empleado (el cliente ha realizado un pedido con él). 
rep         Clientes atendidos 

----------- ------------------ 

101         3
102         2
103         1
105         2
106         2
107         2
108         3
109         1
110         2
*/

/*22. De cada empleado  (todos) queremos saber su nombre y el  importe total vendido. 
numemp      nombre               Importe vendido 

----------- -------------------- --------------------- 
101         Antonio Viguer       266,28 
102         Alvaro Jaumes        77,76 
103         Juan Rovira          21,00 
104         José González        NULL 
105         Vicente Pantalla     772,746
106         Luis Antonio         46,08 
107         Jorge Gutiérrez      344,32 
108         Ana Bustamante       286,33 
109         María Sunta          127,30 
110         Juan Victor          478,82 
111         Juan Gris            NULL 
112         Julián Martorell     NULL 
113         Juan Gris            NULL 
114         Pablo Moreno         NULL
*/
/*22.2 Rectificar la consulta para que no aparezca la palabra NULL 
numemp      nombre               Importe vendido 

----------- -------------------- --------------------- 
101         Antonio Viguer       266,28 
102         Alvaro Jaumes        77,76 
103         Juan Rovira          21,00 
104         José González        0,00 
105         Vicente Pantalla     772,746
106         Luis Antonio         46,08 
107         Jorge Gutiérrez      344,32 
108         Ana Bustamante       286,33 
109         María Sunta          127,30 
110         Juan Victor          478,82 
111         Juan Gris            0,00 
112         Julián Martorell     0,00 
113         Juan Gris            0,00 
114         Pablo Moreno         0,00 
*/
/*23. Para cada empleado  cuyos pedidos suman más de 300 euros, hallar el importe medio vendido. 
rep         Importe medio 

----------- --------------------- 

105         154,5492 

107         114,7733 

110         159,6066 
*/

/*23.2. Rectifica la consulta para que aparezca también el nombre del  empleado. 
 rep         nombre               Importe medio 
----------- -------------------- --------------------- 
105         Vicente Pantalla     154,5492 

107         Jorge Gutiérrez      114,7733 

110         Juan Victor          159,6066 
*/

/*24.  Por cada oficina con 2 o más personas, calcula la cuota total y las ventas totales  de todos los 
empleados que trabajan en la oficina, de la oficina queremos el número y la ciudad. 
oficina     ciudad               Cuota total           ventas 
----------- -------------------- --------------------- --------------------- 
12          Alicante             77500,00              73400,00 
21          Badajoz              80000,00              143500,00*/

/*25. De cada empleado, obtener el importe vendido a cada cliente. 
rep         Cliente     Importe vendido 

----------- ----------- --------------------- 

106         2101        14,58 
101         2102        39,78 
105         2103        735,296 
102         2106        40,26 
110         2107        28,82 
101         2108        1,50 
109         2108        127,30 
107         2109        313,50 
103         2111        21,00 
105         2111        37,45 
108         2112        29,25 
110         2112        450,00 
101         2113        225,00 
108         2114        221,00 
106         2117        31,50 
108         2118        36,08 
102         2120        37,50 
107         2124        30,82
*/

/*26. Repetir la consulta anterior pero ahora deben aparecer también los empleados que no han vendido 
nada.  
numemp      clie        Importe vendido 

----------- ----------- --------------------- 

101         2102        39,78 
101         2108        1,50 
101         2113        225,00 
102         2106        40,26 
102         2120        37,50 
103         2111        21,00 
104         NULL        NULL 
105         2103        735,296 
105         2111        37,45 
106         2101        14,58 
106         2117        31,50 
107         2109        313,50 
107         2124        30,82 
108         2112        29,25 
108         2114        221,00 
108         2118        36,08 
109         2108        127,30 
110         2107        28,82 
110         2112        450,00 
111         NULL        NULL 
112         NULL        NULL 
113         NULL        NULL 
114         NULL        NULL
*/

/*27. Repetir la consulta pero ahora debe aparecer también el total de cuánto ha vendido cada empleado. 
numemp      clie        Importe vendido 

----------- ----------- --------------------- 

NULL        NULL        2420,636 
101         NULL        266,28 
101         2102        39,78
101         2108        1,50 
101         2113        225,00
102         NULL        77,76 
102         2106        40,26 
102         2120        37,50 
103         NULL        21,00 
103         2111        21,00 
104         NULL        NULL 
104         NULL        NULL 
105         NULL        772,746 
105         2103        735,296 
105         2111        37,45 
106         NULL        46,08 
106         2101        14,58 
106         2117        31,50 
107         NULL        344,32 
107         2109        313,50 
107         2124        30,82 
108         NULL        286,33 
108         2112        29,25 
108         2114        221,00 
108         2118        36,08 
109         NULL        127,30 
109         2108        127,30 
110         NULL        478,82
110         2107        28,82 
110         2112        450,00 
111         NULL        NULL 
111         NULL        NULL 
112         NULL        NULL 
112         NULL        NULL 
113         NULL        NULL 
113         NULL        NULL 
114         NULL        NULL 
114         NULL        NULL 
*/

/*27.2. En los resultados anteriores no se distinguen bien las líneas que corresponden a totales. Modificar la 
consulta para obtener este resultado:  
numemp      clie        Importe vendido       Agrupa clie Agrupa numemp 
----------- ----------- --------------------- ----------- ------------- 
NULL        NULL        2420,636           1 

101         NULL        266,28                1           0 
101         2102        39,78                 0           0 
101         2108        1,50                  0           0 
101         2113        225,00                0           0 
102         NULL        77,76                 1           0 
102         2106        40,26                 0           0 
102         2120        37,50                 0           0 
103         NULL        21,00                 1           0 
103         2111        21,00                 0           0 
104         NULL        NULL                  0           0 
104         NULL        NULL                  1           0 
... Siguen más filas que no hemos  incluido para acortar.
*/

/*27.3. Ahora modifica la consulta para que las filas de totales aparezcan más claras: 
numemp      clie        Importe vendido       Agrupa clie    Agrupa numemp 
----------- ----------- --------------------- -------------- ------------- 
NULL        NULL        2420,636              Total empleado Total Final 
101         NULL        266,28                Total empleado   
101         2102        39,78                                  
101         2108        1,50                                   
101         2113        225,00                                 
102         NULL        77,76                 Total empleado   
102         2106        40,26                                  
102         2120        37,50                                  
103         NULL        21,00                 Total empleado   
103         2111        21,00                                  
104         NULL        NULL                                   
104         NULL        NULL                  Total empleado   
...  

Nota: Recuerda la función CASE 
*/

/*27.4. Ahora coloca las columnas Agrupa delante de las demás columnas: 
Agrupa numemp Agrupa clie    numemp      clie        Importe vendido 
------------- -------------- ----------- ----------- --------------------- 
Total Final   Total empleado NULL        NULL        2420,636 
              Total empleado 101         NULL        266,28 
                             101         2102        39,78 
                             101         2108        1,50 
                             101         2113        225,00 
              Total empleado 102         NULL        77,76 
                             102         2106        40,26 
                             102         2120        37,50 
              Total empleado 103         NULL        21,00 
                             103         2111        21,00
                             104         NULL        NULL 
              Total empleado 104         NULL        NULL 
..
*/

/*27.5. Ahora queremos que “Total empleado” aparezca en la columna clie: 
Agrupa numemp numemp      clie           Importe vendido 
------------- ----------- -------------- --------------------- 
Total Final   NULL        Total empleado 2420,636 
              101         Total empleado 266,28 
              101         2102           39,78 
              101         2108           1,50 
              101         2113           225,00 
              102         Total empleado 77,76 
              102         2106           40,26 
              102         2120           37,50 
              103         Total empleado 21,00 
              103         2111           21,00 
              104         NULL           NULL 
              104         Total empleado NULL 
... 

Nota: Piensa primero en cuántas columnas quieres y luego en cada columna qué tiene que salir. 
*/

/*27.6 El empleado 104 (y otros) no ha vendido a nadie y por eso sale en la columna clie la palabra NULL, 
queremos que en estos casos no aparezca nada (se deje en blanco), y el importe si es NULL que salga un 
cero. 
Agrupa numemp numemp      Clie           Importe vendido 
------------- ----------- -------------- --------------------- 
Total Final   NULL        Total empleado 2420,636 
              101         2102           39,78 
              101         2108           1,50 
              101         2113           225,00 
              101         Total empleado 266,28 
              102         2106           40,26 
              102         2120           37,50 
              102         Total empleado 77,76 
              103         2111           21,00 
              103         Total empleado 21,00 
              104                        0,00 
              104         Total empleado 0,00 
... 
Nota: Recuerda la función  ISNULL()(para la columna importe vendido)  y la función CASE con diferentes 
condiciones (para la columna clie).
*/

/*27.7. Lo rematamos para que el resultado quede así: 
            numemp Clie           Importe vendido 

----------- ------ -------------- --------------------- 
Total Final ...    ...            2420,636 
            101    2102           39,78 
            101    2108           1,50 
            101    2113           225,00 
            101    Total empleado 266,28 
            102    2106           40,26 
            102    2120           37,50 
            102    Total empleado 77,76 
            103    2111           21,00 
            103    Total empleado 21,00 
            104                   0,00 
            104    Total empleado 0,00 
...
*/