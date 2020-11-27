insert(X,[],[X]).
insert(X,[Head|Tail],[Head|Inserted]):-
    X > Head,
    insert(X,Tail,Inserted).
insert(X,[Head|Tail],[X,Head|Tail]):-
    X =< Head.
