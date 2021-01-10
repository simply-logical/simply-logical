var_remove_one(X,[Y|Ys],Ys):-
    X == Y.  % syntactic identity
var_remove_one(X,[Y|Ys],[Y|Zs]):-
    var_remove_one(X,Ys,Zs).

var_proper_subset([],Ys):-
    Ys \= [].
var_proper_subset([X|Xs],Ys):-
    var_remove_one(X,Ys,Zs),
    var_proper_subset(Xs,Zs).
