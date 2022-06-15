roman(N) --> d(N4,4),d(N3,3),d(N2,2),d(N1,1),{N is N4*1000+N3*100+N2*10+N1}.

i(1) --> [i].
i(2) --> [x].
i(3) --> [c].
i(4) --> [m].

v(1) --> [v].
v(2) --> [l].
v(3) --> [d].

d(0,_) --> [].
d(1,N) --> i(N).
d(2,N) --> i(N),i(N).
d(3,N) --> i(N),i(N),i(N).
d(4,N) --> i(N),v(N).
%d(4,N) --> i(N),i(N),i(N),i(N).
d(5,N) --> v(N).
d(6,N) --> v(N),i(N).
d(7,N) --> v(N),i(N),i(N).
d(8,N) --> v(N),i(N),i(N),i(N).
d(9,N) --> i(N),{N1 is N+1},i(N1).

/** <examples>
?- phrase(roman(1984),R).
?- phrase(roman(Y),[m,c,m,l,x,x,x,i,v]).
*/
