% an example of iterative deepening
search_id(First,Goal):-
    search_id(1,First,Goal).     % start with depth 1

search_id(D,Current,Goal):-
    search_d(D,Current,Goal).
search_id(D,Current,Goal):-
    D1 is D+1,                   % increase depth
    search_id(D1,Current,Goal).

% backtracking depth-first search with depth bound
search_d(D,Goal,Goal):-
    goal(Goal).
search_d(D,Current,Goal):-
    D>0, D1 is D-1,
    arc(Current,Child),
    search_d(D1,Child,Goal).

children(Node,Children):-
    findall(C,arc(Node,C),Children).

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
