naive_length([],0).
naive_length([_H|T],N):-naive_length(T,M),N is M+1.

/** <examples>
?-naive_length([a,b,c],N).
*/
