%:-use_rendering(svgtree).  % uncomment to render parse tree graphically

sentence(s(NP,VP))            --> noun_phrase(NP),
                                  verb_phrase(VP).
noun_phrase(np(N))            --> proper_noun(N).
noun_phrase(np(Art,Adj,N))    --> article(Art),
                                  adjective(Adj),
                                  noun(N).
noun_phrase(np(Art,N))        --> article(Art),noun(N).
verb_phrase(vp(IV))           --> intransitive_verb(IV).
verb_phrase(vp(TV,NP))        --> transitive_verb(TV),
                                  noun_phrase(NP).
article(art(the))             --> [the].
adjective(adj(lazy))          --> [lazy].
adjective(adj(rapid))         --> [rapid].
proper_noun(pn(achilles))     --> [achilles].
noun(n(turtle))               --> [turtle].
intransitive_verb(iv(sleeps)) --> [sleeps].
transitive_verb(tv(beats))    --> [beats].

/** <examples>
?- phrase(sentence(T),[achilles,beats,the,lazy,turtle]).
?- phrase(sentence(s(np(pn(achilles)),
                     vp(tv(beats),np(art(the),adj(lazy),n(turtle)))
                   )),
          L).
*/
