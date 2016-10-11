% ejemplos (ver carpeta ./ejemplos)

%ejemplo 1 (matriz de adyacencia)%%%%%%%%%%%%%%%%
A1 = full(sparse(
[1,1,2,2,3,3,3,4,4,4,4,5,5,5,6,7,8,8,9,9],
[2,3,1,4,1,5,6,2,5,7,8,3,4,9,3,4,4,9,5,8],
[1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1],9,9));

B1 = oneFormMatrix(A1, W);

% la matriz trasladando al origen a la raiz del arbol (nodo 1)
C1 = B1(:,2:11);

V1 = ones(10,1) * 10

V2 = [12,13,24,35,36,45,47,48,59,89]';

C2 = B1(:,2:9)

%solve
W = sparse(
[1,1,2,3,3,4,4,4,5,8],
[2,3,4,5,6,5,7,8,9,9],
[12,13,24,35,36,45,47,48,59,89],9,9);

p = [1,2,3,4,5,6,7,8,9];

oneFormSolve(A1,W,p);

p = [2,1,3,4,5,6,7,8,9];

[x,oneForm,v,Adj,W]=oneFormSolve(A1,W,p);

%ejemplo 2 (matriz de adyacencia)%%%%%%%%%%%%%%%%
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

%ejemplo 4 caso simple (triangulo) para probar distintos arboles generadores
% (oneFormSolve)
Adj = full(sparse(
[1,1,2,2,3,3],
[2,3,1,3,1,2],
[1,1,1,1,1,1],3,3));

%W = sparse(
%[1,1,2],
%[2,3,3],
%[10,20,30],3,3);

W = sparse(
[1,1,2],
[2,3,3],
[1000,30,5],3,3);

%W2 = sparse(
%[1,1,2],
%[2,3,3],
%[1000,1500,500],3,3);

p123 = [1,2,3];

%[x123,oneForm123,v,Adj,W]=oneFormSolve(Adj,W,p123);

%norm(v - oneForm123(:,2:3) * x123)

p132 = [1,3,2];

%[x132,oneForm132,v,Adj,W]=oneFormSolve(Adj,W,p132);

p213 = [2,1,3];

%[x213,oneForm213,v,Adj,W]=oneFormSolve(Adj,W,p213);

p231 = [2,3,1];

%[x231,oneForm231,v,Adj2,W2]=oneFormSolve(Adj,W,p231);

p312 = [3,1,2];

%[x312,oneForm312,v,Adj2,W2]=oneFormSolve(Adj,W,p312);

p321 = [3,2,1];

%[x321,oneForm321,v,Adj2,W2]=oneFormSolve(Adj,W,p321);

%%% Varios
A = sparse(
[1,1,2,2,3,3,3,4,4,4,4,5,5,5,6,7,8,8,9,9],
[2,3,1,4,1,5,6,2,5,7,8,3,4,9,3,4,4,9,5,8],
[1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1],9,9)

A = [0,1,0;1,0,1;0,1,0];
W = sparse(
[1,2],
[2,3],
[10,20],3,3);
p=[1,3,2];

%%%%%%%%%%%%%%%%%%%%
%Ejemplo para probar solvers Ax=b
%el resultado deberia ser [1, 2, −1, 1]'
A = [10, -1, 2, 0;
-1, 11, -1, 3;
2, -1, 10, -1;
0, 3, -1, 8]

b = [6, 25, -11, 15]'