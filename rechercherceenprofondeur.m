function path=rechercherceenprofondeur(node_list, start, goal);
visited=[];
stack=[start];

while length(stack)>0
node=stack(end);
stack=stack(1:end-1);

if ismember(node, visited)
    
    continue
end

visited(end+1)=node;
if node==goal
    return
end

neighbors=node_list(node).Neigh;
for i=1:length(neighbors)
    adj=neighbors(i);
    if ~ismember(adj,visited)
        stack(end+1)=adj;
    end

path=[visited,goal];
end
end
