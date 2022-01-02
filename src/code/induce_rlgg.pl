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
