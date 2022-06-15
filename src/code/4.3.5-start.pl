% Classes
class(instrument,top,[]).
class(wind,instrument,[function=musical]).
class(string,instrument,[material=wood]).
class(percussion,instrument,[material=metal,action=hammered]).
class(woodwind,wind,[material=wood]).
class(brass,wind,[material=metal,action=reed(lip)]).
class(plucked,string,[action=plucked]).
class(bowed,string,[action=bowed]).
class(keyboard,string,[]).
class(tuned,percussion,[]).
class(untuned,percussion,[]).

% Instances
instance(recorder,woodwind,[]).
instance(flute,woodwind,[material=metal]).
instance(oboe,woodwind,[action=reed(double)]).
instance(saxophone,woodwind,[material=metal,action=reed(single)]).
instance(trumpet,brass,[]).
instance(trombone,brass,[]).
instance(horn,brass,[]).
instance(guitar,plucked,[]).
instance(lute,plucked,[]).
instance(harp,plucked,[]).
instance(violin,bowed,[]).
instance(cello,bowed,[]).
instance(harpsichord,keyboard,[action=plucked]).
instance(piano,keyboard,[action=hammered]).
instance(triangle,tuned,[]).
instance(kettledrum,tuned,[]).
instance(cymbal,untuned,[]).
instance(snaredrum,untuned,[]).
