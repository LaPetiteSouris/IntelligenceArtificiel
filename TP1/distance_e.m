function y=distance_e(nodea,nodeb, mat);

[ia,ja]=find(mat==nodea);
[ib,jb]=find(mat==nodeb);
dx = abs(ia - ib);
dy = abs(ja - jb);
y= 1* sqrt(dx * dx + dy * dy);

end