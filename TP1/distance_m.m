function y=distance_m(nodea,nodeb, mat);

[ia,ja]=find(mat==nodea);
[ib,jb]=find(mat==nodeb);
dx = abs(ia - ib);
dy = abs(ja - jb);
y= dx+dy;

end