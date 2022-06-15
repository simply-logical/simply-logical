% nodes are lists of letters
arc(T,[H|T]):-
    length(T,N),N<11,     % this sets a depth bound
    member(H,[a,d,i,m]).  % only use these letters

% find palindromes
goal(L):-
    reverse(L,L).

/** <examples>
?-search_df([[a,d,a,m]],Goal).
*/
