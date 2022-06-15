properties_fr(Inst,Props):-
    instance(Inst,Class,InstProps),         % instance properties
    inherit_fr(Class,InstProps,Props).      % inherit the rest

inherit_fr(top,Props,Props).
inherit_fr(Class,SpecificProps,AllProps):-
    class(Class,SuperClass,GeneralProps),   % this class
    override(SpecificProps,GeneralProps,Props),
    inherit_fr(SuperClass,Props,AllProps).  % inherit rest

/** <examples>
?- properties_fr(saxophone,P).
?- properties_fr(I,[function=musical,material=metal,A]).
*/
