search_df([Goal|_Rest],Goal):-
    goal(Goal).
search_df([Current|Rest],Goal):-
    children(Current,Children),
    append(Children,Rest,NewAgenda),
    search_df(NewAgenda,Goal).

children(Node,Children):-
    findall(C,arc(Node,C),Children).
