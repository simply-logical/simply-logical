<!--# Simply Logical:<br>Intelligent Reasoning by Example #-->
# Simply Logical #
**Intelligent Reasoning by Example**  
*(Fully Interactive Online Edition)*

![Simply Logical cover](/src/img/SLfront.gif "Simply Logical cover")

*by [Peter Flach](https://www.cs.bris.ac.uk/~flach/index.html), then at [Tilburg University](https://www.tilburguniversity.edu/), the Netherlands*  
[John Wiley](https://www.wiley.com/en-gb) 1994, xvi + 240 pages, ISBN 0471 94152 2  
Reprinted: December 1994, July 1998.

<!--acknowledgements-->

## About the Book ##

### History ###
"Simply Logical -- Intelligent Reasoning by Example" by Peter Flach was first published by John Wiley in 1994. It could be purchased as book-only or with a 3.5 inch diskette containing the Prolog programs printed in the book (for various operating systems).

In 2007 the copyright reverted back to the author and book and programs have been freely available [online](https://www.cs.bris.ac.uk/~flach/SimplyLogical.html) ever since. The print version is no longer available through John Wiley publishers.

In 2015, as a pilot, we ported most of the original book into an online, interactive website using SWI-Prolog's [SWISH platform](https://swish.swi-prolog.org/). Since then, we created the *Simply Logical* open source organisation committed to maintaining a suite of freely available interactive online educational resources about Artificial Intelligence and Logic Programming with Prolog. Visit our organisation's [website](https://simply-logical.space/) and [GitHub profile](https://github.com/simply-logical) for more details.

### PDF version ###
[![PDF](https://img.shields.io/badge/read-PDF-green.svg)](https://github.com/simply-logical/simply-logical/releases/download/v1.0/SL.pdf)  
The PDF version of the original book is available as a [*GitHub release*](https://github.com/simply-logical/simply-logical/releases/tag/v1.0).

#### Citation ####
```BibTeX
@book{flach1994simply,
  author       = {Flach, Peter},
  title        = {{S}imply {L}ogical: {I}ntelligent {R}easoning by {E}xample},
  publisher    = {John Wiley},
  year         = {1994},
  url          = {https://www.cs.bris.ac.uk/~flach/SimplyLogical.html}
}
```

### Online version ###
[![Licence](https://img.shields.io/badge/Licence-CC%20BY--NC--SA%204.0-lightgrey.svg)](https://github.com/simply-logical/simply-logical/blob/master/LICENCE)
[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.1156977.svg)](https://doi.org/10.5281/zenodo.1156977)
[![Online](https://img.shields.io/badge/read-online-green.svg)](https://book.simply-logical.space)  
The online version of the book is hosted on [*GitHub Pages*](https://book.simply-logical.space).
It is built with [Jupyter Book](https://jupyterbook.org/) and [SWISH](https://swish.swi-prolog.org/), the online version of [SWI-Prolog](https://swi-prolog.org/).
It follows the structure of the original print version, with minor corrections and additions as explained in the {ref}`part:preface`.

#### Citation ####
```BibTeX
@book{flach2022simply,
  author       = {Flach, Peter and Sokol, Kacper},
  title        = {{S}imply {L}ogical -- {I}ntelligent {R}easoning by {E}xample
                  ({F}ully {I}nteractive {O}nline {E}dition)},
  publisher    = {Zenodo},
  year         = {2022},
  month        = {aug},
  doi          = {10.5281/zenodo.1156977},
  url          = {https://doi.org/10.5281/zenodo.1156977}
}
```

#### Prolog code blocks not working ####
If the interactive Prolog code blocks are not working for you in the online version of the book, please ensure that third-party cookies are enabled in your web browser.

#### Error in the book ####
If you find an error in the online version of the book, please open a [*GitHub issue*](https://github.com/simply-logical/simply-logical/issues).

## Author's Preface ##
This is a book about intelligent reasoning. *Reasoning* is the process of drawing conclusions; *intelligent* reasoning is the kind of reasoning performed by humans. This is not to say that this book is about the psychological aspects of human reasoning: rather, it discusses methods to implement intelligent reasoning by means of Prolog programs. The book is written from the shared viewpoints of Computational Logic, which aims at automating various kinds of reasoning, and Artificial Intelligence, which seeks to implement aspects of intelligent behaviour on a computer. The combination of these two viewpoints is a distinguishing feature of this book, which I think gives it a unique place among the many related books available.

### Who should read this book ###
While writing this book, I had three kinds of readers in mind: Artificial Intelligence researchers or practitioners, Logic Programming researchers or practitioners, and students (advanced undergraduate or graduate level) in both fields.

The reader working in Artificial Intelligence will find a detailed treatment of how the power of logic can be used to solve some of her problems. It is a common prejudice among many practitioners of Artificial Intelligence that logic is a merely theoretical device, with limited significance when it comes to tackling practical problems. It is my hope that the many detailed programs in this book, which perform important tasks such as natural language interpretation, abductive and inductive reasoning, and reasoning by default, help to fight this unjust prejudice. On the other hand, those acquainted with Logic Programming will be interested in the practical side of many topics that get a mainly theoretical treatment in the literature. Indeed, many advanced programs presented and explained in this book are not, in a didactic form, available elsewhere.

The student unfamiliar with either field will profit from an integrated treatment of subjects that otherwise needs to be collected from different sources with widely varying degrees of sophistication. For instance, many treatments of the theory of Logic Programming employ an amount of mathematical machinery that has intimidated many a novice to the field. On the other hand, many practical treatments of programming for Artificial Intelligence display an almost embarrassing lack of theoretical foundations. This book aims at showing how much is gained by taking an intermediate position.

### Style of presentation ###
As indicated by the title, this book presents intelligent reasoning techniques *by example*. This is meant to stress that every technique is accompanied by a Prolog program implementing it. These programs serve two didactic purposes. By running them, one can get a feeling what a particular technique is all about. But perhaps more importantly, the declarative reading of each program is an integral part of the explanation of the technique it implements. For the more elaborate programs, special attention is paid to their stepwise development, explaining key issues along the way. Thus, the book's focus is not just on the question 'How is this done in Prolog?', but rather on the question 'How should I solve this problem, were I to start from scratch?' In other words, the philosophy of this book is 'teaching by showing, learning by doing'.

This should not be taken to imply that the book is devoid of all theoretical underpinnings. On the contrary, a substantial part is devoted to the theoretical backgrounds of clausal logic and Logic Programming, which are put to use in subsequent presentations of advanced reasoning techniques. However, theoretical issues are not included for their own sake, but only insofar they are instrumental in understanding and implementing a particular technique. No attempt is made to give an encyclopedic coverage of the subjects covered. There exist specialised works in the literature which do exactly that for specific subjects, references to which are included.

### Suggestions for teachers ###
This book can be used as a textbook for a graduate or advanced undergraduate course in Artificial Intelligence or Computational Logic. If one wishes to complement it with a second textbook, I would suggest either Genesereth and Nilsson's *Logical Foundations of Artificial Intelligence* (Morgan Kaufmann, 1987) or Kowalski's classic text *Logic for Problem Solving* (North-Holland, 1979) on the theoretical side; or, more practically, Ivan Bratko's *Prolog Programming for Artificial Intelligence* (Addison-Wesley, second edition, 1990) or Sterling and Shapiro's *The Art of Prolog* (MIT Press, 1986).

### What can and cannot be found in this book ###
The book consists of three parts. Part I presents the necessary material on Logic and Logic Programming. In an introductory chapter, the main concepts in Logic Programming are introduced, such as program clauses, query answering, proof trees, and recursive data structures. This chapter is intended for the reader who is unfamiliar with Prolog programming, and is therefore written in a way intended to appeal to the student's intuition.

In Chapter 2, the topic of resolution theorem proving in clausal logic is addressed in a more rigorous fashion. Here, we deal with concepts such as Herbrand models and resolution refutations, as well as meta-theoretical notions like soundness and completeness. The presentation starts with propositional clausal logic, and proceeds via relational clausal logic (without functors) to full clausal logic, and finally arrives at definite clause logic.

Since the semantics of clausal logic is defined in its own terms, without reference to the kind of models employed in Predicate Logic, only a basic familiarity with the notion of a logic is required. Although I agree that a Herbrand model is, in some sense, a 'poor man's version' of a logical model, I believe that my presentation has didactic advantages over the standard treatment which defines Herbrand models in terms of Predicate Logic models. However, since this distinction is important, in a separate section I do address the relation between clausal logic and Predicate Logic.

In Chapter 3, the practical aspects of Prolog programming are discussed. The notion of an SLD-tree forms an important concept in this chapter, most notably in the treatment of cut. When explaining cut, I like to tell my students that it is much like the GO TO statement in imperative programming languages: it is there, it is needed at implementation level, but it should be replaced as much as possible by such higher-level constructs as not and if-then-else. Further practical issues include the treatment of arithmetic expressions in Prolog, second-order predicates like setof, and various programming techniques like accumulators and difference lists. Since meta-interpreters are very frequently used in the advanced programs in Part III, they are discussed here at some length as well. A final section in this chapter addresses some aspects of a general programming methodology.

Of course it is impossible to fully explain either the theory of Logic Programming or the practice of Prolog programming in a single chapter. I am certain that many lecturers will feel that something is missing which they consider important. However, my main intention has been to cover at least those subjects that are needed for understanding the programs presented in later chapters.

In Part II, I shift from the Logic Programming perspective to the Artificial Intelligence viewpoint. Here, the central notions are graphs and search. From the Prolog perspective, graphs occur in at least two ways: as the trees represented by terms (e.g. parse trees), and as the search spaces spanned by predicates (e.g. SLD-trees). These concepts are discussed in Chapter 4. Furthermore, several ways to represent inheritance hierarchies are investigated in section 4.3. Usually, this topic in Knowledge Representation gets a more or less historical treatment, introducing concepts like semantic networks, frames, and the like. I chose a complementary starting point, namely the question 'What are the possibilities for representing and reasoning about inheritance hierarchies in Prolog?' The justification for this is that I believe such a starting point to be closer to the student's initial position.

In two subsequent chapters, the basic techniques for performing blind and informed search are presented. In Chapter 5, the techniques for depth-first search, iterative deepening and breadth-first search are discussed in the context of Logic Programming, and a breadth-first Prolog meta-interpreter is developed as well as an (inefficient) interpreter for full clausal logic. The concept of forward chaining is illustrated by a program which generates Herbrand models of a set of clauses. Chapter 6 discusses best-first search and its optimality, leading to the A* algorithm. The chapter is rounded off by a brief discussion of non-exhaustive heuristic search strategies (beam search and hill-climbing).

If the material in Parts I and II is at all 'special', it is because some non-standard perspective has been taken. Genuinely advanced and (mostly) new material is to be found in Part III, again consisting of three chapters. In Chapter 7, I discuss the topics of natural language parsing and interpretation. The close links between parsing context-free grammars and definite clause resolution have been obvious from the early days of Prolog. I present a small grammar accepting sentences like 'Socrates is human' and 'all humans are mortal', and extend this grammar to a Definite Clause Grammar which builds the clauses representing their meaning. This grammar is incorporated in a program for building and querying a small knowledge base in natural language. A nice feature of this program is that it employs sentence generation as well, by transforming the instantiated query back to a sentence expressing the answer to the question in natural language.

Chapter 8 groups various topics under the heading Reasoning with incomplete information. It discusses and implements default reasoning by means of negation as failure, and by means of defeasible default rules. The semantics of incomplete information is investigated through two completion methods, the Closed World Assumption and Predicate Completion. Then, a detailed discussion of abductive reasoning follows, including how to avoid inconsistencies when clauses contain negated literals, and an application to fault diagnosis. In section 8.4, the various relations between these different ways of dealing with incomplete information are discussed.

If Chapter 8 can be called an 'issues in ...' chapter, then Chapter 9 is an '... in-depth' chapter. It deals with the difficult subject of inductively inferring a logic program from examples. Two programs which are able to induce predicates like append are developed. Along the way, issues like generality between clauses and anti-unification are discussed and implemented. This chapter covers some state-of-the-art material from the maturing field of Inductive Logic Programming.

In a number of appendices, I give a brief overview of built-in predicates in Prolog, and a small library of utility predicates used by many programs throughout the book. Furthermore, two larger programs are listed for transforming a Predicate Logic formula to clausal logic, and for performing Predicate Completion. In a third appendix, answers to selected exercises are provided. The book is completed by an extensive index, providing many cross-references.
