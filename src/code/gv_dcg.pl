% adapted from https://swi-prolog.discourse.group/t/convert-facts-to-graphviz-dot-file-using-dcgs/2809

:- set_prolog_flag(double_quotes, codes).

edge(a,b).
edge(p(a),q(b)).
edge(p(X),q(X)):-numbervars(X).

nodes(Nodes) :-
    setof(From,To^edge(From,To),A),
    setof(To,From^edge(From,To),B),
    merge(A,B,Nodes), !.

edges(Edges) :-
    setof(edge(From,To),edge(From,To),Edges).

graph(Graph) :-
    phrase(graph,Codes,[]),
    string_codes(Graph,Codes).

graph -->
    {
        nodes(Nodes),
        edges(Edges)
    },
    header,
    nodes(Nodes),
    edges(Edges),
    footer.

header -->
    "digraph \n\c
    {\n\c
        overlap=false;\n\c
        spline=true;\n\c
        contentrate=true;\n\c
        node [shape=plaintext, fontname=\"Courier\", fontsize=12];\n\c
        edge [arrowhead=vee];\n\c
        \n\c
        labeljust=\"l\";".

footer -->
    "\n}".

nodes([H|T]) -->
    node(H),
    "\n",
    nodes(T).
nodes([]) --> [].

node(Term) -->
    { term_to_codes(Term,Codes) },
    "\"",
    Codes,
    "\";".

edges([edge(A,B)|T]) -->
    edge(A,B),
    "\n",
    edges(T).
edges([]) --> [].

edge(A,B) -->
    {
        term_to_codes(A,A_codes),
        term_to_codes(B,B_codes)
    },
    "\"",
    A_codes,
    "\"  -> \"",
    B_codes,
    "\"",
    ";".

term_to_codes(Term,Codes):-
    term_to_atom(Term,Atom),
    atom_codes(Atom,Codes).
