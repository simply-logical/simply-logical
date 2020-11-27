:-op(600,xfx,'->'). % operator for inverse substitution

% anti_unify(T1,T2,T) <-  T is the anti-unification
%                         of T1 and T2
anti_unify(Term1,Term2,Term):-
    anti_unify(Term1,Term2,Term,[],_S1,[],_S2).

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

/** <examples>
?-anti_unify(2*2=2+2,2*3=3+3,T).
?-anti_unify(2*2=2+2,2*3=3+3,T,[],S1,[],S2).
?-anti_unify(2*(1/3)=2/3,3*(1/2)=3/2,T,[],S1,[],S2).
*/
