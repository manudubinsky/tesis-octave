% ejemplos (ver carpeta ./ejemplos)

%ejemplo 1 (matriz de adyacencia)
A1 = full(sparse(
[1,1,2,2,3,3,3,4,4,4,4,5,5,5,6,7,8,8,9,9],
[2,3,1,4,1,5,6,2,5,7,8,3,4,9,3,4,4,9,5,8],
[1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1],9,9))

B1 = oneFormMatrix(A1)

% la matriz trasladando al origen a la raiz del arbol (nodo 1)

C1 = B1(:,2:11) 

V1 = ones(10,1) * 10

C2 = B1(:,2:9)

%ejemplo 2 (matriz de adyacencia)
A2 = full(sparse(
[1,1,2,2,3,3,4,4,4,5,5,5,5,6,6,6,7,7],
[2,3,1,4,1,5,2,5,6,3,4,6,7,4,5,7,5,6],
[1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1],7,7))

B2 = oneFormMatrix(A2)

C2 = B2(:,2:10)

V2 = ones(9,1) * 10

%ejemplo 3 probar gradientDescent con un sistema indeterminado para 
%ver si converge a la proyeccion ortogonal del subespacio generado por A
A3 = full(sparse(
[1,2],
[1,2],
[10,10],3,3))

b3 = [0,1,1]';
