% Classes
isa(instrument,top).
isa(wind,instrument).
isa(string,instrument).
isa(percussion,instrument).
isa(woodwind,wind).
isa(brass,wind).
isa(plucked,string).
isa(bowed,string).
isa(keyboard,string).
isa(tuned,percussion).
isa(untuned,percussion).

% Instances
inst(recorder,woodwind).
inst(flute,woodwind).
inst(oboe,woodwind).
inst(saxophone,woodwind).
inst(trumpet,brass).
inst(trombone,brass).
inst(horn,brass).
inst(guitar,plucked).
inst(lute,plucked).
inst(harp,plucked).
inst(violin,bowed).
inst(cello,bowed).
inst(harpsichord,keyboard).
inst(piano,keyboard).
inst(triangle,tuned).
inst(kettledrum,tuned).
inst(cymbal,untuned).
inst(snaredrum,untuned).

% Class properties
prop(instrument,function,musical).
prop(string,material,wood).
prop(percussion,material,metal).
prop(percussion,action,hammered).
prop(woodwind,material,wood).
prop(brass,material,metal).
prop(brass,action,reed(lip)).
prop(plucked,action,plucked).
prop(bowed,action,bowed).

% Instance properties
prop(flute,material,metal).
prop(oboe,action,reed(double)).
prop(saxophone,material,metal).
prop(saxophone,action,reed(single)).
prop(harpsichord,action,plucked).
prop(piano,action,hammered).


properties_sn(Inst,Props):-
    props(Inst,InstProps),              % properties of instance
    inst(Inst,Class),
    inherit_sn(Class,InstProps,Props).  % inherit the rest

props(IC,Props):-
  findall(Attr=Value,prop(IC,Attr,Value),Props).

inherit_sn(top,Props,Props).
inherit_sn(Class,SpecificProps,AllProps):-
    props(Class,GeneralProps),              % properties of this class
    override(SpecificProps,GeneralProps,Props),
    isa(Class,SuperClass),                  % climb hierarchy
    inherit_sn(SuperClass,Props,AllProps).  % inherit rest
