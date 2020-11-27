/*
 This part is inherited from others.
*/
%%% FIXME: Manually copied from 7.3.3
:-op(600,xfy,'=>').
sentence(C)                      --> determiner(N,M1,M2,C),
                                     noun(N,M1),
                                     verb_phrase(N,M2).
sentence([(L:-true)])            --> proper_noun(N,X),
                                     verb_phrase(N,X=>L).
verb_phrase(s,M)                 --> [is],property(s,M).
verb_phrase(p,M)                 --> [are],property(p,M).
property(s,M)                    --> [a],noun(s,M).
property(p,M)                    --> noun(p,M).
property(_N,X=>mortal(X))        --> [mortal].
determiner(s,X=>B,X=>H,[(H:-B)]) --> [every].
determiner(p,sk=>H1,sk=>H2,[(H1:-true),(H2:-true)]) --> [some].
proper_noun(s,socrates)          --> [socrates].
noun(s,X=>human(X))              --> [human].
noun(p,X=>human(X))              --> [humans].
noun(s,X=>living_being(X))       --> [living],[being].
noun(p,X=>living_being(X))       --> [living],[beings].

%%% FIXME: Manually copied from 7.3.4
question(Q)          --> [who],[is],property(s,_X=>Q).
question(Q)          --> [is],proper_noun(N,X),
                         property(N,X=>Q).
question((Q1,Q2))    --> [are],[some],noun(p,sk=>Q1),
                         property(p,sk=>Q2).
/*
 This is the end of inheritance.
*/
