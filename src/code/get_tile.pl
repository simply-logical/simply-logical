% get_tile(P,N,T) <- pos. P contains tile T at square N
get_tile(Pos,N,T):-
    get_tile(Pos,1,N,T).

get_tile([X|_Xs],N,N,X).
get_tile([_X|Xs],N0,N,Y):-
    N1 is N0+1,
    get_tile(Xs,N1,N,Y).

% replace(P,N,T,P1) <- P1 is P with tile T at square N
replace([_X|Xs],1,Y,[Y|Xs]).
replace([X|Xs],N,Y,[X|Zs]):-
    N>1, N1 is N-1,
    replace(Xs,N1,Y,Zs).

/** <examples>
?-get_tile([b,b,b,e,w,w,w],N,T).
?-replace([b,b,b,e,w,w,w],3,e,Pos).
*/
