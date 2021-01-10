reachable(X,Y,[]):-connected(X,Y,_L).
reachable(X,Y,[Z|R]):-connected(X,Z,_L),
                      reachable(Z,Y,R).

/** <examples>
?-reachable(oxford_circus,charing_cross,R).
?-reachable(X,charing_cross,[A,B,C,D]).
?-reachable(bond_street,piccadilly_circus,[A,B|L]).
*/
