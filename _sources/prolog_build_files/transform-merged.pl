transform(Formula,Clauses):-
   rewrite_implications(Formula,F1),
   negations_inside(F1,F2),
   prenex_normal_form(F2,F3),
   skolemise(F3,F4),
   conjunctive_normal_form(F4,F5),
   clausal_form(F5,Clauses).

/** <examples>
?- transform( forall(Y,exists(X,mother_of(X,Y))) &
             -forall(Z,exists(W,woman(Z) => mother_of(Z,W))),
              CL).
?- transform( forall(X,exists(Y,mouse(X) => tail_of(Y,X))),CL).
?- transform( forall(X,exists(Y,loves(X,Y)) & forall(Z,loves(Y,Z))),CL).
?- transform( forall(X,forall(Y,exists(Z,number(X) & number(Y) => maximum(Z,X,Y)))),CL).
*/


/*Begin ~source text end~*/
%%% B.1  From predicate logic to clausal logic %%%

:-op(900,xfx,'=>').  % implication
:-op(800,xfy,&).  % conjunction
:-op(800,xfy,v).  % disjunction
:-op(400,fy,-).  % negation

:-op(400,fy,not).  % negation

% rewrite_implications(F1,F2) <- F2 is a predicate logic formula
%                                without implications, logically equivalent to F1
rewrite_implications(A,A):-  % base case
   logical_atom(A).
rewrite_implications(A => B, -C v D):-  % implication
   rewrite_implications(A,C),
   rewrite_implications(B,D).
rewrite_implications(A & B, C & D):-  % no change;
   rewrite_implications(A,C),  % try rest of formula
   rewrite_implications(B,D).
rewrite_implications(A v B, C v D):-
   rewrite_implications(A,C),
   rewrite_implications(B,D).
rewrite_implications(-A,-C):-
   rewrite_implications(A,C).
rewrite_implications(forall(X,B), forall(X,D)):-
   rewrite_implications(B,D).
rewrite_implications(exists(X,B), exists(X,D)):-
   rewrite_implications(B,D).


% negations_inside(F1,F2) <- F2 is a predicate logic formula with negations
%                            only preceding literals, logically equivalent to F1
negations_inside(A,A):-  % base case
   literal(A).
negations_inside(-(A & B), C v D):-  % De Morgan (1)
   negations_inside(-A,C),
   negations_inside(-B,D).
negations_inside(-(A v B), C &  D):-  % De Morgan (2)
   negations_inside(-A,C),
   negations_inside(-B,D).
negations_inside(-(-A),B):-  % double negation
   negations_inside(A,B).
negations_inside(-exists(X,A),forall(X,B)):-  % quantifiers
   negations_inside(-A,B).
negations_inside(-forall(X,A),exists(X,B)):-
   negations_inside(-A,B).
negations_inside(A & B, C & D):-  % no change;
   negations_inside(A,C),  % try rest of formula
   negations_inside(B,D).
negations_inside(A v B, C v  D):-
   negations_inside(A,C),
   negations_inside(B,D).
negations_inside(exists(X,A),exists(X,B)):-
   negations_inside(A,B).
negations_inside(forall(X,A),forall(X,B)):-
   negations_inside(A,B).

% prenex_normal_form(F1,F2) <- F2 is a predicate logic formula with all
%                              quantifiers in front, logically equivalent to F1
prenex_normal_form(F,PNF):-
    pnf(F,PNF,B,B).

pnf(A,V,V,A):-  % base case
    literal(A).
pnf(forall(X,F),forall(X,Quants),V,Body):-
    pnf(F,Quants,V,Body).
pnf(exists(X,F),exists(X,Quants),V,Body):-
    pnf(F,Quants,V,Body).
pnf(A & B,Quants,V,BodyA & BodyB):-
    pnf(A,Quants,QB,BodyA),
    pnf(B,QB,V,BodyB).
pnf(A v B,Quants,V,BodyA v BodyB):-
    pnf(A,Quants,QB,BodyA),
    pnf(B,QB,V,BodyB).


% skolemise(F1,F2) <-  F2 is obtained from F1 by replacing
%                     all existentially quantified variables by Skolem terms
skolemise(F1,F2):-
   skolemise(F1,[],1,F2).
skolemise(forall(X,F1),VarList,N,F2):-!,  % remove univ. quantifier,
   skolemise(F1,[X|VarList],N,F2).  % memorise variable
skolemise(exists(X,F1),VarList,N,F2):-!,
   skolem_term(X,VarList,N),  % unify with Skolem term
   N1 is N+1,
   skolemise(F1,VarList,N1,F2).
skolemise(F,_,_,F).  % copy rest of formula

skolem_term(X,VarList,N):-
   C is N+48,  % number -> character
   name(Functor,[115,107,C]),  % Skolem functor skN
   X =.. [Functor|VarList].


conjunctive_normal_form(A,A):-  % base case
   disjunction_of_literals(A),!.
conjunctive_normal_form((A & B) v C, D & E ):-!,  % distribution
   conjunctive_normal_form(A v C,D),
   conjunctive_normal_form(B v C,E).
conjunctive_normal_form(A v (B & C), D & E ):- !,  % distribution
   conjunctive_normal_form(A v B,D),
   conjunctive_normal_form(A v C,E).
conjunctive_normal_form(A & B,C & D):-  % conjuction
   conjunctive_normal_form(A,C),
   conjunctive_normal_form(B,D).
conjunctive_normal_form(A v B,E):-  % other cases
   conjunctive_normal_form(A,C),
   conjunctive_normal_form(B,D),
   conjunctive_normal_form(C v D,E).


clausal_form(A,[Clause]):-
   disjunction_of_literals(A),
   make_clause(A,Clause).
clausal_form(A & B,Clauses):-
   clausal_form(A,ClausesA),
   clausal_form(B,ClausesB),
   append(ClausesA,ClausesB,Clauses).

make_clause(P,([P]:-[])):-
   logical_atom(P).
make_clause(-N,([]:-[N])):-
   logical_atom(N).
make_clause(A v B,(HeadAB:-BodyAB)):-
   make_clause(A,(HeadA:-BodyA)),
   make_clause(B,(HeadB:-BodyB)),
   append(HeadA,HeadB,HeadAB),
   append(BodyA,BodyB,BodyAB).


%%%%%%%%%%%%%% basics %%%%%%%%%%%%%%%%%%%

disjunction_of_literals(A):-
   literal(A).
disjunction_of_literals(C v D):-
   disjunction_of_literals(C),
   disjunction_of_literals(D).

literal(A):-
   logical_atom(A).
literal(-A):-
   logical_atom(A).

logical_atom(A):-
   functor(A,P,_N),
   not logical_symbol(P).

logical_symbol(=>).
logical_symbol(-).
logical_symbol(&).
logical_symbol(v).
logical_symbol(exists).
logical_symbol(forall).
/*End ~source text end~*/
