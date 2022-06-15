bird(tweety).            bird(polly).
has_feathers(tweety).    has_beak(polly).

inducible((flies(X):-bird(X),has_feathers(X),has_beak(X))).
inducible((flies(X):-has_feathers(X),has_beak(X))).
inducible((flies(X):-bird(X),has_beak(X))).
inducible((flies(X):-bird(X),has_feathers(X))).
inducible((flies(X):-bird(X))).
inducible((flies(X):-has_feathers(X))).
inducible((flies(X):-has_beak(X))).
inducible((flies(_X):-true)).

% element(X,Ys) <- X is an element of the list Ys
element(X,[X|_Ys]).
element(X,[_Y|Ys]):-element(X,Ys).
