reachable(X,Y):-connected(X,Y,_L).
reachable(X,Y):-connected(X,Z,L),reachable(Z,Y).

/** <examples>
?-reachable(bond_street,Y).
?-reachable(X,green_park).
?-reachable(X,Y).
*/
