reachable(X,Y,noroute):-connected(X,Y,L).
reachable(X,Y,route(Z)):-connected(X,Z,L1),
                         connected(Z,Y,L2).
reachable(X,Y,route(Z1,Z2)):-connected(X,Z1,L1),
                             connected(Z1,Z2,L2),
                             connected(Z2,Y,L3).

/** <examples>
?-reachable(oxford_circus,charing_cross,R).
*/
