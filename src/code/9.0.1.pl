% induce(E,H) <- H is inductive explanation of E
induce(E,H):-induce(E,[],H).

induce(true,H,H):-!.
induce((A,B),H0,H):-!,
    induce(A,H0,H1),
    induce(B,H1,H).
induce(A,H0,H):-
    /* not A=true, not A=(_,_) */
    clause(A,B),
    induce(B,H0,H).
induce(A,H0,H):-
    element((A:-B),H0),     % already assumed
    induce(B,H0,H).         % proceed with body of rule
induce(A,H0,[(A:-B)|H]):-   % A:-B can be added to H
    inducible((A:-B)),      % if it's inducible, and
    not element((A:-B),H0), % if it's not already there
    induce(B,H0,H).         % proceed with body of rule

/** <examples>
?- induce(flies(tweety),H).
?- induce(flies(polly),H).
*/
