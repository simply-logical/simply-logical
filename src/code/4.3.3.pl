properties(Inst,Props):-
    attributes(Attrs),
    properties(Attrs,Inst,Props).

properties([],_Inst,[]).
properties([Attr|Attrs],Inst,[Attr=Value|Props]):-
    get_value(Attr,Inst,Value),!,  % only first answer
    properties(Attrs,Inst,Props).

attributes([function,material,action]).

get_value(A,B,C):-
    ( A=function -> function(B,C)
    ; A=material -> material(B,C)
    ; A=action   -> action(B,C)
    ).

/** <examples>
?- properties(saxophone,P).
*/
