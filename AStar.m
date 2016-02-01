function [path]=AStar(node_list, start, goal, matrix_plan);

% find optimal path using A* algorithm
% path = AStar(node_list, start, goal, Map_plan2d) return path from start to goal.
%@Author: Sofiane M'Barki and Tung Hoang
%Pseudocode can be found at <http://web.mit.edu/eranki/www/tutorials/search/>
%
%   




path=[];
%Initialize list of open node, add start point to it
open_list=[start];
node_list(start).f=0;
%Initialize list of closed node
closed_list=[];
node_list(start).g=0;
node_list(start).parent=start;
while open_list
   f_min=node_list(open_list(1)).f;
   q=open_list(1);
   %Find node with f_min, name it q, then remove it from open list
   for i=1:length(open_list)
       if node_list(open_list(i)).f < f_min
           f_min=node_list(open_list(i)).f;
           q=open_list(i);
       end
   end
           open_list=open_list(find(open_list~=q));
           successors=node_list(q).Neigh;
           %Go through all nodes connected to q(successors of q)
           for i=1:length(successors)
              %Check if q is already a child node of successor, if not, add
              %q as parent.
              if node_list(q).parent ~=successors(i)
                  node_list(successors(i)).parent=q;
              end
             %If goal found --> end, return constructed path by tracing
             %back all parents
             if successors(i)==goal
                 p=q;
                 while 1==1  
                     path=[p path]; 
                     p=node_list(p).parent;
                     if p==start
                         path=[start path];
                         return
                     end
                 end
             end

             node_list(successors(i)).g=node_list(q).g+node_list(q).K(i);
             node_list(successors(i)).h=distance_e(successors(i),goal, matrix_plan);
             node_list(successors(i)).f=node_list(successors(i)).g+node_list(successors(i)).h;
%             if a node is in the OPEN list \
%             which has a lower f than successor, skip this successor
             if(ismember(successors(i),open_list))
                 node=find(open_list==successors(i));
                 if node_list(node).f < node_list(successors(i)).f
                     continue
                 end
%               if a node with the same position as successor is in the CLOSED list \ 
%             which has a lower f than successor, skip this successor
             elseif(ismember(successors(i),closed_list))
                 node=find(closed_list==successors(i));
                 if node_list(node).f < node_list(successors(i)).f
                     continue
                 end
             
             else 
%                   otherwise, add the node to the open list
                 open_list(end+1)=successors(i);
             end
                 
           end
%            push q on the closed list
       closed_list(end+1)=q;
end



