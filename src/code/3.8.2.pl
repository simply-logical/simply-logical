% meta-program
derive(if Assumptions then Goal):-
    if Body then Goal,
    derive(if Assumptions then Body).
derive(if Assumptions then Goal1 and Goal2):-
    derive(if Assumptions then Goal1),
    derive(if Assumptions then Goal2).
derive(if Assumptions then Goal):-
    assumed(Goal,Assumptions).

assumed(A,A).
assumed(A,A and _As).
assumed(A,_B and As):- assumed(A,As).

/** <examples>
?-derive(if tweety then is_bird).
?-derive(if tweety then C).
?-derive(if A then is_bird).
*/
