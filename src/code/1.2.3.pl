reachable(X,Y,[]):-connected(X,Y,L).
reachable(X,Y,[Z|R]):-connected(X,Z,L),
                      reachable(Z,Y,R).

/** <examples>
?-reachable(oxford_circus,charing_cross,R).
?-reachable(X,charing_cross,[A,B,C,D]).
?-reachable(bond_street,piccadilly_circus,[A,B|L]).
*/
