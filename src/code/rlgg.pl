% rlgg(E1,E2,M,C) <- C is RLGG of E1 and E2 relative to M
rlgg(E1,E2,M,(H:-B)):-
    anti_unify(E1,E2,H,[],S10,[],S20),
    varsin(H,V),  % determine variables in head of clause
    rlgg_bodies(M,M,[],B,S10,_S1,S20,_S2,V).

% varsin(T,V) <- V is list of variables occuring in term T
%                (standard predicate in many Prologs)

rlgg_bodies([],_B2,B,B,S1,S1,S2,S2,_V).
rlgg_bodies([L|B1],B2,B0,B,S10,S1,S20,S2,V):-
    rlgg_literal(L,B2,B0,B00,S10,S11,S20,S21,V),
    rlgg_bodies(B1,B2,B00,B,S11,S1,S21,S2,V).

rlgg_literal(_L1,[],B,B,S1,S1,S2,S2,_V).
rlgg_literal(L1,[L2|B2],B0,B,S10,S1,S20,S2,V):-
    same_predicate(L1,L2),
    anti_unify(L1,L2,L,S10,S11,S20,S21),
    varsin(L,Vars),
    var_proper_subset(Vars,V),  % no new variables
    !,rlgg_literal(L1,B2,[L|B0],B,S11,S1,S21,S2,V).
rlgg_literal(L1,[_L2|B2],B0,B,S10,S1,S20,S2,V):-
    rlgg_literal(L1,B2,B0,B,S10,S1,S20,S2,V).

%%% var_… uses == rather than unification (Section 10.2 (appendix))

/** <examples>
?-rlgg( append([1,2],[3,4],[1,2,3,4]),
        append([a],[],[a]),
        [append([1,2],[3,4],[1,2,3,4]), append([a],[],[a]),
         append([],[],[]),              append([2],[3,4],[2,3,4])],
       C).
*/
