% path_leaf(N,P) <- P is a path starting at node N, ending
%                   in a leaf in the graph given by arc/2
path_leaf(Leaf,[Leaf]):-
    leaf(Leaf).
path_leaf(Node1,[Node1|Nodes]):-
    arc(Node1,Node2),
    path_leaf(Node2,Nodes).

leaf(Leaf):-
    not(arc(Leaf,_SomeNode)).

/** <examples>
?- path_leaf(n1,Path).
?- path_leaf(Node,[N1,N2,N3]).
*/
