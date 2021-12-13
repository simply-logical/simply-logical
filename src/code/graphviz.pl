:-use_rendering(graphviz).

%%% Meta-interpreter plotting (part of) the SLD-tree using Graphviz %%%

sld(Goal,DotString):-
	sld(Goal,5,DotString).	% default depth bound

sld(Goal,D,_):-
	gv_root((?-Goal),0),
	prove_d(Goal,Goal,0,D),
	fail.	% failure-driven loop to get all solutions
sld(_,_,digraph([Options|G])):-
    gv_options(Options),
	gv_graph(G).

% meta-interpreter with complete resolvent and depth bound
prove_d(true,Goal,N,_):-!,
	gv_answer(N,Goal).
prove_d((A,B),Goal,N,D):-!,
	D>0, D1 is D-1,
	resolve(A,C),
	conj_append(C,B,E),
	gv_node(N,(:-E),N1),
	prove_d(E,Goal,N1,D1).
prove_d(A,Goal,N,D):-
	D>0, D1 is D-1,
	resolve(A,B),
	gv_node(N,(:-B),N1),
	prove_d(B,Goal,N1,D1).

%resolve(A,true):-
%	predicate_property(A,built_in),!,
%	call(A).
resolve(A,B):-
	clause(A,B).

% testing
student_of(X,T):-follows(X,C),teaches(T,C).
follows(paul,computer_science).
follows(paul,expert_systems).
follows(maria,ai_techniques).
teaches(adrian,expert_systems).
teaches(peter,ai_techniques).
teaches(peter,computer_science).

brother_of(paul,peter).
brother_of(peter,adrian).
brother_of(X,Y):-brother_of(X,Z),brother_of(Z,Y).
brother_of(X,Y):-brother_of(Y,X).

sld1(DS):-sld(student_of(_,peter),DS).
sld2(DS):-sld(brother_of(paul,_),DS).


%%% Utilities %%%

conj_append(true,Ys,Ys).
conj_append(X,Ys,(X,Ys)):-	% single-element conjunction
	X \= true, 
	X \= (_,_).
conj_append((X,Xs),Ys,(X,Zs)):-
	conj_append(Xs,Ys,Zs).

%%% Graphviz utilities %%%

% Graphviz formatting
gv_options(node([shape=none,fontname='Courier'])).

gv_graph(L):-
	findall(node(N,L),retract(gv_node(N,L)),NL),
	findall((F -> T),retract(gv_edge(F,T,_LL)),EL), % edge attributes not handled for the moment
	merge(NL,EL,L).

gv_max_id(1000).	% max number of nodes in the graph

% write the root of a tree and initialise node IDs
gv_root(L,N):-
	assert(gv_node(N,[label=L])),
	gv_init_ids(N).

% add a node with label L and parent N0
gv_node(N0,L,N):-
	gv_id(N),
	assert(gv_node(N,[label=L])),
	assert(gv_edge(N0,N,[])).

% add a specially formatted leaf
gv_answer(N0,L):-
	assert(gv_node(N0,[label=L,shape=ellipse,style=dotted,fontsize=10])).

% generate a new node ID
gv_id(N):-
	retract('$gv_id'(N0)),
	gv_max_id(M),
	N0 < M,	% don't generate infinite graphs
	N is N0+1,
	assert('$gv_id'(N)).

% initialise node IDs, next free ID is N+1
gv_init_ids(N) :-
	retractall('$gv_id'(_)),
	assert('$gv_id'(N)).
