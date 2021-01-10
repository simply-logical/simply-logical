reachable(X,Y,noroute):-connected(X,Y,_L).
reachable(X,Y,route(Z)):-connected(X,Z,_L1),
                         connected(Z,Y,_L2).
reachable(X,Y,route(Z1,Z2)):-connected(X,Z1,_L1),
                             connected(Z1,Z2,_L2),
                             connected(Z2,Y,_L3).

/** <examples>
?-reachable(oxford_circus,charing_cross,R).
*/
