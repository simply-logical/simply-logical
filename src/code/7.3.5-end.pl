question(Q)          --> [who],[is],property(s,_X=>Q).
question(Q)          --> [is],proper_noun(N,X),
                         property(N,X=>Q).
question((Q1,Q2))    --> [are],[some],noun(p,sk=>Q1),
                         property(p,sk=>Q2).

%%% auxiliary predicate
copy_element(X,Ys):-
    member(X1,Ys),
    copy_term(X1,X).
