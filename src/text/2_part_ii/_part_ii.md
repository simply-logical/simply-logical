<!--H1: Part II-->
(part:ii)=
# Reasoning with structured knowledge #

A physical object is *structured* if it consists of several components having certain spatial relationships to each other. Likewise, knowledge is structured if its components have certain logical relationships. For instance, a description of the London underground system consists of a list of stations (the components) plus a list of connections between stations (the relationships). As can be seen in {numref}`fig:1.1` in {numref}`Chapter %s<ch:1>`, such structured knowledge has a convenient graphical representation, in which components are represented by points or *nodes*, and relationships are represented by lines or *arcs* between nodes. In mathematics, such graphical structures are called *graphs*.
<!--Chapter 1-->

```{tip}
Nodes are also called *vertices* (from the singular *vertex*), and arcs are more commonly called *edges*.
```

+++

A characteristic property of structured knowledge is the distinction that is made between *explicit* and *implicit* relationships. For instance, in the underground example the direct connections which exist between two stations are the explicit relationships. All other relationships (i.e. connections between stations that are further apart) are only implicitly represented, and must be reconstructed from the explicit relationships. Therefore, *reasoning* forms an integral part of any form of structured knowledge.

+++

Other examples of structured knowledge, encountered in {ref}`Part I<part:i>`, include Prolog terms, proof trees, and SLD-trees. Among these, SLD-trees constitute a special case, since they are not given *a priori* as part of the knowledge describing a certain Universe of Discourse, but are instead *derived* from problem specifications of the form 'given program $P$, find all answers to query $Q$'. By means of SLD-trees, such problems are translated to problems of the form 'given SLD-tree $T$, find all paths from the root of the tree to the empty clause'. Problems of the latter kind are called *search problems*, and the graph being searched is called a *search space*. Most problems in intelligent reasoning are search problems of one kind or the other.
<!--Part I-->

<!--NOTE: Subfigures-->
<!--parent: II.1-->
<!--parent_caption: The Towers of Hanoi.-->
<!--caption: Starting position-->
<!--name: 'a'-->
```{figure} /src/fig/part_ii/image002.svg
---
name: 'fig:II.1.a'
width: 70%
---
The Towers of Hanoi: Starting position.
```
<!--parent: II.1-->
<!--parent_caption: The Towers of Hanoi.-->
<!--caption: Intermediate position-->
<!--name: 'b'-->
```{figure} /src/fig/part_ii/image004.svg
---
name: 'fig:II.1.b'
width: 70%
---
The Towers of Hanoi: Intermediate position.
```
<!--parent: II.1-->
<!--parent_caption: The Towers of Hanoi.-->
<!--caption: Goal position-->
<!--name: 'c'-->
```{figure} /src/fig/part_ii/image006.svg
---
name: 'fig:II.1.c'
width: 70%
---
The Towers of Hanoi: Goal position.
```

+++

In principle, any given problem can be defined as a search problem. To this end, we must identify:

<!--roman list-->
1. the nodes in the search space;
1. the arcs between nodes;
1. the starting node;
1. the goal node.

For instance, when searching for an answer to a query by means of SLD-resolution, the nodes in the search space are resolvents, the arcs are resolution steps by means of a program clause, the starting node is the query, and the goal node is the empty clause. As another example, we consider the puzzle known as *The Towers of Hanoi*. This puzzle consists of three pegs and $n$ disks of decreasing size. Initially, all the disks are on the left peg, such that no disk is placed on a smaller one. This rule is to be obeyed throughout the game. The goal is to move all the disks to the right peg by moving one disk at a time. This problem is easily reformulated as a search problem, where nodes are allowed positions, and arcs are moves of the upper disk on one peg to another. Starting node and goal node are as in {numref}`fig:II.1.a`, {numref}`fig:II.1.b` and {numref}`fig:II.1.c`.
<!--NOTE: Since the figures had to be separated, "fig. II.1" got replaced with "{numref}`fig:II.1.a`, {numref}`fig:II.1.b` and {numref}`fig:II.1.c`".-->

````{infobox}
---
title: An analytic solution to the Towers of Hanoi
---
In the case of the Towers of Hanoi, there is a simple analytic solution based on the following observation: suppose we are able to solve the problem for $n-1$ disks, then we can solve it for $n$ disks also: move the upper $n-1$ disks from the left to the middle peg[^12_], move the remaining disk on the left peg to the right peg, and move the $n-1$ disks from the middle peg to the right peg. Since we are able to solve the problem for $0$ disks, it follows by complete induction that we can solve the problem for any number of disks. The inductive nature of this argument is nicely reflected in the following recursive program:
```{swish} swish:hanoi
```
For instance, the query `?-hanoi(3,left,middle,right,M)` yields the answer
```Prolog
M = [ left to right, left to middle, right to middle,
      left to right,
      middle to left, middle to right, left to right ]
```
The first three moves move the upper two disks from the left to the middle peg, then the largest disk is moved to the right peg, and again three moves are needed to move the two disks on the middle peg to the right peg.
````

+++

Since the number of allowed positions is $3^n$, the search space for the Towers of Hanoi grows exponentially with the number of disks. In practice, this means that the problem will be unsolvable for large $n$, no matter how efficient the search program, or how powerful the computer. *This is a common characteristic of search problems*. Search is a problem solving method which, although applicable to almost any problem, has considerable practical limitations. Therefore, search is only applied to problems for which no analytic solutions are known.

+++

  For many problems in intelligent reasoning such analytic solutions simply do not exist, and search is the best we can do. In {numref}`Chapters %s<ch:5>` and {numref}`%s<ch:6>`, we will present and analyse various methods for searching graphs. Since graphs are not only important for search problems, but for all forms of structured knowledge, {numref}`Chapter %s<ch:4>` is devoted to a discussion of various ways to represent structured knowledge in clausal logic.
<!--Chapters 5 6 Chapter 4-->

[^12_]: The remaining disk on A can safely be ignored, since it is the largest.
