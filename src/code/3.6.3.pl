reverse(X,Y):- reverse(X,[],Y).

reverse([],Y,Y).
reverse([H|T],Y0,Y):- reverse(T,[H|Y0],Y).

/** <examples>
?-reverse([a,b,c],R).
?-reverse([a,b,c],[],R).
?-reverse([b,c],[a],R).
?-reverse([c],[b,a],R).
*/
