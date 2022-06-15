complete(Program,Comp):-
    separate_definitions(Program,Definitions),
    complete_definitions(Definitions,CompDefs,Heads),
    handle_undefined(Program,Heads,CompDefs,Comp).

separate_definitions([],[]).
separate_definitions([([Head]:-Body)|Clauses],[[([Head]:-Body)|Def]|Defs]):-
    get_definition(Clauses,Head,Def,Rest),
    separate_definitions(Rest,Defs).
    
get_definition([],_Head,[],[]).
get_definition([([H]:-B)|Clauses],Head,[([H]:-B)|Def],Rest):-
    same_predicate(H,Head),
    get_definition(Clauses,Head,Def,Rest).
get_definition([([H]:-B)|Clauses],Head,Def,[([H]:-B)|Rest]):-
    not same_predicate(H,Head),
    get_definition(Clauses,Head,Def,Rest).

/** <examples>
?- complete([ ([bird(tweety)]:-[]),
              ([flies(X)]:-[bird(X),not abnormal(X)]) ],
            F),
transform(F,CP).
?- complete([ ([likes(peter,S)]:-[student_of(S,peter)]),
              ([student_of(paul,peter)]:-[]) ],
            F),
transform(F,CP).
*/
