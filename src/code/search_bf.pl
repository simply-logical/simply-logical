% an example of breadth-first search
search_bf([Goal|_Rest],Goal):-
    goal(Goal).
search_bf([Current|Rest],Goal):-
    children(Current,Children),
    append(Rest,Children,NewAgenda),
    search_bf(NewAgenda,Goal).

children(Node,Children):-
    findall(C,arc(Node,C),Children).

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
