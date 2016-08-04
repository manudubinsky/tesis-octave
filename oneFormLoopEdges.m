% Devuelve los loop edges
%
% INPUT: matriz de adyacencia, arbol (ver output de BFS) 
% OUTPUT: Lista de ejes que no pertencen al arbol
%

function L=oneFormLoopEdges(adj,tree)
edges = adj2edgeL(adj);
edges = edges(edges(:,1)<edges(:,2),:); % sacar duplicados
L=[];
for e=1:length(edges)
  i = min(edges(e,1),edges(e,2));
  j = max(edges(e,1),edges(e,2));
  if length(find(tree{i}==j)) == 0
    L = [L; i j];
  end
end