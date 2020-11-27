element(X,[X|_Ys]).
element(X,[_Y|Ys]):-element(X,Ys).
