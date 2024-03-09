% model(M) <- M is a model of the clauses defined by cl/1
model(M):-
    model([],M).

model(M0,M):-
    is_violated(Head,M0),!,  % instance of violated clause
    disj_element(L,Head),    % L: ground literal from head
    model([L|M0],M).         % add L to the model
model(M,M).                  % no more violated clauses

is_violated(H,M):-
    cl((H:-B)),
    satisfied_body(B,M),     % grounds the variables
    \+ satisfied_head(H,M).

satisfied_body(true,_M).     % body is a conjunction
satisfied_body(A,M):-
    member(A,M).
satisfied_body((A,B),M):-
    member(A,M),
    satisfied_body(B,M).

satisfied_head(A,M):-        % head is a disjunction
    member(A,M).
satisfied_head((A;_B),M):-
    member(A,M).
satisfied_head((_A;B),M):-
    satisfied_head(B,M).

%%% from Section 10.2 (appendix)
disj_element(X,X):-          % single-element disjunction
    X\=false,
    X\=(_;_).
disj_element(X,(X;_Ys)).
disj_element(X,(_Y;Ys)):-
    disj_element(X,Ys).

%%% Example disjunctive clauses to compute model for
cl((married(X);bachelor(X):-man(X),adult(X))).
cl((has_spouse(X):-married(X),man(X))).
cl((man(paul):-true)).
cl((adult(paul):-true)).

/** <examples>
?-model(M).
*/
