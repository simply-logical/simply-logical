induce_rlgg(Exs,Clauses):-
    pos_neg(Exs,Poss,Negs),  % split pos. & neg. examples
    bg_model(BG),            % ground background model
    append(Poss,BG,Model),   % Model includes pos.exs.
    induce_rlgg(Poss,Negs,Model,Clauses).

induce_rlgg(Poss,Negs,Model,Clauses):-
    covering(Poss,Negs,Model,[],Clauses).

% split positive and negative examples
pos_neg([],[],[]).
pos_neg([+E|Exs],[E|Poss],Negs):-
    pos_neg(Exs,Poss,Negs).
pos_neg([-E|Exs],Poss,[E|Negs]):-
    pos_neg(Exs,Poss,Negs).

% covering algorithm
covering(Poss,Negs,Model,H0,H):-
    construct_hypothesis(Poss,Negs,Model,Hyp),!,
    remove_pos(Poss,Model,Hyp,NewPoss),
    covering(NewPoss,Negs,Model,[Hyp|H0],H).
covering(P,_N,_M,H0,H):-
    append(H0,P,H).  % add uncovered examples to hypothesis

% remove covered positive examples
remove_pos([],_M,_H,[]).
remove_pos([P|Ps],Model,Hyp,NewP):-
    covers_ex(Hyp,P,Model),!,
    write('Covered example: '),write(P),nl,
    remove_pos(Ps,Model,Hyp,NewP).
remove_pos([P|Ps],Model,Hyp,[P|NewP]):-
    remove_pos(Ps,Model,Hyp,NewP).

/** <examples>
?-  induce_rlgg([+element(b,[b]),
                 +element(2,[2,3]),
                 +element(3,[1,2,3]),
                 +element(b,[a,b]),
                 +element(3,[2,3]),
                 +element(3,[3]),
                 -element(3,[a,b]),
                 -element(a,[])
                ],Clauses).
?-  induce_rlgg([+append([1,2],[3,4],[1,2,3,4]),
                 +append([a],[],[a]),
                 +append([],[],[]),
                 +append([],[1,2,3],[1,2,3]),
                 +append([2],[3,4],[2,3,4]),
                 +append([],[3,4],[3,4]),
                 -append([a],[b],[b]),
                 -append([c],[b],[c,a]),
                 -append([1,2],[],[1,3])
                ],Clauses).

*/


/*Begin ~source text end~*/
% extensional coverage, relative to a ground model
covers_ex((Head:-Body),Example,Model):-
    try((Head=Example,forall(element(L,Body),element(L,Model)))).

% construct a clause by means of RLGG
construct_hypothesis([E1,E2|_Es],Negs,Model,Clause):-
    write('RLGG of '),write(E1),write(' and '),write(E2),write(' is'),
    rlgg(E1,E2,Model,Cl),
    reduce(Cl,Negs,Model,Clause),!,
    nl,portray_clause(Clause),nl.
construct_hypothesis([_E1,E2|Es],Negs,Model,Clause):-
    write(' too general'),nl,
    construct_hypothesis([E2|Es],Negs,Model,Clause).


% rlgg(E1,E2,M,C) <- C is RLGG of E1 and E2 relative to M
rlgg(E1,E2,M,(H:-B)):-
    anti_unify(E1,E2,H,[],S10,[],S20),
    varsin(H,V),  % determine variables in head of clause
    rlgg_bodies(M,M,[],B,S10,_S1,S20,_S2,V).

rlgg_bodies([],_B2,B,B,S1,S1,S2,S2,_V).
rlgg_bodies([L|B1],B2,B0,B,S10,S1,S20,S2,V):-
    rlgg_literal(L,B2,B0,B00,S10,S11,S20,S21,V),
    rlgg_bodies(B1,B2,B00,B,S11,S1,S21,S2,V).

