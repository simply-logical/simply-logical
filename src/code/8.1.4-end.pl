% default(Name,Rule)
default(mammals_dont_fly(X),(not flies(X):-mammal(X))).
default(bats_fly(X),(flies(X):-bat(X))).
default(dead_things_dont_fly(X),(not flies(X):-dead(X))).
rule((mammal(X):-bat(X))).
rule((bat(dracula):-true)).
rule((dead(dracula):-true)).
% bats are flying mammals
rule((not mammals_dont_fly(X):-bat(X))).
% dead bats don't fly
rule((not bats_fly(X):-dead(X))).
