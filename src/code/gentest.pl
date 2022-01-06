/*
 * Find unique assignments of decimal digits to letters
 * such that the sum is correct. 
 *
 *     S E N D
 *     M O R E
 *     ------- +
 *   M O N E Y
 */
 
% Easy one: 8 letters, plenty of solutions
sum1(Sum):-
	Sum=([S,E,N,D]+[M,O,R,E]=[M,O,N,E,Y]),
	gentest([S,E,N,D,M,O,R,Y],Sum).

/*
 *     C R O S S
 *     R O A D S
 *     --------- +
 *   D A N G E R
 */
 
% Harder one: 9 letters, only one solution
sum2(Sum):-
	Sum=([C,R,O,S,S]+[R,O,A,D,S]=[D,A,N,G,E,R]),
	gentest([C,R,O,S,A,D,N,G,E],Sum).

% Blind generate-and-test approach
gentest(Letters,Sum):-
	generate(Letters),
	test(Sum).

generate(Letters):-
	generate(Letters,[0,1,2,3,4,5,6,7,8,9]).

generate([],_).
generate([L|Ls],Digits):-
	remove_one(L,Digits,LessDigits),
	generate(Ls,LessDigits).

test(Word1+Word2=Word3):-
	calc(Word1,0,N1),
	calc(Word2,0,N2),
	calc(Word3,0,N3),
	N3 is N1+N2.

calc([],N,N).
calc([H|T],N0,N):-
	N1 is 10*N0+H,
	calc(T,N1,N).

% remove_one(X,Ys,Zs) <- Zs is list Ys minus one occurrence of X
remove_one(X,[X|Ys],Ys).
remove_one(X,[Y|Ys],[Y|Zs]):-
	remove_one(X,Ys,Zs).

/** <examples>
?- sum1(Sum).
?- sum2(Sum).
*/
