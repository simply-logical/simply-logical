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

/** <examples>
?-theta_lgg((element(c,[b,c]):-[element(c,[c])]),
            (element(d,[b,c,d]):-[element(d,[c,d]),element(d,[d])]),
            C).
?-theta_lgg((reverse([2,1],[3],[1,2,3]):-[reverse([1],[2,3],[1,2,3])]),
            (reverse([a],[],[a]):-[reverse([],[a],[a])]),
            C).
*/