rlgg_literal(_L1,[],B,B,S1,S1,S2,S2,_V).
rlgg_literal(L1,[L2|B2],B0,B,S10,S1,S20,S2,V):-
    same_predicate(L1,L2),
    anti_unify(L1,L2,L,S10,S11,S20,S21),
 varsin(L,Vars),var_proper_subset(Vars,V),  % no new variables in literal
    !,rlgg_literal(L1,B2,[L|B0],B,S11,S1,S21,S2,V).
rlgg_literal(L1,[_L2|B2],B0,B,S10,S1,S20,S2,V):-
    rlgg_literal(L1,B2,B0,B,S10,S1,S20,S2,V).


:-op(600,xfx,'<-').

anti_unify(Term1,Term2,Term):-
    anti_unify(Term1,Term2,Term,[],_S1,[],_S2).

anti_unify(Term1,Term2,Term1,S1,S1,S2,S2):-
    Term1 == Term2,!.
anti_unify(Term1,Term2,V,S1,S1,S2,S2):-
    subs_lookup(S1,S2,Term1,Term2,V),!.
anti_unify(Term1,Term2,Term,S10,S1,S20,S2):-
    nonvar(Term1),nonvar(Term2),
    functor(Term1,F,N),functor(Term2,F,N),!,
    functor(Term,F,N),
    anti_unify_args(N,Term1,Term2,Term,S10,S1,S20,S2).
anti_unify(Term1,Term2,V,S10,[Term1<-V|S10],S20,[Term2<-V|S20]).

anti_unify_args(0,_Term1,_Term2,_Term,S1,S1,S2,S2).
anti_unify_args(N,Term1,Term2,Term,S10,S1,S20,S2):-
    N>0,N1 is N-1,
    arg(N,Term1,Arg1),
    arg(N,Term2,Arg2),
    arg(N,Term,Arg),
    anti_unify(Arg1,Arg2,Arg,S10,S11,S20,S21),
    anti_unify_args(N1,Term1,Term2,Term,S11,S1,S21,S2).

subs_lookup([T1<-V|_Subs1],[T2<-V|_Subs2],Term1,Term2,V):-
    T1 == Term1,
    T2 == Term2,!.
subs_lookup([_S1|Subs1],[_S2|Subs2],Term1,Term2,V):-
    subs_lookup(Subs1,Subs2,Term1,Term2,V).


% remove redundant literals
reduce((H:-B0),Negs,M,(H:-B)):-
    setof0(L,(element(L,B0),not(var_element(L,M))),B1),
    reduce_negs(H,B1,[],B,Negs,M).

% reduce_negs(H,B1,B0,B,N,M) <- B is a subsequence of B1
%                               such that H:-B does not
%                               cover elements of N
reduce_negs(H,[_L|B0],In,B,Negs,M):-
    append(In,B0,Body),
    not(covers_neg((H:-Body),Negs,M,_N)),!,
    reduce_negs(H,B0,In,B,Negs,M).
reduce_negs(H,[L|B0],In,B,Negs,M):-
    reduce_negs(H,B0,[L|In],B,Negs,M).
reduce_negs(H,[],Body,Body,Negs,M):-
    not(covers_neg((H:-Body),Negs,M,_N)).

covers_neg(Clause,Negs,Model,N):-
    element(N,Negs),
    covers_ex(Clause,N,Model).

bg_model([]). % in simplest case


%%% From library %%%

%%% Lists and sets

% element(X,Ys) <- X is an element of the list Ys
element(X,[X|_Ys]).
element(X,[_Y|Ys]):-
    element(X,Ys).

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


% try(Goal) <- Goal succeeds, but variables are not instantiated
try(Goal):-
    not(not(Goal)).


%%% Various.

% variant of setof/3 which succeeds with the empty list
% if no solutions can be found
setof0(X,G,L):-
    setof(X,G,L),!.
setof0(_X,_G,[]).

% same_predicate(L1,L2) <- literals L1 and L2 have
%                          the same predicate and arity
same_predicate(L1,L2):-
    functor(L1,P,N),functor(L2,P,N).

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
/*End ~source text end~*/
