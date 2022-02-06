# 1.2 Ejercicio 2. Agencia de viajes.
**Una cadena de agencias de viajes desea disponer de una Base de Datos que contemple información relatva al hospedaje y vuelos de los turistas que la contratan.**
**Los datos a tener en cuenta son:**

* La cadena de agencias está compuesta por un conjunto de sucursales. Cada sucursal viene
deinida por el código de sucursal, dirección y teléfono.
* La cadena tene contratados una serie de hoteles de forma exclusiva. Cada hotel estará
deinido por el código de hotel, nombre, dirección, ciudad, teléfono y número de plazas
disponibles.
* De igual forma, la cadena tene contratados una serie de vuelos regulares de forma
exclusiva. Cada vuelo viene deinido por el número de vuelo, fecha y hora, origen y destno,
plazas totales y plazas de clase turista de las que dispone.
* La información que se desea almacenar por cada turista es el código de turista, nombre y
apellidos, dirección y teléfono.
Por otra parte, hay que tener en cuenta la siguiente información:
* A la cadena de agencias le interesa conocer qué sucursal ha contratado el turista.
* A la hora de viajar el turista puede elegir cualquiera de los vuelos que ofrece la cadena, y en
qué clase (turista o primera) desea viajar.
* De igual manera, el turista se puede hospedar en cualquiera de los hoteles que ofrece la
cadena, y elegir el régimen de hospedaje (media pensión o pensión completa). Siendo
signiicatva la fecha de llegada y de partda.
<br>

**Crea el modelo E/R (incluyendo los atributos que consideres oportunos) necesario para
representar dicha información.**
<hr>

* Entidad Sucursal
  * <u>Código sucursal</u> [Entero]
  * Dirección [Carácter 20]
  * Télefono [Entero]
* Entidad Hotel
  * <u>Código hotel</u> [Carácter 20]
  * Nombre [Carácter 50]
  * Dirección [Carácter 50]
  * Ciudad [Carácter 20]
  * Teléfono [Entero]
  * Nº de plazas disponibles [Entero]
* Entidad Vuelos
  * <u>Nº de vuelo</u> [Carácter 7]
  * Fecha [Fecha]
  * Origen [Carácter 20]
  * Destino [Carácter 20]
  * Plazas primera [Entero]
  * Plazas turista [Entero]
* Entidad Turista
  * <u>Código turista</u> [Carácter 20]
  * Nombre [Carácter 20]
  * Apellidos [Carácter 20]
  * Dirección [Carácter 20]
  * Teléfono [Entero]
  * Codigo sucursal [Entero]
  * Nº de vuelo [Carácter 7]
  * Tipo de plaza [Carácter 15]
* Hospedaje
  * <u>Código turista</u> [Carácter 20]
  * <u>Código hotel</u> [Carácter 20]
  * Régimen hospedaje [Carácter 20]
  * Fecha llegada [Fecha]
  * Fecha salida [Fecha]

<img src="Ejercicio%202.drawio.png" width="70%">