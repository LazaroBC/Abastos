HTML 5. Formato de texto
1. Introducción
La tarea inicial del editor de contenidos HTML consiste en estructurar el texto original definiendo sus párrafos, titulares y títulos de sección
XHTML define etiquetas para estructurar el contenido en secciones y párrafos, y otras para el marcado de elementos importantes dentro del texto.
Las de estructuración permiten indicar las diferentes zonas o secciones que componen el texto, indicando los párrafos, títulos...
Las de marcado permiten el marcado físico (resaltando en negrita, cursiva,... partes del texto) o lógico (resaltando trozos de texto indicando que corresponden a definiciones, abreviaturas, textos importantes, textos modificados, citas a otras referencias, etc.
2. Etiquetas para estructurar el contenido
Principalmente son etiquetas de bloque, que permiten definir, cabereras, párrafos, listas, tablas, divisiones, formularios...
Las más importantes para comenzar son las de estructuración en cabeceras y párrafos, el resto de etiquetas las veremos en temas sucesivos.
2.1. Cabeceras
Son etiquetas de bloque. De mayor a menor importancia, se introducen como:
<h1>..</h1> <h2>..</h2> <h3>..</h3> <h4>..</h4> <h5>..</h5> <h6>..</h6>
Las apariencias de las mismas son:
cabecera h1
cabecera h2
cabecera h3
cabecera h4
cabecera h5
cabecera h6
2.2. Párrafos
Los párrafos son etiquetas de bloque que se introducen mediante la etiqueta <p>..</p>
Para crear distintas líneas dentro de un párrafo, está el elemento <br> para realizar el salto de línea.
2.3. Otras etiquetas de estructuración
Preformateado: <pre>..</pre>
Línea de separación: <hr>
Sangrado: <blockquote>..</blockquote>
3. Etiquetas de marcado
Sirven para resaltar de forma física o lógica ciertas partes del texto. Suelen ser etiquetas de línea, afectando únicamente al texto al que se aplican.
Marcado físico, etiquetas de presentación: negritas, cursivas, subrayados...
Marcado lógico, etiquetas semánticas: definición, abreviatura, texto de código de un programa,...
3.1. Marcado físico
Negrita: <strong>..</strong> 
Cursiva: <em>..</em> 
Subrayado: <ins>..</ins>
tachado: <del>..</del>
Superíndice: <sup>..</sup> 
Subíndice: <sub>..</sub> 
Marcado: <mark>..</mark>
Sentido lectura: <bdo>..</bdo>
Textos legales: <small>..</small>
Abreviatura: <abbr> ... </abbr> 
Dirección de contacto <address> ... </address> 
Teclas: <kbd>..</kbd>
Títulos de libros, canciones...: <cite> ... </cite> 
Código informático: <code> ... </code> 
Definición de un término: <dfn> ... </dfn> 
Fechas y horas: <time>..</time>
Variables: <var> .. </var>
Ejemplos: <sample>..</sample>