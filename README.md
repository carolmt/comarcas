# comarcas

A new Flutter project.

## Getting Started

Proyecto dart consumiendo una Api de provincias y comarcas de la Comunidad Valenciana.
Al principio del código tenemos definida una clase Comarca, la cual no termino usando en el programa principal (me daba problemas)
Depues tenemos el código ejecutable en la clase main usando async.
Usamos una función que he creado, llamada menu, la cual nos permite manejar el consumo de la api o salir del programa.
Según la elección dada por el usuario realizará un caso diferente en el switch.
Lee los datos con utf8.decode para que no de problemas los acentos y espacios.
