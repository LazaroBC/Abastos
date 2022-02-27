# 2.3 Ejercicio 3. Bancos (I)
Considérese una red de entidades bancarias en la que tenemos clientes con cuentas que pueden
ser corrientes o de ahorro.

Un cliente puede tener varias cuentas de cualquiera de los dos tipos abiertas, pero toda cuenta
tiene un único cliente como titular. Cada entidad bancaria cuenta con muchas sucursales, y los
clientes pueden abrir sus cuentas en cualquiera de las sucursales de cualquier entidad. Los números
de cuenta son únicos para toda la red de entidades. Cada sucursal pertenece a un único banco que
le asigna un número de sucursal.

Tenemos los siguientes requerimientos:

1. Dada una entidad bancaria, queremos conocer su nombre, sede social, y una relación de
sucursales indicando el número de sucursal, su dirección y el nombre del director.
2. Dado un nombre de cliente, queremos conocer su dirección, su edad, su nif, y una relación
de las cuentas que tiene abiertas, indicando para cada una de ellas, el número de cuenta, el
nombre de la entidad, el tipo de cuenta, el saldo actual, y la sucursal en la que se abrió.
3. Dado un número de cuenta, queremos saber el nombre de su titular, la dirección del titular,
su teléfono y saldo actual de la cuenta.