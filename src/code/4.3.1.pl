% Classes
instrument(X):-wind(X).
instrument(X):-string(X).
instrument(X):-percussion(X).
wind(X):-woodwind(X).
wind(X):-brass(X).
string(X):-plucked(X).
string(X):-bowed(X).
string(X):-keyboard(X).
percussion(X):-tuned(X).
percussion(X):-untuned(X).

% Instances
woodwind(recorder).
woodwind(flute).
woodwind(oboe).
woodwind(saxophone).
brass(trumpet).
brass(trombone).
brass(horn).
plucked(guitar).
plucked(lute).
plucked(harp).
bowed(violin).
bowed(cello).
keyboard(harpsichord).
keyboard(piano).
tuned(triangle).
tuned(kettledrum).
untuned(cymbal).
untuned(snaredrum).

/** <examples>
?- instrument(X).
?- plucked(keyboard).
*/
