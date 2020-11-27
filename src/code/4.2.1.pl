% path(P) <- P is a path in the graph given by arc/2
path([Node1,Node2]):-
    arc(Node1,Node2).
path([Node1,Node2|Nodes]):-
    arc(Node1,Node2),
    path([Node2|Nodes]).

/** <examples>
?- path([n1,Node2]).
*/
