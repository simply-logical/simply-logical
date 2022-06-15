default((not flies(X):-mammal(X))).
default((flies(X):-bat(X))).
default((not flies(X):-dead(X))).
rule((mammal(X):-bat(X))).
rule((bat(dracula):-true)).
rule((dead(dracula):-true)).

/** <examples>
?- explain(flies(dracula),E).
?- explain(not flies(dracula),E).
*/
