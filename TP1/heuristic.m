function y= heuristic(nodea, nodeb)

dx = abs(nodea.x - nodeb.x);
dy = abs(nodea.y - nodeb.y);
y= 1* sqrt(dx * dx + dy * dy);
end