% model_d(D,M) <- M is a submodel of the clauses
%                 defined by cl/1
model_d(D,M):-
    model_d(D,[],M).

model_d(0,M,M).
model_d(D,M0,M):-
    D>0,D1 is D-1,
    findall(H,is_violated(H,M0),Heads),
    satisfy_clauses(Heads,M0,M1),
    model_d(D1,M1,M).

satisfy_clauses([],M,M).
satisfy_clauses([H|Hs],M0,M):-
    disj_element(L,H),
    satisfy_clauses(Hs,[L|M0],M).

/** <examples>
?- model_d(4,M).
*/
