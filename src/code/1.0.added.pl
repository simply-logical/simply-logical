connected(Y,X,L):-connected(X,Y,L).

/** <examples>
?-connected(X,Y,central).                 % gives infinitely many answers
?-connected(bond_street,charing_cross,L). % should fail, but doesn't terminate
*/
