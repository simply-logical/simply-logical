min_diagnosis(O,D):-
    diagnosis(O,D),
    not((diagnosis(O,D1),proper_subset(D1,D))).

/** <examples>
?- min_diagnosis(adder(a,0,0,1,0,1),D).
*/
