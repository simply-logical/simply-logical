%%% from library.pl

varsin(Term,Vars):-
    varsin(Term,[],V),
    sort(V,Vars).

varsin(V,Vars,[V|Vars]):-
    var(V),!.
varsin(Term,V0,V):-
    functor(Term,_,N),
    varsin_args(N,Term,V0,V).

varsin_args(0,_,Vars,Vars).
varsin_args(N,Term,V0,V):-
    N>0, N1 is N-1,
    arg(N,Term,ArgN),
    varsin(ArgN,V0,V1),
    varsin_args(N1,Term,V1,V).

var_element(X,[Y|_Ys]):-
    X == Y.  % syntactic identity
var_element(X,[_Y|Ys]):-
    var_element(X,Ys).

var_remove_one(X,[Y|Ys],Ys):-
    X == Y.  % syntactic identity
var_remove_one(X,[Y|Ys],[Y|Zs]):-
    var_remove_one(X,Ys,Zs).

var_proper_subset([],Ys):-
    Ys \= [].
var_proper_subset([X|Xs],Ys):-
    var_remove_one(X,Ys,Zs),
    var_proper_subset(Xs,Zs).
