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

% default(Name,Rule)
default(mammals_dont_fly(X),(not flies(X):-mammal(X))).
default(bats_fly(X),(flies(X):-bat(X))).
default(dead_things_dont_fly(X),(not flies(X):-dead(X))).
rule((mammal(X):-bat(X))).
rule((bat(dracula):-true)).
rule((dead(dracula):-true)).
% bats are flying mammals
rule((not mammals_dont_fly(X):-bat(X))).
% dead bats don't fly
rule((not bats_fly(X):-dead(X))).
