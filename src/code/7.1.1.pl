sentence             --> noun_phrase,verb_phrase.
noun_phrase          --> proper_noun.
noun_phrase          --> article,adjective,noun.
noun_phrase          --> article,noun.
verb_phrase          --> intransitive_verb.
verb_phrase          --> transitive_verb,noun_phrase.
article              --> [the].
adjective            --> [lazy].
adjective            --> [rapid].
proper_noun          --> [achilles].
noun                 --> [turtle].
intransitive_verb    --> [sleeps].
transitive_verb      --> [beats].

/** <examples>
?- phrase(sentence,[achilles,beats,the,lazy,turtle]).
*/
