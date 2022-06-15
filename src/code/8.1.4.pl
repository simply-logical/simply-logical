explain(A,E0,[default(Name)|E]):-
    default(Name,(A:-B)),       % explain by default rule
    explain(B,E0,E),
    not contradiction(Name,E),  % default applicable
    not contradiction(A,E).     % A consistent with E

/** <examples>
?- explain(flies(dracula),E).
?- explain(not flies(dracula),E).
*/
