# 1.8 Ejercicio 8. Biblioteca
**El profesorado del CEEDCV que hace guardia de biblioteca se ha dado cuenta de que la base de
datos que la gestiona no funciona correctamente, genera duplicados y a veces, al borrar un
ejemplar, crea inconsistencias en el sistema.
La dirección, que confía mucho en el alumnado de DAW, les ha solicitado un nuevo diseño e
implementación para la base de datos de la biblioteca. Se parte de los siguientes supuestos:**

* De cada alumno socio de la biblioteca almacenaremos el NIA, nombre, apellidos, dni,
dirección y teléfono (sólo uno).
* La biblioteca presta diferentes obras. Para cada ejemplar o copia de una obra se almacena
un número de copia. Es decir si tenemos tres ejemplares del libro “El Quijote”, cada uno de
ellos se identicará por el código de la obra y el número de copia.
* Además almacenamos para cada obra el nombre, el ID o código, el año en el que se realizó y
los datos del autor(es) de la misma. De todos ellos se guarda la misma información: nombre
y país de nacimiento.
* Anotamos si un ejemplar concreto está deteriorado y haremos un comentario sobre el
posible deterioro.
* Cuando se presta un artículo, se anota fecha en la que se presta y la fecha tope para
devolverlo. Cuando el socio lo devuelve, se anota la fecha real de devolución para poder
saber los préstamos retrasados.
* No hay tope sobre el número de ejemplares que pueden prestarse a un socio e incluso el
mismo socio podría llevarse varias veces el mismo artculo en distntos préstamos.

Diseña el diagrama E-R.