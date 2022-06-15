% nodes are lists of letters
arc(T,[H|T]):-
    length(T,N),N<11,  % try removing the depth bound
    member(H,[a,d,i,m]).

% find palindromes
goal(L):-
    reverse(L,L).

/** <examples>
?-search_bf([[a,d,a,m]],Goal).
*/
