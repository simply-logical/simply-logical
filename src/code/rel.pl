constant(peter).
constant(maria).

% rel_atom(A,L) <- A is a relational atom with arguments L
rel_atom(likes(X,Y),[X,Y]).
rel_atom(student_of(X,Y),[X,Y]).


% Constants are the ground terms in relational clausal logic
ground_term(T):-
	constant(T).

ground_terms([]).
ground_terms([T|Ts]):-
	ground_term(T),
	ground_terms(Ts).


% An atom is ground if its arguments are ground terms
ground_atom(A):-
	rel_atom(A,Args),
	ground_terms(Args).


/** <examples>
?- herbrand_universe(U). 
?- herbrand_base(B). 
?- herbrand_interpretation(I). 
?- C=(likes(X,Y):-student_of(Y,X)),ground_clause(C).
?- herbrand_interpretation(I),true_clause((likes(X,Y):-student_of(Y,X)),I).
?- herbrand_interpretation(I),false_clause((likes(X,Y):-student_of(Y,X)),I).
?- herbrand_interpretation(I),true_program([(likes(X,X):-true),(likes(X,Y):-student_of(Y,X))],I).
?- herbrand_model([(likes(X,X):-true),(likes(X,Y):-student_of(Y,X))],I).
?- logical_consequence((false:-student_of(Z,Z)),[(false:-likes(A,A)),(likes(X,Y):-student_of(Y,X))],I).
?- logical_consequence((false:-student_of(Z,B)),[(false:-likes(A,A)),(likes(X,Y):-student_of(Y,X))],I).
*/
