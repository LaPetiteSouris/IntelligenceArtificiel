clear all
close all;

% Initialize the Plan with input values
% Obstacle=-1,Target = 0,Robot=1,Space=1
X_max=10;
Y_max=10;
Plan=CreateScenario(X_max,Y_max);


% Generation of Map_plan2node
n=0;
for j=1:Y_max;
    for i=1:X_max
        n=n+1;
        Map_plan2node(i,j)=n;
    end
end


% Generation of NodeList
[NodeList] =IncidentList(Map_plan2node,Plan,X_max,Y_max);


% Generation of Nodes
[Nodes] = IncidentMatrix(Map_plan2node,Plan,X_max,Y_max);


% Identification of TargetNode and RootNode
[target_x,target_y]=find(Plan==-2);
TargetNode=Map_plan2node(target_x,target_y);
[root_x,root_y]=find(Plan==0);
RootNode=Map_plan2node(root_x,root_y);

