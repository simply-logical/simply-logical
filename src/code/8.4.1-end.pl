cl(notflies(X),(mammal(X),not flying_mammal(X))).
cl(notflies(X),(dead(X),not flying_deadthing(X))).
cl(flies(X),(bat(X),not nonflying_bat(X))).

cl(mammal(X),bat(X)).
cl(bat(dracula),true).
cl(dead(dracula),true).
cl(flying_mammal(X),bat(X)).
cl(nonflying_bat(X),dead(X)).

% element(X,Ys) <- X is an element of the list Ys
element(X,[X|_Ys]).
element(X,[_Y|Ys]):-element(X,Ys).
