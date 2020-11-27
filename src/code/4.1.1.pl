% term_tree(T,R,S) <- term T represents a tree with root R
%                     and list of subtrees S
term_tree(Tree,Root,Subtrees):-
    Tree=..[Root|Subtrees].

% term_root(T,R) <- R is the root of tree T
term_root(Tree,Root):-
    term_tree(Tree,Root,_S).

% term_subtree(T,S) <- S is a subtree of tree T
term_subtree(Tree,Subtree):-
    term_tree(Tree,_R,S),
    member(Subtree,S).

/** <examples>
?- term_tree(n1(n2(n4,n5(n7),n6),n3(n8,n9(n10))),Root,Subtree).
?- term_tree(T,n1,[n2(n3),n4]).
*/
