length_acc(L,N):-length_acc(L,0,N).

length_acc([],N,N).
length_acc([_H|T],N0,N):-N1 is N0+1,length_acc(T,N1,N).

/** <examples>
?-length_acc([a,b,c],N).
?-length_acc([a,b,c],0,N).
?-length_acc([a,b,c],3,N).
*/
