mul(0,_X,0).
mul(s(X),Y,Z):-mul(X,Y,Z1),add(Y,Z1,Z).

/** <examples>
?-mul(0,X,0).
?-mul(s(s(0)),s(s(s(0))),Z).
*/
