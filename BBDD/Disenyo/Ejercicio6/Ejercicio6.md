# 1.6 Ejercicio 6. Club náutico
**Un club náutico desea tener informatizados los datos correspondientes a sus instalaciones,
empleados, socios y embarcaciones que se encuentran en dicho club. El club está organizado de la
siguiente forma:**
* Los socios pertenecientes al club vienen definidos por su nombre, dirección, DNI, teléfono y
fecha de ingreso en el club.
* Las embarcaciones vienen definidas por: matricula, nombre, tipo y dimensiones.
* Los amarres tienen como datos de interés el número de amarre, la lectura del contador de
agua y luz, y si tienen o no servicios de mantenimiento contratados.
* Por otro lado, hay que tener en cuenta que una embarcación pertenece a un socio, aunque
un socio puede tener varias embarcaciones. Una embarcación ocupará un amarre y un
amarre está ocupado por una sola embarcación. Es importante la fecha en la que una
embarcación es asignada a un amarre.
* Los socios pueden ser propietarios de amarres, siendo importante la fecha de compra del
amarre. Hay que tener en cuenta que un amarre pertenece a un solo socio y que NO HAY
ninguna relación directa entre la fecha en la que se compra un amarre y en la que una
embarcación se asigna a un amarre.
* El club náutico está dividido en varias zonas definidas por una letra, el tipo de barcos que
tiene, el número de barcos que contiene, la profundidad y el ancho de los amarres. Una
zona tendrá varios amarres y un amarre pertenece a una sola zona.
* En cuanto a los empleados, éstos vienen definidos por su código, nombre, dirección,
teléfono y especialidad. Un empleado está asignado a varias zonas y en una zona puede
haber más de un empleado, siendo de interés el número de barcos de los que se encarga
en cada zona. Hay que tener en cuenta que un empleado puede no encargarse de todos los
barcos de una zona.

Crea el modelo E/R (incluyendo los atributos que consideres oportunos) necesario para
representar dicha información.