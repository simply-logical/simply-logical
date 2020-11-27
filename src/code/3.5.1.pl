add(0,X,X).
add(s(X),Y,s(Z)):-add(X,Y,Z).

/** <examples>
?-add(s(s(0)),Y,s(s(s(0)))).
*/
