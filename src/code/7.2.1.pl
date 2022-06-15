sentence                      --> noun_phrase(N),verb_phrase(N).
noun_phrase(N)                --> article(N),noun(N).
verb_phrase(N)                --> intransitive_verb(N).
article(singular)             --> [a].
article(singular)             --> [the].
article(plural)               --> [the].
noun(singular)                --> [turtle].
noun(plural)                  --> [turtles].
intransitive_verb(singular)   --> [sleeps].
intransitive_verb(plural)     --> [sleep].

/** <examples>
?- phrase(sentence,L).
*/
