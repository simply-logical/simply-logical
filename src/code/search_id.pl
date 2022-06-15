% nodes are lists of letters
arc(T,[H|T]):-
    %length(T,N),N<11,           % depth bound no longer needed
    member(H,[a,d,i,m]).

% find palindromes
goal(L):-
    reverse(L,L).

/** <examples>
?-search_id([a,d,a,m],Goal).
*/
