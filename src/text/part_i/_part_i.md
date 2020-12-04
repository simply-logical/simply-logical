<!--H1: Part I-->
(part:i)=
# Logic and Logic Programming #

*Logic Programming* is the name of a programming paradigm which was developed in the 70s. Rather than viewing a computer program as a step-by-step description of an algorithm, the program is conceived as a logical theory, and a procedure call is viewed as a theorem of which the truth needs to be established. Thus, executing a program means searching for a proof. In traditional (imperative) programming languages, the program is a *procedural* specification of **how** a problem needs to be solved. In contrast, a logic program concentrates on a *declarative* specification of **what** the problem is. Readers familiar with imperative programming will find that Logic Programming requires quite a different way of thinking. Indeed, their knowledge of the imperative paradigm will be partly incompatible with the logic paradigm.

+++

This is certainly true with regard to the concept of a program *variable*. In imperative languages, a variable is a name for a memory location which can store data of certain types. While the contents of the location may vary over time, the variable always points to the same location. In fact, the term 'variable' is a bit of a misnomer here, since it refers to a value that is well-defined at every moment. In contrast, a variable in a logic program is a variable in the mathematical sense, i.e. a placeholder that can take on any value. In this respect, Logic Programming is therefore much closer to mathematical intuition than imperative programming.

+++

Imperative programming and Logic Programming also differ with respect to the *machine model* they assume. A machine model is an abstraction of the computer on which programs are executed. The imperative paradigm assumes a dynamic, state-based machine model, where the state of the computer is given by the contents of its memory. The effect of a program statement is a transition from one state to another. Logic Programming does not assume such a dynamic machine model. Computer plus program represent a certain amount of knowledge about the world, which is used to answer queries.

+++

The first three chapters of the book are devoted to an introduction to Logic Programming. {numref}`Chapter %s<ch:1>`, *{ref}`ch:1`*, is an introductory chapter, introducing many concepts in Logic Programming by means of examples. These concepts get a more formal treatment in {numref}`Chapter %s<ch:2>`, *{ref}`ch:2`*. In {numref}`Chapter %s<ch:3>`, *{ref}`ch:3`*, we take a closer look at Prolog as a logic programming language, explaining its main features and describing some common programming techniques.
<!--Chapter 1 Chapter 2 Chapter 3-->
<!--A brief introduction to clausal logic-->
<!--Clausal logic and resolution: theoretical backgrounds-->
<!--Logic Programming and Prolog-->
