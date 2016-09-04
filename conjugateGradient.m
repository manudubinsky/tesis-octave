% Resuelve el sistema A x = b (metodo de Jacobi)
%
% INPUT: A (matriz de nxn), b (vector columna de dim n), xInitial (vector inicial)
% OUTPUT: x (vector columna de dim n)
%
% Nota: A = D + R

function x=conjugateGradient(A,b,delta = 0.00001,xInitial = zeros(size(A,2),1), maxIter = 1000)
x = xInitial;
r = b - A * x;
p = r;
while (norm(A * x - b) > delta && i < maxIter)
  alfa = (r' * r)/(p' * A * p);
  x = x + alfa * p;
  rNext = r - alfa * A * p;
  beta = (rNext' * rNext)/(r' * r);
  p = rNext + beta * p;
  r = rNext;
  i = i + 1;
end