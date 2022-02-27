# 1.5 Ejercicio 5. Centro educatvo
**Se va a diseñar un sistema que represente la siguiente información:** \
Profesor 
* Código interno, nombre, dirección, teléfono, categoría, departamento al que pertenece y
relación de asignaturas que imparte indicando para cada una de ellas los créditos asignados. 

Asignatura 
* Código de la asignatura, nombre, departamento al que está adscrita. 

Departamento 
* Código, nombre, director y teléfono 

Algunas restricciones de integridad que se han detectado: 
* Un profesor debe estar adscrito a un departamento y solo a uno.
* Una asignatura debe estar adscrita a un departamento y solo a uno.
* No puede haber dos departamentos con el mismo nombre.
* No puede haber dos profesores con el mismo código.
* No puede haber dos asignaturas con el mismo código.
* Suponer que si un departamento desaparece, deja de importarnos el resto de la información
almacenada de profesores y asignaturas adscritas al mismo.