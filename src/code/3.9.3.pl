insert(X,[],[X]).
insert(X,[Head|Tail],[Head|Inserted]):-
    X > Head,
    insert(X,Tail,Inserted).
insert(X,[Head|Tail],[X,Head|Tail]):-
    X =< Head.

/** <examples>
?-insert(4,[2,3,5,7],Inserted).
?-insert(1,[2,3,5,7],Inserted).
?-insert(8,[2,3,5,7],Inserted).
*/
