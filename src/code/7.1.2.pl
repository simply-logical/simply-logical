noun_phrase          --> article,noun_phrase2.
noun_phrase2         --> noun.
noun_phrase2         --> adjective,noun_phrase2.
article              --> [the].
adjective            --> [lazy].
adjective            --> [rapid].
noun                 --> [turtle].

/** <examples>
?- phrase(noun_phrase,[the,lazy,rapid,turtle]).
?- phrase(noun_phrase,L).
*/
