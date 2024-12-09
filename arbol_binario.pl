   % Definición de un árbol binario
   % arbol(Valor, HijoIzquierdo, HijoDerecho)

   % Insertar un valor en el árbol
   insertar(Valor, nil, arbol(Valor, nil, nil)).
   insertar(Valor, arbol(Raiz, Izq, Der), arbol(Raiz, NuevoIzq, Der)) :-
       Valor < Raiz,
       insertar(Valor, Izq, NuevoIzq).
   insertar(Valor, arbol(Raiz, Izq, Der), arbol(Raiz, Izq, NuevoDer)) :-
       Valor > Raiz,
       insertar(Valor, Der, NuevoDer).

   % Buscar un valor en el árbol
   buscar(Valor, arbol(Valor, _, _)).
   buscar(Valor, arbol(Raiz, Izq, _)) :-
       Valor < Raiz,
       buscar(Valor, Izq).
   buscar(Valor, arbol(Raiz, _, Der)) :-
       Valor > Raiz,
       buscar(Valor, Der).

   % Predicados de prueba
   prueba_arbol :-
       insertar(5, nil, Arbol1),
       insertar(3, Arbol1, Arbol2),
       insertar(7, Arbol2, Arbol3),
       insertar(1, Arbol3, Arbol4),
       insertar(4, Arbol4, Arbol5),

       write('Árbol construido'),
       nl,

       (buscar(3, Arbol5) ->
           write('Valor 3 encontrado')
       ;
           write('Valor 3 no encontrado')
       ),
       nl,

       (buscar(6, Arbol5) ->
           write('Valor 6 encontrado')
       ;
           write('Valor 6 no encontrado')
       ),
       nl.

   % Ejecutar la prueba
   :- prueba_arbol.
   
