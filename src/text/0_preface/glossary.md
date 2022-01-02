(ch:glossary)=
# Glossary #

```{tip}
This glossary is a work in progress. It will contain a mixture of brief definitional entries and short essays complementing the material covered in the main text. Eventually, the online book and glossary can be seen as an updated, revised and extended second edition.
``` 

```{glossary}
atom
   An *atom* has the form `pred(t1,...,tn)`, where `pred` is a {term}`predicate` and `t1,...,tn` are {term}`terms<term>`. `n `is the arity of the predicate. Predicates with different arities are treated as different even if they use the same token. A 0-arity predicate is also called a {term}`proposition`. 

body
	TO DO

clause
   A *clause* has the form `head :- body`, to be read `head IF body` or `IF body THEN head`. The {term}`head` is a disjunction of {term}`atoms<atom>` separated by semicolons. The {term}`body` is a conjunction of {term}`atoms<atom>` separated by commas. 

   Special cases: `body` can be empty, in which case the clause is written as either `head` or as `head :- true`. Similarly, `head` can be empty, in which case the clause is written as either `:-body` or as `false :- body`. The empty clause, written as `false :- true` or as `[]`, indicates a logical contradiction. 
   
   In Prolog, clause heads must have a single atom ({term}`definite clause`). Clauses with an empty head are interpreted as {term}`queries<query>`.

completeness
	TO DO

conjunctive normal form
	TO DO

constant
	TO DO

counter-example
	TO DO

decidable
	TO DO

declarative semantics
	TO DO

definite clause
	A {term}`clause` with a single {term}`atom` in the {term}`head`.

existential variable
	TO DO

failure-driven loop
	TO DO

functor
	TO DO

general clause
	TO DO

ground term/atom/clause
	A {term}`term`, {term}`atom` or {term}`clause` without {term}`variables<variable>`. 

head
	TO DO

Herbrand universe
	The set of all {term}`ground terms<ground term/atom/clause>`. These represent all the "things" you can talk about. The Herbrand universe is infinite if we have one or more {term}`functors<functor>`, finite otherwise (i.e., in {term}`propositional<propositional clausal logic>` and {term}`relational clausal logic`).

Herbrand base
	The set of all {term}`ground atoms<ground term/atom/clause>`. These represent statements that can be true or false. Finite or infinite depending on the {term}`Herbrand universe`. 

Herbrand interpretation
	assignment of truth values true/false to all {term}`ground atoms<ground term/atom/clause>` in the {term}`Herbrand base`. Usually represented by the subset of true atoms. Each Herbrand interpretation represents a possible state of affairs in the world ({term}`possible world`). 

inference rule
	TO DO

list
	TO DO

literal
	Given a {term}`clause`, an {term}`atom` is a positive/negative *literal* if it occurs in the {term}`body`/{term}`head`. This corresponds to the interpretation of a clause `h1 ; h2 :- b1 , b2` as a disjunction $h1 \lor h2 \lor \neg b1 \lor \neg b2$, in which head literals occur unnegated and body literals occur negated. 

logical consequence
	A clause $C$ is a *logical consequence* of a {term}`program` $P$ (or $P$ entails $C$) iff every {term}`model` of $P$ is also a {term}`model` of $C$; we write $P \models C$. If this isn't the case (i.e., some {term}`model` of $P$ is not a {term}`model` of $C$), then $C$ expresses some knowledge that is not contained in $P$. 

	Edge cases: any {term}`tautology` such as `a :- a` is a logical consequence of any {term}`program`; an inconsistent {term}`program` (e.g., containing both `a` and `:-a`) has no {term}`models<model>` and hence entails anything. 

meta-interpreter
	TO DO

meta-level
	TO DO

minimal model
	TO DO

model
	A {term}`Herbrand interpretation` that makes a {term}`clause` or {term}`program` true. A {term}`ground clause<ground term/atom/clause>` is **false** in an interpretation if all body atoms are **true** and all head atoms are **false** ({term}`counter-example`), and **true** otherwise. A non-ground clause is true iff all its ground instances over the {term}`Herbrand universe` are. A {term}`program` is true if all of its clauses are. 

most general unifier
	TO DO

negation as failure
	TO DO

object-level
	TO DO

possible world
	TO DO

predicate
	TO DO

predicate logic
	TO DO

procedural semantics
	TO DO

program
	A *(logic) program* consists of one of more {term}`clauses<clause>`, read conjunctively. Hence a program is said to be in {term}`conjunctive normal form`, i.e., a conjunction of disjunctions of (possibly negated) atoms. Normal forms limit the number of ways programs can be written, which is computationally advantageous. 

proof by refutation
	A *proof by refutation*, also referred to as *reduction to the absurd*, adds the negation of the {term}`query` (what you want to prove) to the {term}`program`, and then uses {term}`resolution` to derive the empty clause (falsity). If that succeeds, then the original (un-negated) query is a {term}`logical consequence` of the {term}`program` -- but only under the {term}`substitutions<substitution>` needed for all resolution steps. 

proof tree
	TO DO

proposition
	TO DO

propositional clausal logic
	TO DO

query
	TO DO

recursion
	TO DO

relational clausal logic
	TO DO

resolution
	The single {term}`inference rule` in clausal logic is *resolution*. (This is a consequence of having a {term}`normal form<conjunctive normal form>` -- {term}`predicate logic` needs many more {term}`inference rules<inference rule>`.) Resolution takes two clauses and infers a third clause that is a {term}`logical consequence` (i.e., resolution is *{term}`sound<soundness>`). We can chain several resolution steps together into a proof to produce further {term}`logical consequences<logical consequence>`. 

	In {term}`propositional clausal logic`, resolution is applicable to any two clauses where the same literal occurs positively in one clause (i.e., in the head) and negatively in the other (in the body). This literal is "resolved away", and the remaining literals are combined in the inferred clause, keeping their sign (location in head or body). It follows that if the two input clauses are {term}`definite<definite clause>`, then so is the inferred clause. 

	With {term}`variables<variable>` we first may have to apply a {term}`substitution` to make the positive/negative literal pair identical. Such a {term}`substitution` is called a {term}`unifier`; it is applied to the entire clause and carried along to the rest of the proof. Applying a {term}`substitution` to a clause produces a {term}`logical consequence`, so this doesn't affect the {term}`soundness` of resolution. We are generally only interested in {term}`most general unifiers<most general unifier>` that don't make unnecessary {term}`substitutions<substitution>`. 

	Resolution cannot infer all {term}`logical consequences<logical consequence>` (e.g., arbitrary {term}`tautologies<tautology>`) and hence is {term}`incomplete<completeness>`}. This can be overcome by turning things around, starting from the thing you want to prove. Technically, this is realised by {term}`proof by refutation`.

refutation
	TO DO

refutation-complete
	TO DO

soundness
	TO DO

stratified program
	TO DO

substitution
	TO DO

success set
	TO DO

tautology
	TO DO

term
	A *term* is either a {term}`variable` or has the form `f(t1,...,tn)`, where `f` is a {term}`functor` and `t1,...,tn` are terms. `n` is the arity of the functor. Variable tokens start with an uppercase letter; functor tokens start with a lowercase letter. A 0-arity functor is also called a {term}`constant`. 

unification
	TO DO

unifier
	TO DO

variable
	TO DO
```
