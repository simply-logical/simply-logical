biglist(Low,High,L):-
    bagof(X,between(Low,High,X),L).

between(Low,_High,Low).
between(Low,High,Number):-
    Low < High,
    NewLow is Low+1,
    between(NewLow,High,Number).

/** <examples>
?-biglist(1,15,L).
*/
