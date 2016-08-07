% Verifica la precondicion de Jacobi (que el radio espectral sea < 1)
%
% INPUT: A (matriz de nxn)
% OUTPUT: T/F
%
% Nota: A = D + R, la precondicion es: max(abs(eig(inv(D) * R))) <= 1

function check=checkJacobi(A)
Dinv_R = inv(diag(diag(A))) * (A - diag(diag(A)));  % inv(D) * R
eigenvals = eig(Dinv_R)
check = max(abs(eigenvals)) <= 1;