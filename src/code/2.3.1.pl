plus(0,X,X).
plus(s(X),Y,s(Z)):-plus(X,Y,Z).

/** <examples>
?-plus(s(0),s(s(0)),Z).
?-plus(s(0),Y,s(s(s(0)))).
?-plus(X,s(s(0)),s(s(s(0)))).
?-plus(X,Y,Z).
*/
