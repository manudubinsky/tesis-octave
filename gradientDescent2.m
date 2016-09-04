% Resuelve la minimizacion de ||A x - b|| (metodo de Gradient Descent)
%
% INPUT: A (matriz de nxn), b (vector columna de dim n),
%         xInitial (vector inicial), maxIter (cantidad maxima de iteraciones)
% OUTPUT: x (vector columna de dim n)
%

function x=gradientDescent2(A,b,xInitial = zeros(size(A,2),1),maxIter = 1000)
x = xInitial;
Ainvb = inverse(A) * b;
x = x + (Ainvb - x);
