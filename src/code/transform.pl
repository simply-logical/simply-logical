transform(Formula,Clauses):-
   rewrite_implications(Formula,F1),
   negations_inside(F1,F2),
   prenex_normal_form(F2,F3),
   skolemise(F3,F4),
   conjunctive_normal_form(F4,F5),
   clausal_form(F5,Clauses).

