% Resuelve la minimizacion de ||A x - b|| (metodo de Gradient Descent)
%
% INPUT: A (matriz de nxn), b (vector columna de dim n),
%         xInitial (vector inicial), maxIter (cantidad maxima de iteraciones)
% OUTPUT: x (vector columna de dim n)
%

function x=gradientDescent3(A,b,xInitial = zeros(size(A,2),1),maxIter = 10000)
x = xInitial;
xOld = x + 1;
AtA = A' * A;
Atb = A' * b;
i = 0;
while (norm(xOld - x) > 0.000001 && i < maxIter)
  xOld = x;
  grad = 2 * (AtA * x - Atb);
  lambda = norm(b-A*x) / norm(A*grad);  
  x = x - lambda * grad;
  lambda
  norm(xOld - x)
  i++;
end
i