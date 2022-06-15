:-op(600,xfx,'->'). % operator for inverse substitution

% anti-unification with inverse subst.s and accumulators
anti_unify(Term1,Term2,Term1,S1,S1,S2,S2):-
    Term1 == Term2,!.                         % same terms
anti_unify(Term1,Term2,V,S1,S1,S2,S2):-
    subs_lookup(S1,S2,Term1,Term2,V),!.       % already substituted
anti_unify(Term1,Term2,Term,S10,S1,S20,S2):-
    nonvar(Term1),nonvar(Term2),
    functor(Term1,F,N),functor(Term2,F,N),!,  % same
    functor(Term,F,N),                        % functor
    anti_unify_args(N,Term1,Term2,Term,S10,S1,S20,S2).
anti_unify(T1,T2,V,S10,[T1->V|S10],S20,[T2->V|S20]).

anti_unify_args(0,_Term1,_Term2,_Term,S1,S1,S2,S2).
anti_unify_args(N,Term1,Term2,Term,S10,S1,S20,S2):-
    N>0,N1 is N-1,
    arg(N,Term1,Arg1),
    arg(N,Term2,Arg2),
    arg(N,Term,Arg),
    anti_unify(Arg1,Arg2,Arg,S10,S11,S20,S21),
    anti_unify_args(N1,Term1,Term2,Term,S11,S1,S21,S2).

subs_lookup([T1->V|_Subs1],[T2->V|_Subs2],Term1,Term2,V):-
    T1 == Term1,
    T2 == Term2,!.  % no alternative solutions needed
subs_lookup([_S1|Subs1],[_S2|Subs2],Term1,Term2,V):-
    subs_lookup(Subs1,Subs2,Term1,Term2,V).

:-op(900,fy,not).

% theta_lgg(C1,C2,C) <- C is the  θ-LGG of clause C1 and C2
theta_lgg((H1:-B1),(H2:-B2),(H:-B)):-
    anti_unify(H1,H2,H,[],S10,[],S20),             % heads
    theta_lgg_bodies(B1,B2,[],B,S10,_S1,S20,_S2).  % bodies

% select literal from first body...
theta_lgg_bodies([],_B2,B,B,S1,S1,S2,S2).
theta_lgg_bodies([L|B1],B2,B0,B,S10,S1,S20,S2):-
    theta_lgg_literal(L,B2,B0,B00,S10,S11,S20,S21),
    theta_lgg_bodies(B1,B2,B00,B,S11,S1,S21,S2).

% and one from second body
theta_lgg_literal(_L1,[],B,B,S1,S1,S2,S2).
theta_lgg_literal(L1,[L2|B2],B0,B,S10,S1,S20,S2):-
    same_predicate(L1,L2),anti_unify(L1,L2,L,S10,S11,S20,S21),
    theta_lgg_literal(L1,B2,[L|B0],B,S11,S1,S21,S2).
theta_lgg_literal(L1,[L2|B2],B0,B,S10,S1,S20,S2):-
    not same_predicate(L1,L2),
    theta_lgg_literal(L1,B2,B0,B,S10,S1,S20,S2).

% same_predicate(L1,L2) <- literals L1 and L2 have
%                          the same predicate and arity
same_predicate(L1,L2):-functor(L1,P,N),functor(L2,P,N).
