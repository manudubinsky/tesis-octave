% Relabel de los vertices para que la oneFormMatrix quede bien
%
% INPUT: tree, in adjacency list {} format (ver output de BFS) 
% OUTPUT: matriz de 3 x |V|
%         fila 1: ID vertice -> ID label vertice
%         fila 2: ID label vertice -> ID vertice
%         fila 3: ID label vertice -> ID label padre

function M=oneFormRelabel(tree)
M = zeros(3,length(tree));
q=[1]; % el primero es la raiz
M(:,1) = [1,1,1]; % el label de la raiz es 1 y es su propio padre
label = 2;
while not(isempty(q))
    padre=q(1); q=q(2:length(q));  % pop the front
    childs=tree{padre};
    if length(childs) > 0
      labelPadre = M(1,padre);
      for nn=1:length(childs)
        M(1,childs(nn)) = label;
        M(2,label) = childs(nn);
        M(3,label) = labelPadre;
        label++;
      end
      q =[q, childs];
    end    
end