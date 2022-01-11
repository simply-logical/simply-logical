prop_atom(married).
prop_atom(bachelor).
prop_atom(man).
prop_atom(adult).


% Propositional atoms are trivially ground 
ground_atom(A):-prop_atom(A).


/** <examples>
?- herbrand_base(B). 
?- herbrand_interpretation(I). 
?- ground_clause(C).
?- herbrand_interpretation(I),true_clause((married;bachelor:-man,adult),I).
?- herbrand_interpretation(I),false_clause((married;bachelor:-man,adult),I).
?- herbrand_interpretation(I),true_program([(man:-true),(false:-bachelor)),(married;bachelor:-man,adult)],I).
?- herbrand_model([(man:-true),(false:-bachelor)),(married;bachelor:-man,adult)],I).
?- logical_consequence((married:-adult),[(man:-true),(false:-bachelor)),(married;bachelor:-man,adult)],I).
?- logical_consequence((married:-true),[(man:-true),(false:-bachelor)),(married;bachelor:-man,adult)],I).
*/
