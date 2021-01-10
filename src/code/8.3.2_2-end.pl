cl(A,B):-clause(A,B). 

adder(N,X,Y,Z,Sum,Carry):-
    xorg(N-xor1,X,Y,S),
    xorg(N-xor2,Z,S,Sum),
    andg(N-and1,X,Y,C1),
    andg(N-and2,Z,S,C2),
    org(N-or1,C1,C2,Carry).

xorg(_N,X,Y,Z):-xor(X,Y,Z).
xorg(N,0,0,1):-fault(N=s1).
xorg(N,0,1,0):-fault(N=s0).
xorg(N,1,0,0):-fault(N=s0).
xorg(N,1,1,1):-fault(N=s1).

andg(_N,X,Y,Z):-and(X,Y,Z).
andg(N,0,0,1):-fault(N=s1).
andg(N,0,1,1):-fault(N=s1).
andg(N,1,0,1):-fault(N=s1).
andg(N,1,1,0):-fault(N=s0).

org(_N,X,Y,Z):-or(X,Y,Z).
org(N,0,0,1):-fault(N=s1).
org(N,0,1,0):-fault(N=s0).
org(N,1,0,0):-fault(N=s0).
org(N,1,1,0):-fault(N=s0).

xor(0,0,0).
xor(0,1,1).
xor(1,0,1).
xor(1,1,0).
or(0,0,0).
or(0,1,1).
or(1,0,1).
or(1,1,1).
and(0,0,0).
and(0,1,0).
and(1,0,0).
and(1,1,1).
