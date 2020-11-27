conj_append(true,Ys,Ys).
conj_append(X,Ys,(X,Ys)):-X\=true,X\=(_One,_TheOther).
conj_append((X,Xs),Ys,(X,Zs)):-conj_append(Xs,Ys,Zs).

student_of(S,T):-teaches(T,C),follows(S,C).
teaches(peter,cs).
teaches(peter,ai).
follows(maria,cs).
follows(paul,ai).

is_bird(X):-has_feathers(X),lays_eggs(X).
is_fish(X):-has_gills(X),lays_eggs(X).
has_feathers(tweety).
lays_eggs(tweety).
