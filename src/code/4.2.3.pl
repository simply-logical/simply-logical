arc(A,B):- resolve(A,(br(X,Y):-[br(X,Z),br(Z,Y)]),B).
arc(A,B):- resolve(A,(br(paul,peter):-[]),B).

% resolve(G,C,NewG) <- the goal G (a list of atoms)
%                      resolves with the clause C (body
%                      is a list) to yield the goal NewG
resolve([H1|T],(H2:-Body),B):-
    H1=H2,                % literal in goal unifies with head of clause
    append(Body,T,B).
resolve([H|T],Clause,[H|B]):-
    resolve(T,Clause,B).  % try next literal

/** <examples>
?- arc([br(paul,B)],N).
*/
