sentence      --> determiner,noun,verb_phrase.
sentence      --> proper_noun,verb_phrase.
verb_phrase   --> [is],property.
property      --> [a],noun.
property      --> [mortal].
determiner    --> [every].
proper_noun   --> [socrates].
noun          --> [human].

/** <examples>
?- phrase(sentence,[every,human,is,mortal]).
?- phrase(sentence,[socrates,is,a,human]).
*/
