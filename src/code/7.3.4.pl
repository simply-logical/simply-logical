question(Q)          --> [who],[is],property(s,_X=>Q).
question(Q)          --> [is],proper_noun(N,X),
                         property(N,X=>Q).
question((Q1,Q2))    --> [are],[some],noun(p,sk=>Q1),
                         property(p,sk=>Q2).

/** <examples>
?- phrase(question(human(L)),[is,socrates,a,human]).
?- phrase(sentence([(mortal(socrates):-true)]),Answer).
*/
