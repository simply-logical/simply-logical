% term_arc(T,A) <- T is a tree, and A is an arc in T
term_arc(Tree,[Root,SR]):-             % Arc from Root to Subtree
    term_root(Tree,Root),
    term_subtree(Tree,Subtree),
    term_root(Subtree,SR).

term_arc(Tree,Arc):-                   % Arc in Subtree
    term_subtree(Tree,Subtree),
    term_arc(Subtree,Arc).

% term_path(T,P) <- T is a tree, and P is a path in T
term_path(Tree,Arc):-                  % consisting of one arc
    term_arc(Tree,Arc).

term_path(Tree,[Node1,Node2|Nodes]):-  % several arcs
    term_arc(Tree,[Node1,Node2]),
    term_path(Tree,[Node2|Nodes]).
