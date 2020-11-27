element(X,[X|_Ys]).
element(X,[_Y|Ys]):-
    element(X,Ys).

cl(likes(peter,S),student_of(S,peter)).
cl(likes(X,Y),friend(Y,X)).

cl(flies(X),(bird(X),not(abnormal(X)))).
cl(flies1(X),(not(abnormal(X),bird(X)))).
cl(abnormal(X),penguin(X)).
cl(abnormal(X),dead(X)).
cl(bird(X),penguin(X)).
cl(bird(X),sparrow(X)).
