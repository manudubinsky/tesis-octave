% Problema: cambian las soluciones si cambia la raiz del arbol generador?
% Tiene sentido porque ese cambio induce otras orientaciones de los ejes
%
% INPUT: Adj (matriz de adyacencia),
%        W (matriz esparsa de pesos de los ejes; en la entrada (i,j) tiene 
%           el valor de e_ij),
%        p (vector de permutaciones de nodos en la matriz de adyacencia.
%           ej: [2,3,1] -> permutar filas/columnas de la mat. de ay: 1->2, 2->3,
%            3->1)
% OUTPUT: x (solucion del problema de oneForm)
%

function [x,oneForm,v,Adj,W1]=oneFormSolve(Adj,W,p)
nodeCount = size(Adj,1);
permRows = eye(nodeCount)(p,:); % matriz de permutacion
Adj = permRows * Adj * permRows'; % permutacion de la matriz de adyacen|cia
% modificar las entradas en la matriz de pesos
[row,col,values] = find(W);
[rowCount,colCount] = size(W);
W1 = sparse(rowCount,colCount);
for i=1:length(row)
  r = min(p(row(i)), p(col(i)));
  c = max(p(row(i)), p(col(i)));
  W1(r,c) = values(i);
end

[oneForm,v]= oneFormMatrix(Adj,W1);
x = gradientDescent(oneForm(:,2:nodeCount), v);
% x = gradientDescent(oneForm, v);
%oneForm * x - v

%full(W)'(:)
%aplicar permutacion de filas; A = eye(3)(:,[2,3,1])
%conversion matriz de pesos a vector: A'(:)