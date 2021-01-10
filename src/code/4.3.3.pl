properties(Inst,Props):-
    attributes(Attrs),
    properties(Attrs,Inst,Props).

properties([],_Inst,[]).
properties([Attr|Attrs],Inst,[Attr=Value|Props]):-
    get_value(Attr,Inst,Value),!,  % only first answer
    properties(Attrs,Inst,Props).

attributes([function,material,action]).

get_value(A,B,C):-
    Goal =.. [A,B,C],
    call(Goal).

/** <examples>
?- properties(saxophone,P).
*/
