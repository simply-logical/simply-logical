% if A and B then C means if(then(and(A,B),C))
:-op(900,fx,if).
:-op(800,xfx,then).
:-op(700,yfx,and).

% object-level rules
if has_feathers and lays_eggs then is_bird.
if has_gills and lays_eggs then is_fish.
if tweety then has_feathers.
if tweety then lays_eggs.

/** <examples>
?-if tweety then C.
?-if A and lays_eggs then is_bird.
*/
