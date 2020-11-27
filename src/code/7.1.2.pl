sentence             --> noun_phrase.
noun_phrase          --> article,noun_phrase2.
noun_phrase2         --> noun.
noun_phrase2         --> adjective,noun_phrase2.
article              --> [the].
adjective            --> [lazy].
adjective            --> [rapid].
noun                 --> [turtle].

/** <examples>
?- phrase(sentence,[the,lazy,rapid,turtle]).
*/
