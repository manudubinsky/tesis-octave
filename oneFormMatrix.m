% Devuelve la matriz de |E|x|E|+1 con la informacion del arbol y los loop edges
%
% INPUT: matriz de adyacencia
% OUTPUT: La matriz oneForm
%

function M=oneFormMatrix(adj)
numEdges = length(find(adj>0)) / 2; % cantidad de ejes
M = zeros(numEdges,numEdges+1); % la matriz de |E|x|E|+1

%procesar el arbol
tree = BFS(adj2adjL(adj),1,0); % el arbol
labels = oneFormRelabel(tree);
edgeIdx = 1;
for i=1:length(tree)
  childs=tree{i};
  if !isempty(childs)
    labelPadre = labels(1,i);
    for j=1:length(childs)
      labelChild = labels(1,childs(j));
      M(edgeIdx,labelPadre) = -1;
      M(edgeIdx,labelChild) = 1;
      edgeIdx++;
    end
  end
end

% procesar los loop edges
loopEdges = oneFormLoopEdges(adj,tree);
numLoopEdges = size(loopEdges,1);
for i=1:length(loopEdges)
    labelV1 = labels(1,loopEdges(i,1));
    labelV2 = labels(1,loopEdges(i,2));
    M(edgeIdx,labelV1) = -1;
    M(edgeIdx,labelV2) = 1;
    % hay que armar la columna de M asociada al ciclo inducido por el loop edge    
    M(edgeIdx,edgeIdx+1) = 1; % la parte inferior de la matriz es la identidad
    nodoActual = labelV1;
    while(nodoActual != labels(3,nodoActual))
      M(nodoActual-1, edgeIdx+1)++;
      nodoActual = labels(3,nodoActual);
    end
    nodoActual = labelV2;
    while(nodoActual != labels(3,nodoActual))
      M(nodoActual-1, edgeIdx+1)--;
      nodoActual = labels(3,nodoActual);
    end    
    edgeIdx++;
end