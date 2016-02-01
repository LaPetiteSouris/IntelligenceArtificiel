function path=rechercherceenlargeur(node_list, start, goal);

queue{1} = [start];

while (length(queue) > 0)
    path=queue{1};
    queue=queue(2:end);
    node=path(end);
    if node==goal
        return 
    end
    neighbors=node_list(node).Neigh;
    for i=1:length(neighbors)
        adj=neighbors(i);
        new_path=path;
        new_path(end+1)=adj;
        queue{end+1}=new_path;
        
    end
       
end

end

