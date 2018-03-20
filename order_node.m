function [result] = order_node(arbre)
%ORDER_NODE order the node of a tree from the outside to the inside.
%   I = order_node(tree) returns the indices of the nodes of the tree,
%   starting by all leaves and then progressing inwards the graph
%   structure.
n=size(arbre,1);
result = [];
test=zeros(1,n);
copie = arbre;
while sum(test)<n
    %detect unvisited nodes
    unvisited = find(test<1);
    %find leaf
    neig = zeros(1,numel(unvisited));
    for ii = 1:numel(unvisited)
        A=unvisited(ii);
        neig(ii)=numel(neighbours(copie,A));
    end
    leafs = unvisited(find(neig<2));
    test(leafs)=1;
    %prune copy
    copie(leafs,:)=0;
    copie(:,leafs)=0;
    
    result=[result,leafs];
end

end
