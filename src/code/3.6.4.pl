reverse_dl(X,Y):- reverse(X,Y-[]).

reverse([],Y-Y).
reverse([H|T],Y-Y0):- reverse(T,Y-[H|Y0]).

/** <examples>
?-reverse_dl([a,b,c],R).
?-reverse([a,b,c],R-[]).
?-reverse([b,c],R-[a]).
?-reverse([c],R-[b,a]).
*/
