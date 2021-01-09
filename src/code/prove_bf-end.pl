%%% auxiliary predicates
conj_append(A,B,C):-
    ( A=true    -> B=C
    ; A=(A1,A2) -> C=(A1,C2),conj_append(A2,B,C2)
    ; otherwise -> C=(A,B)
    ).

%%% object-level program
cl(brother(X,Y),brother(Y,X)).
cl(brother(X,Y),(brother(X,Z),brother(Z,Y))).
cl(brother(peter,paul),true).
cl(brother(adrian,paul),true).
