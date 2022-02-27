# 2.2 Ejercicio 2. Farmacias
* Se desea mantener una base de datos para una cadena de farmacias distribuida en diferentes
ciudades. Cada farmacia contrata a una plantilla de trabajadores compuesto por sus empleados
propios y un farmacéutico. Por cada ciudad, con al menos una farmacia, existe un único
farmacéutico; esto es, si en una ciudad hubiera más de una farmacia, el mismo farmacéutico estaría
atendiendo a todas las farmacias de esa ciudad. Sólo se registrarán en la base de datos las ciudades
que al menos tengan una farmacia.
* Cada farmacia almacena cuántos medicamentos tiene según su presentación.
* El precio de cada medicamento depende según su presentación (es decir, para cada medicamento
y presentación concreta: hay que guardar cuántos hay y cuánto vale para esa presentación). Si se
registra una farmacia es porque ya está instalada en una ciudad y tiene empleados, pero si es nueva
puede que todavía no tenga medicamentos en existencias.
* Los medicamentos se organizan según el laboratorio que lo comercializa (cada uno puede
comerciar varios medicamentos y cada medicamento puede ser comercializado únicamente por un
laboratorio), y sus acciones terapéuticas (analgésico, antibiótico, etc.) que pueden ser varias para un
mismo medicamento. Puede que existan ingredientes registrados en la base de datos que no estén
todavía presentes en ningún medicamento. Pueden registrarse laboratorios a los que no se le
compren medicamentos aún pero que interesan por tener su teléfono.
* Por cada medicamento se mantiene su nombre, prospecto (campo de texto extenso), precio
(depende de la presentación) y la cantidad en existencias del mismo (para una presentación
concreta). Por cada empleado se mantiene su DNI, nombre y teléfono de contacto. De cada
farmacéutico se quiere saber en qué año obtuvo su titulación universitaria, y de cada empleado
propio se quiere conocer el tipo de contrato realizado (fijo, indefinido, etc.). De los ingredientes
únicamente interesa su nombre y sus características terapéuticas. Del laboratorio interesa su
nombre y teléfono; y de la acción terapéutica interesa sólo su denominación.