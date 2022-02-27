# 1.3 Ejercicio 3. Gestón de exámenes.
**Los profesores de la asignatura de Bases de Datos de un Insttuto deciden crear una base de datos
que contenga la información de los resultados de las pruebas realizadas a los alumnos. Para realizar
el diseño se sabe que:** 
*  Los alumnos están definidos por su n° de matrícula, nombre y grupo al que asisten a clase.
*  Dichos alumnos realizan dos tipos de pruebas a lo largo del curso académico:
1. Exámenes escritos: cada alumno realiza varios a lo largo del curso, y se definen por el n°
de examen, el n° de preguntas de que consta y la fecha de realización (la misma para
todos los alumnos que realizan el mismo examen). Evidentemente, es importante
almacenar la nota de cada alumno por examen.
2. Prácticas: se realiza un n° indeterminado de ellas durante el curso académico, algunas
serán en grupo y otras individuales. Se definen por un código de práctca, título y el
grado de diicultad. En este caso los alumnos pueden examinarse de cualquier práctca
cuando lo deseen, debiéndose almacenar la fecha y nota obtenida.
* • En cuanto a los profesores, únicamente interesa conocer (además de sus datos personales:
DNI y nombre), quién es el que ha diseñado cada práctca, sabiendo que en el diseño de una
práctica puede colaborar más de uno, y que un profesor puede diseñar más de una práctca.
Interesa, además, la fecha en que ha sido diseñada cada práctica por el profesor
correspondiente.
Crea el modelo E/R (incluyendo los atributos que consideres oportunos) necesario para
representar dicha información.