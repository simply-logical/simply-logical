/*Begin ~source text start~*/
%%% B.1  From predicate logic to clausal logic %%%

:-op(900,xfx,'=>').  % implication
:-op(800,xfy,&).  % conjunction
:-op(800,xfy,v).  % disjunction
:-op(400,fy,-).  % negation

:-op(400,fy,not).  % negation

transform(Formula,Clauses):-
   rewrite_implications(Formula,F1),
   negations_inside(F1,F2),
   prenex_normal_form(F2,F3),
   skolemise(F3,F4),
   conjunctive_normal_form(F4,F5),
   clausal_form(F5,Clauses).

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


% skolemise(F1,F2) <- F2 is obtained from F1 by replacing
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
/*End ~source text start~*/

complete(Program,Comp):-
    separate_definitions(Program,Definitions),
    complete_definitions(Definitions,CompDefs,Heads),
    handle_undefined(Program,Heads,CompDefs,Comp).

separate_definitions([],[]).
separate_definitions([([Head]:-Body)|Clauses],[[([Head]:-Body)|Def]|Defs]):-
    get_definition(Clauses,Head,Def,Rest),
    separate_definitions(Rest,Defs).
    
get_definition([],_Head,[],[]).
get_definition([([H]:-B)|Clauses],Head,[([H]:-B)|Def],Rest):-
    same_predicate(H,Head),
    get_definition(Clauses,Head,Def,Rest).
get_definition([([H]:-B)|Clauses],Head,Def,[([H]:-B)|Rest]):-
    not same_predicate(H,Head),
    get_definition(Clauses,Head,Def,Rest).

/** <examples>
?- complete([ ([bird(tweety)]:-[]),
              ([flies(X)]:-[bird(X),not abnormal(X)]) ],
            F),
transform(F,CP).
?- complete([ ([likes(peter,S)]:-[student_of(S,peter)]),
              ([student_of(paul,peter)]:-[]) ],
            F),
transform(F,CP).
*/


/*Begin ~source text end~*/
%%% B.2  Predicate Completion %%%

handle_undefined(Program,Heads,CompDefs,Comp):-
    setof0(L,
           H^B^(member((H:-B),Program),
            ((member(L,B),not L=not(_X))
            ;member(not L,B)),
            not member(L,Heads)),
           Undefs),
    undef_formulas(Undefs,CompDefs,Comp).

undef_formulas([],Comp,Comp).
undef_formulas([L|Ls],Comp0,Comp):-
    quantify(L,F),
    undef_formulas(Ls,F & Comp0,Comp).

quantify(L,F):-
    L =.. [P|As],
    variablise(As,Vs,F,-NewL),
    NewL =.. [P|Vs].

variablise([],[],L,L).
variablise([_A|As],[V|Vs],forall(V,F),L):-
    variablise(As,Vs,F,L).


complete_definitions([Def],Comp,[Head]):-!,
    complete_definition(Def,Comp,Head).
complete_definitions([Def|Defs],Comp & Comps,[Head|Heads]):-
    complete_definition(Def,Comp,Head),
    complete_definitions(Defs,Comps,Heads).

complete_definition(Definition,Comp,Head):-
    unifications_and_quantifiers(Definition,F),
    complete_formula(F,Comp,Head).


unifications_and_quantifiers([],[]).
unifications_and_quantifiers([Clause|Clauses],[C|Cs]):-
    unifs_and_quants(Clause,C),
    unifications_and_quantifiers(Clauses,Cs).

unifs_and_quants(([Head] :- Body),([NewHead]:-NewBody)):-
    Head=..[Pred|Args],
    explicit_unifications(Args,NewArgs,Body,TmpBody),
    existential_quantifiers(TmpBody,NewArgs,NewBody),
    NewHead=..[Pred|NewArgs].

explicit_unifications([],[],Body,Body).
explicit_unifications([Term|Args],[NewVar|NewArgs],Body,[NewVar = Term|NewBody]):-
    nonvar(Term),
    explicit_unifications(Args,NewArgs,Body,NewBody).
explicit_unifications([Var|Args],[Var|NewArgs],Body,NewBody):-
    var(Var),
    explicit_unifications(Args,NewArgs,Body,NewBody).

existential_quantifiers(Body,HeadVars,NewBody):-
    varsin(Body,BodyVars),
    body_form(Body,Conj),
    body_quants(BodyVars,HeadVars,Conj,NewBody).

body_form([not Lit],-Lit):-!.
body_form([Lit],Lit):-!.
body_form([not Lit|List],-Lit & Conj):-!,
    body_form(List,Conj).
body_form([Lit|List],Lit & Conj):-
    body_form(List,Conj).

body_quants([],_HeadVars,Conj,Conj).
body_quants([BVar|BVars],HeadVars,Conj,exists(BVar,F)):-
    not var_element(BVar,HeadVars),
    body_quants(BVars,HeadVars,Conj,F).
body_quants([BVar|BVars],HeadVars,Conj,F):-
    var_element(BVar,HeadVars),
    body_quants(BVars,HeadVars,Conj,F).


complete_formula(F,Formula,Head):-
    combine_clauses(F,Head,Body),
    varsin(Head,HeadVars),
    head_quants(HeadVars,Head => Body,Formula).

combine_clauses([([Head]:-Body)],Head,Body):- !.
combine_clauses([([Head]:-Body)|Rest],Head,Body v RestBody):-
    combine_clauses(Rest,Head,RestBody).

head_quants([],Formula,Formula).
head_quants([HVar|HVars],Formula,forall(HVar,F)):-
    head_quants(HVars,Formula,F).

%%% from library.pl

% variant of setof/3 which succeeds with the empty list
% if no solutions can be found
setof0(X,G,L):-
    setof(X,G,L),!.
setof0(_X,_G,[]).

% same_predicate(L1,L2) <- literals L1 and L2 have
%                          the same predicate and arity
same_predicate(L1,L2):-
    functor(L1,P,N),functor(L2,P,N).

varsin(Term,Vars):-
        varsin(Term,[],V),
        sort(V,Vars).

varsin(V,Vars,[V|Vars]):-
        var(V),!.
varsin(Term,V0,V):-
        functor(Term,_,N),
        varsin_args(N,Term,V0,V).

varsin_args(0,_,Vars,Vars).
varsin_args(N,Term,V0,V):-
        N>0, N1 is N-1,
        arg(N,Term,ArgN),
        varsin(ArgN,V0,V1),
        varsin_args(N1,Term,V1,V).

var_element(X,[Y|_Ys]):-
    X == Y.  % syntactic identity
var_element(X,[_Y|Ys]):-
    var_element(X,Ys).
/*End ~source text end~*/
