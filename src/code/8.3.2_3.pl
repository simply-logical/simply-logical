% remove_one(X,Ys,Zs) <- Zs is list Ys minus one occurrence of X
remove_one(X,[X|Ys],Ys).
remove_one(X,[Y|Ys],[Y|Zs]):-remove_one(X,Ys,Zs).

% proper_subset(Xs,Ys) <- Xs is a subset of Ys, and Ys contains
%                         at least one element more
proper_subset([],Ys):-Ys \= [].
proper_subset([X|Xs],Ys):-remove_one(X,Ys,Ys1),proper_subset(Xs,Ys1).

diagnosis(Observation,Diagnosis):-
    abduce(Observation,Diagnosis).

abducible(fault(_X)).

min_diagnosis(O,D):-
    diagnosis(O,D),
    not((diagnosis(O,D1),proper_subset(D1,D))).

/** <examples>
?- min_diagnosis(adder(a,0,0,1,0,1),D).
*/
