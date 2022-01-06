% :-use_rendering(chess). % Uncomment this line for chess renderer

%%% Place N queens on an N-by-N chess board such that none of them are attacked
%%% Columns are listed in the order row 1, row 2, ..., row 8
nqueens(N,Columns) :-
    setof(X,between(1,N,X),Rows),
    permute(Rows,Columns), % generator
    test(Columns).         % tester

%%% blind generator: permute rows
permute([],[]).
permute(L,[X|PR]):-
	remove_one(X,L,R),
	permute(R,PR).
    
remove_one(X,[X|Ys],Ys).
remove_one(X,[Y|Ys],[Y|Zs]):-
	remove_one(X,Ys,Zs).

%%% tester
test([]).
test([Column|Columns]) :-
    noattack(Column,Columns,1),
    test(Columns).
    
noattack(_,[],_).
noattack(Y,[Y1|Ylist],Xdist) :-
    abs(Y-Y1) =\= Xdist,
    Xdist1 is Xdist+1,
    noattack(Y,Ylist,Xdist1).

/** <examples>
?- nqueens(8,Columns).
*/

  
