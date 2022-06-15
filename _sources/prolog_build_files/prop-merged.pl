/*Begin ~source text start~*/
/*
 * This file provides the following predicates:
 * herbrand_universe(U): generates the Herbrand universe U
 * herbrand_base(B): generates the Herbrand base B
 * herbrand_interpretation(I): generates possible Herbrand interpretations I
 * ground_clause(C): grounds the variables in clause C over the Herbrand universe
 * true_clause(C,I) / false_clause(C,I): to test whether clause C is true/false
 *                                          in interpretation I
 * true_program(P,I): to test whether program P (list of clauses) is true in interpretation I
 * herbrand_model(P,M): to generate Herbrand models of program P
 * logical_consequence(C,P): to test whether clause C is a logical consequence of program P
 *
 * It requires the following predicates to be defined:
 * ground_term(T): T is a ground term in the language (N/A for propositional language)
 * ground_atom(A): A is a ground atom in the language
 */


%%% Herbrand universe, base and interpretation %%%

% The Herbrand universe consists of the set of ground terms
herbrand_universe(U):-
    setof(T,ground_term(T),U).

% The Herbrand base consists of the set of ground atoms
herbrand_base(B):-
    setof(A,ground_atom(A),B).

% A Herbrand interpretation is a subset of the Herbrand base
herbrand_interpretation(I):-
    herbrand_base(B),
    subsequence(I,B).

subsequence([],[]).
subsequence(SS,[_X|S]):-
    subsequence(SS,S).
subsequence([X|SS],[X|S]):-
    subsequence(SS,S).

/*
 * NB. Using "subsequence" rather than "subset" makes
 * herbrand_interpretation order-dependent,
 * but avoids generating lists with duplicates.
 */


%%% Generating ground clauses %%%

% A ground clause consists of a ground head and a ground body
% NB. empty head is represented by false, emtpy body by true
ground_clause((Head:-true)):-
    ground_head(Head).
ground_clause((false:-Body)):-
    ground_body(Body).
ground_clause((Head:-Body)):-
    ground_head(Head),
    ground_body(Body).

% A ground head is a disjunction of ground atoms
ground_head(A):-
    ground_atom(A).
ground_head((A;B)):-
    ground_atom(A),
    ground_head(B).

% A ground body is a conjunction of ground atoms
ground_body(A):-
    ground_atom(A).
ground_body((A,B)):-
    ground_atom(A),
    ground_body(B).

/*
 * NB. The symbols ':-', ',' and ';' are overloaded here.
 * Between brackets they are treated as infix functors, e.g.
 * (Head:-Body) means :-(Head,Body), i.e. a term with
 * binary functor :- and arguments Head and Body.
 * The extra brackets are needed to dinstinguish them from
 * the same symbols occurring in program clauses.
 * See p.61 (box) en section 3.8 of the book.
 */


%%% Generating models of clauses %%%

% An atom A is true in an interpretation I if A is an element of I
true_atom(A,I):-
    element(A,I).

% A head (disjunction) is true in an interpretation I if some of its
% atoms is true in I
true_head(A,I):-
    true_atom(A,I).
true_head((A;_B),I):-
    true_atom(A,I).
true_head((_A;B),I):-
    true_head(B,I).

% A body (conjunction) is true in an interpretation I if each of its
% atoms is true in I
true_body(true,_I).
true_body(A,I):-
    true_atom(A,I).
true_body((A,B),I):-
    true_atom(A,I),
    true_body(B,I).

% A clause is false in an interpretation I if it has a ground instance
% of which the body is true in I and the head is false in I...
% NB. This grounds the variables in the clause!
false_clause((false:-Body),I):-
    ground_clause((false:-Body)),
    true_body(Body,I).
false_clause((Head:-Body),I):-
    ground_clause((Head:-Body)),
    true_body(Body,I),
    not(true_head(Head,I)).

% ...otherwise the clause is true in I, i.e. if all its ground instances
% are true in I
true_clause(C,I):-
    not(false_clause(C,I)).

% A program (list of clauses) is true in an interpretation if
% each of its clauses is true in I
true_program([],_I).
true_program([C|P],I):-
    true_clause(C,I),
    true_program(P,I).

% This predicate can be used to generate all models of a program
herbrand_model(P,M):-
    herbrand_interpretation(M),
    true_program(P,M).


%%% Logical consequence %%%

% This predicate checks whether clause C is a logical consequenc of program P
% If it is, Answer will return yes; if it isn't, Answer will return a countermodel
logical_consequence(C,P,Answer):-
    ( herbrand_model(P,M),not(herbrand_model([C],M)) -> Answer=countermodel(M)
    ; otherwise -> Answer=yes
    ).

% This predicate simply fails when C is not a logical consequence of P
logical_consequence(C,P):-
    logical_consequence(C,P,yes).

%%%%% from library %%%%%

%%% Lists and sets

% element(X,Ys) <- X is an element of the list Ys
element(X,[X|_Ys]).
element(X,[_Y|Ys]):-
    element(X,Ys).
/*End ~source text start~*/

prop_atom(married).
prop_atom(bachelor).
prop_atom(man).
prop_atom(adult).


% Propositional atoms are trivially ground
ground_atom(A):-prop_atom(A).


/** <examples>
?- herbrand_base(B).
?- herbrand_interpretation(I).
?- ground_clause(C).
?- herbrand_interpretation(I),true_clause((married;bachelor:-man,adult),I).
?- herbrand_interpretation(I),false_clause((married;bachelor:-man,adult),I).
?- herbrand_interpretation(I),true_program([(man:-true),(false:-bachelor)),(married;bachelor:-man,adult)],I).
?- herbrand_model([(man:-true),(false:-bachelor)),(married;bachelor:-man,adult)],I).
?- logical_consequence((married:-adult),[(man:-true),(false:-bachelor)),(married;bachelor:-man,adult)],I).
?- logical_consequence((married:-true),[(man:-true),(false:-bachelor)),(married;bachelor:-man,adult)],I).
*/
