is_violated(H,M):-
   cl((H:-B)),
   satisfied_body(B,M),	% this will ground the variables
   not(satisfied_head(H,M)).

satisfied_body(true,_M).	% body is a conjunction
satisfied_body(A,M):-
   member(A,M).
satisfied_body((A,B),M):-
   member(A,M),
   satisfied_body(B,M).

satisfied_head(A,M):-	% head is a disjunction
   member(A,M).
satisfied_head((A;_B),M):-
   member(A,M).
satisfied_head((_A;B),M):-
   satisfied_head(B,M).

disj_element(X,X):-	% single-element disjunction
	not(X=false),not(X=(_;_)).
disj_element(X,(X;_Ys)).
disj_element(X,(_Y;Ys)):-
	disj_element(X,Ys).

cl((append([],Y,Y):-list(Y))).
cl((append([X|Xs],Ys,[X|Zs]):-thing(X),append(Xs,Ys,Zs))).
cl((list([]):-true)).
cl((list([X|Y]):-thing(X),list(Y))).
cl((thing(a):-true)).
cl((thing(b):-true)).
cl((thing(c):-true)).
