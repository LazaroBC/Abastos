# 2.6 Ejercicio 6. Gimnasio

Un gimnasio desea mantener información sobre las clases que imparte, sus socios y sus monitores:

Las clases se imparten en las distintas salas del gimnasio. Cada sala tiene un número, una ubicación
dentro del gimnasio, es de un tipo (cardio, general, muscular) y tiene un número de metros
cuadrados. Hay salas que tienen aparatos y salas que no. Los aparatos tienen un código, una
descripción y una indicación de su estado de conservación. Algunos de ellos están asignados a una
sala de forma permanente.

De las clases que se imparten se tiene su código, el tipo de clase (step, aerobic, spinning, etc.), el
día de la semana en que se imparte cada clase y la hora. Estas clases las imparten monitores, de los
que se tienen sus datos personales (DNI, nombre, teléfono), titulación (si la tienen), la experiencia
profesional y su preparación como monitores, es decir, qué tipos de clases pueden impartir (step,
aerobic, spinning, etc) y desde que año.

Quienes reciben las clases son los socios, de los que se tiene su número, los datos personales
(nombre, teléfono, dirección), su profesión y la cuenta bancaria a través de la que pagan las
mensualidades del gimnasio.

Además, el gimnasio posee pistas de squash. Cada pista tiene un número (distinto del de
cualquiera de las salas), una ubicación dentro del gimnasio y una indicación sobre su estado de
conservación. Estas pistas pueden ser reservadas por los socios.

Cada reserva será para una fecha y una hora determinadas. Para poder llevar a cabo estudios sobre
la utilización de las pistas, se quiere mantener información histórica de todas las reservas realizadas.

1. Realiza el esquema E/R que modeliza la información proporcionada por el gimnasio.
2. Una vez obtenido el esquema de la base de datos nos damos cuenta de que las pistas de
squash y las salas de clase son consideradas de igual modo para la elaboración de los turnos
de limpieza, que irán en función de su ocupación. Por lo tanto, los socios sólo podrán hacer
reservas de salas que son pistas de squash y las clases se impartirán en salas que no son
pistas de squash.
Modifica el esquema conceptual (es decir, el diagrama entidad-relación) para que se
reflejen los turnos de limpieza de todas las salas, ya sean de clase o de squash. Los turnos de
limpieza son una serie de horas en las que se debe acudir a la sala a limpiar.