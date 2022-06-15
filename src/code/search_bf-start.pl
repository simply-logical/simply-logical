search_bf([Goal|_Rest],Goal):-
    goal(Goal).
search_bf([Current|Rest],Goal):-
    children(Current,Children),
    append(Rest,Children,NewAgenda),
    search_bf(NewAgenda,Goal).

children(Node,Children):-
    findall(C,arc(Node,C),Children).
