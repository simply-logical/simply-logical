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
