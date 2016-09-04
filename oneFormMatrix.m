% Devuelve la matriz de |E|x|E|+1 con la informacion del arbol y los loop edges
%
% INPUT: Adj (matriz de adyacencia)
%         W (matriz esparsa triangular superior de pesos de los ejes)
% OUTPUT: M (matriz oneForm)
%         v (vector de pesos de los ejes correspobdiente a M)
%

function [M,v]=oneFormMatrix(Adj, W)
numEdges = length(find(Adj>0)) / 2; % cantidad de ejes
M = zeros(numEdges,numEdges+1); % la matriz de |E|x|E|+1

%procesar el arbol
tree = BFS(adj2adjL(Adj),1,0); % el arbol
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
loopEdges = oneFormLoopEdges(Adj,tree);
numLoopEdges = size(loopEdges,1);
for i=1:numLoopEdges
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

% Armo el vector de pesos
v = [];
q=[1]; % el primero es la raiz
while not(isempty(q))
  padre=q(1); q=q(2:length(q));  % pop the front
  childs=tree{padre};
  if length(childs) > 0
    for j=1:length(childs)
      v = [v;full(W(padre,childs(j)))];
    end
    q =[q, childs];
  end    
end
for i=1:numLoopEdges
    v = [v;full(W(loopEdges(i,1),loopEdges(i,2)))];
end