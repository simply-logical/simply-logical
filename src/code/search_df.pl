% an example of depth-first search
search_df([Goal|Rest],Goal):-
    goal(Goal).
search_df([Current|Rest],Goal):-
    children(Current,Children),
    append(Children,Rest,NewAgenda),
    search_df(NewAgenda,Goal).

children(Node,Children):-
    findall(C,arc(Node,C),Children).

% nodes are lists of letters
arc(T,[H|T]):-
    length(T,N),N<11,
    member(H,[a,d,i,m]).

% find palindromes
goal(L):-
    reverse(L,L).

/** <examples>
?-search_df([[a,d,a,m]],Goal).
*/
