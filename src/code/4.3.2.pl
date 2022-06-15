function(X,musical):-instrument(X).

% Materials
material(flute,metal).
material(saxophone,metal).
material(X,wood):-woodwind(X).
material(X,metal):-brass(X).
material(X,wood):-string(X).
material(X,metal):-percussion(X).

% Actions
action(oboe,reed(double)).
action(saxophone,reed(single)).
action(harpsichord,plucked).
action(piano,hammered).
action(X,reed(lip)):-brass(X).
action(X,plucked):-plucked(X).
action(X,bowed):-bowed(X).
action(X,hammered):-percussion(X).

/** <examples>
?- material(flute,M).
*/
