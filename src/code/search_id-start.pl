search_id(First,Goal):-
    search_id(1,First,Goal).     % start with depth 1

search_id(D,Current,Goal):-
    search_d(D,Current,Goal).
search_id(D,Current,Goal):-
    D1 is D+1,                   % increase depth
    search_id(D1,Current,Goal).

% backtracking depth-first search with depth bound
search_d(_D,Goal,Goal):-
    goal(Goal).
search_d(D,Current,Goal):-
    D>0, D1 is D-1,
    arc(Current,Child),
    search_d(D1,Child,Goal).

children(Node,Children):-
    findall(C,arc(Node,C),Children).
