naive_reverse([],[]).
naive_reverse([H|T],R):-naive_reverse(T,R1),append(R1,[H],R).

append([],Y,Y).
append([H|T],Y,[H|Z]):-append(T,Y,Z).

/** <examples>
?-naive_reverse([a,b,c],R).
*/
