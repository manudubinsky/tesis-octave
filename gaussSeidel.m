% Resuelve el sistema A x = b (metodo de Gauss-Seidel)
%
% INPUT: A (matriz de nxn), b (vector columna de dim n), xInitial (vector inicial)
% OUTPUT: x (vector columna de dim n)
%
% Nota: A = D + R

function x=gaussSeidel(A,b,delta = 0.00001,xInitial = zeros(size(A,2),1))
Dinv_b = inv(diag(diag(A))) * b; % inv(D) * b
Dinv_R = inv(diag(diag(A))) * (A - diag(diag(A)));  % inv(D) * R
x = xInitial;
rows = size(Dinv_R,1);
errors = [];
error = norm(b - A * x);
while (error > delta)
  errors = [errors, error];
  for i=1:rows
    x(i) =  Dinv_b(i) - Dinv_R(i,:) * x;
  end
  error = norm(b - A * x);
end
plot(errors)
