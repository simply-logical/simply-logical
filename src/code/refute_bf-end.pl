%%% auxiliary predicates
disj_append(A,B,C):-
    ( A=false    -> B=C
    ; A=(A1;A2) -> C=(A1;C2),disj_append(A2,B,C2)
    ; otherwise -> C=(A;B)
    ).

conj_append(A,B,C):-
    ( A=true    -> B=C
    ; A=(A1,A2) -> C=(A1,C2),conj_append(A2,B,C2)
    ; otherwise -> C=(A,B)
    ).

conj_remove_one(X,X,true):-	% single-element conjunction
	not(X=true),not(X=(_,_)).
conj_remove_one(X,(X,Ys),Ys).
conj_remove_one(X,(Y,Ys),(Y,Zs)):-
	conj_remove_one(X,Ys,Zs).

%%% object-level program
cl((bachelor(X);married(X):-man(X),adult(X))).
cl((has_wife(X):-man(X),married(X))).
cl((false:-has_wife(paul))).
cl((man(paul):-true)).
cl((adult(paul):-true)).
