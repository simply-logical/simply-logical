% abduce(O,E) <- observation O follows by SLD-resolution
%                from the theory defined by clause/2,
%                extended with a list of unit clauses E
abduce(O,E):-
    abduce(O,[],E).

% with accumulator for explanations
abduce(true,E,E):-!.
abduce((A,B),E0,E):-!,
    abduce(A,E0,E1),
    abduce(B,E1,E).
abduce(A,E0,E):-
    cl(A,B),  % query clauses enumerated by cl/2
    abduce(B,E0,E).
abduce(A,E,E):-
    element(A,E).
abduce(A,E,[A|E]):-
    not element(A,E),
    abducible(A).

abducible(A):-
    not cl(A,_B).

/** <examples>
?- abduce(likes(peter,paul),Explanation).
?- abduce(flies(tweety),Explanation).
*/
