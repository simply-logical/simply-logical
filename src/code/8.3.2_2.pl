diagnosis(Observation,Diagnosis):-
    abduce(Observation,Diagnosis).

abducible(fault(_X)).

/** <examples>
?- diagnosis(adder(a,0,0,1,0,1),D).
*/
