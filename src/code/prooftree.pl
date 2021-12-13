% display a proof tree using Graphviz
:-use_rendering(graphviz).

prooftree(A,digraph([Options|Edges])):-
    gv_options(Options),
    prove_p(A,Edges),
    numbervars(Edges).

% prove_p(A,P) <- P is proof tree of A
prove_p(true,[]):-!.
prove_p((A,B),[((A,B)->D),(Clause->D)|Proof]):-!,
    clause(A,C),
    copy_term((A:-C),Clause),
    conj_append(C,B,D),
    prove_p(D,Proof).
prove_p(A,[(A->B),(Clause->B)|Proof]):-
    clause(A,B),
    copy_term((A:-B),Clause),
    prove_p(B,Proof).

/** <examples>
?-prooftree(student_of(S,T),PT).
?-prooftree(is_bird(X),PT).
*/

% example clauses
student_of(S,T):-teaches(T,C),follows(S,C).
teaches(peter,cs).
teaches(peter,ai).
follows(maria,cs).
follows(paul,ai).

is_bird(X):-has_feathers(X),lays_eggs(X).
is_fish(X):-has_gills(X),lays_eggs(X).
has_feathers(tweety).
lays_eggs(tweety).

% Graphviz formatting
gv_options(node([shape=none,fontname='Courier'])).

% from library
conj_append(true,Ys,Ys).
conj_append(X,Ys,(X,Ys)):-X\=true,X\=(_One,_TheOther).
conj_append((X,Xs),Ys,(X,Zs)):-conj_append(Xs,Ys,Zs).
