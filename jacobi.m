% Resuelve el sistema A x = b (metodo de Jacobi)
%
% INPUT: A (matriz de nxn), b (vector columna de dim n), xInitial (vector inicial)
% OUTPUT: x (vector columna de dim n)
%
% Nota: A = D + R

function x=jacobi(A,b,delta = 0.00001,xInitial = zeros(size(A,2),1))
Dinv_b = inv(diag(diag(A))) * b; % inv(D) * b
Dinv_R = inv(diag(diag(A))) * (A - diag(diag(A)));  % inv(D) * R
x = xInitial;
error = norm(b - A * x);
errors = [];
while (error > delta)
  errors = [errors, error];
  x =  Dinv_b - Dinv_R * x;
  error = norm(b - A * x);
end
plot(errors, 'linewidth',1);