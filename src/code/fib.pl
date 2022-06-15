% fib(N,F) <- F is the N-th Fibonacci number
%             inefficient doubly-recursive version
fib(1,1).
fib(2,1).
fib(N,F):-
    N>2,N1 is N-1,N2 is N-2,
    fib(N1,F1),fib(N2,F2),
    F is F1+F2.

% We can get a more efficient version
% by solving a more general problem!

% fibn(N,Na,Nb,F) <- F is the N-th Fibonacci number
%                    in the sequence starting with Na, Nb
fibn(1,Na,_,Na).
fibn(2,_,Nb,Nb).
fibn(N,Na,Nb,F):-
    N>2, N1 is N-1,
    Nc is Na+Nb,
    fibn(N1,Nb,Nc,F).

fibn(N,F):-
    fibn(N,1,1,F).

/** <examples>
?-fib(10,F).
?-fib(20,F).
?-fib(30,F).
?-fibn(30,F).
?-fibn(50,F).
?-fibn(100,F).
*/
