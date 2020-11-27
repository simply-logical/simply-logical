:-op(900,fy,not).

abduce(O,E) :-abduce(O,[],E).

% abduce(O,E0,E) <- E is abductive explanation of O, given
%                   E0 (works also for general programs)
abduce(true,E,E):-!.
abduce((A,B),E0,E):-!,
    abduce(A,E0,E1),
    abduce(B,E1,E).
abduce(A,E0,E):-
    clause(A,B),
    abduce(B,E0,E).
abduce(A,E,E):-
    element(A,E).           % already assumed
abduce(A,E,[A|E]):-
    not element(A,E),
    abducible(A),
    not abduce_not(A,E,E).  % and E doesn't explain not(A)
abduce(not(A),E0,E):-
    not element(A,E0),
    abduce_not(A,E0,E).

% abduce_not(O,E0,E) <- E is abductive expl. of not(O)
abduce_not((A,B),E0,E):-!,
    abduce_not(A,E0,E);       % disjunction
    abduce_not(B,E0,E).
abduce_not(A,E0,E):-
    setof(B,clause(A,B),L),
    abduce_not_l(L,E0,E).
abduce_not(A,E,E):-
    element(not(A),E).        % not(A) already assumed
abduce_not(A,E,[not(A)|E]):-
    not element(not(A),E),
    abducible(A),
    not abduce(A,E,E).        % and E doesn't explain A
abduce_not(not(A),E0,E):-
    not element(not(A),E0),
    abduce(A,E0,E).

abduce_not_l([],E,E).
abduce_not_l([B|Bs],E0,E):-
    abduce_not(B,E0,E1),
    abduce_not_l(Bs,E1,E).
