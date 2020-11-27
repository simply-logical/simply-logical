reachable(oxford,charing_cross,piccadilly).
reachable(X,Y,route(Z,R)):-
    connected(X,Z,_L),
    reachable(Z,Y,R).
connected(bond_street,oxford,central).

/** <examples>
?-reachable(X,Y,R).
?-connected(X,Y,L).
*/
