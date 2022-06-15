nearby(X,Y):-connected(X,Y,_L).
nearby(X,Y):-connected(X,Z,L),connected(Z,Y,L).

/** <examples>
?-nearby(tottenham_court_road,leicester_square).
?-nearby(tottenham_court_road,W).
?-nearby(X,leicester_square).
*/
