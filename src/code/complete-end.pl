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
	X == Y.	% syntactic identity
var_element(X,[_Y|Ys]):-
	var_element(X,Ys).
