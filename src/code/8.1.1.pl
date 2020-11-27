:-op(900,fy,not).

% explain(F,E) <- E explains F from rules and defaults
explain(F,E):-
    explain(F,[],E).

% meta-interpreter for rules and defaults
explain(true,E,E):-!.
explain((A,B),E0,E):-!,
    explain(A,E0,E1),
    explain(B,E1,E).
explain(A,E0,E):-
    prove_e(A,E0,E).         % explain by rules only
explain(A,E0,[default((A:-B))|E]):-
    default((A:-B)),
    explain(B,E0,E),
    not contradiction(A,E).  % A consistent with E

% meta-interpreter for rules
prove_e(true,E,E):-!.
prove_e((A,B),E0,E):-!,
    prove_e(A,E0,E1),
    prove_e(B,E1,E).
prove_e(A,E0,[rule((A:-B))|E]):-
    rule((A:-B)),
    prove_e(B,E0,E).

% check contradiction against rules
contradiction(not A,E):-!,
    prove_e(A,E,_E1).
contradiction(A,E):-
    prove_e(not A,E,_E1).

/** <examples>
?- explain(flies(X),E).
?- explain(not flies(X),E).
*/
