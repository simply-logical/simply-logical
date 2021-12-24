transform(Formula,Clauses):-
   rewrite_implications(Formula,F1),
   negations_inside(F1,F2),
   prenex_normal_form(F2,F3),
   skolemise(F3,F4),
   conjunctive_normal_form(F4,F5),
   clausal_form(F5,Clauses).

/** <examples>
?- transform( forall(Y,exists(X,mother_of(X,Y))) &
             -forall(Z,exists(W,woman(Z) => mother_of(Z,W))),
              CL).
?- transform( forall(X,exists(Y,mouse(X) => tail_of(Y,X))),CL).
?- transform( forall(X,exists(Y,loves(X,Y)) & forall(Z,loves(Y,Z))),CL).
?- transform( forall(X,forall(Y,exists(Z,number(X) & number(Y) => maximum(Z,X,Y)))),CL).
*/
