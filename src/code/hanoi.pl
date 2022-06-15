:-op(900,xfx,to).

% hanoi(N,A,B,C,Moves) <- Moves is the list of moves to
%                         move N disks from peg A to peg C,
%                         using peg B as intermediary peg
hanoi(0,_A,_B,_C,[]).
hanoi(N,A,B,C,Moves):-
    N1 is N-1,
    hanoi(N1,A,C,B,Moves1),
    hanoi(N1,B,A,C,Moves2),
    append(Moves1,[A to C|Moves2],Moves).

/** <examples>
?- hanoi(3,left,middle,right,M).
*/
