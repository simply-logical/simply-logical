% partition(L,N,Littles,Bigs) <- Littles contains numbers
%                                in L smaller than N,
%                                Bigs contains the rest
partition([],_N,[],[]).
partition([Head|Tail],N,[Head|Littles],Bigs):-
	Head < N,
	partition(Tail,N,Littles,Bigs).
partition([Head|Tail],N,Littles,[Head|Bigs]):-
  Head >= N,
	partition(Tail,N,Littles,Bigs).

/** <examples>
?-partition([1,9,6,3,5],5,Littles,Bigs).
?-partition([11,7,5],5,Littles,Bigs).
*/
