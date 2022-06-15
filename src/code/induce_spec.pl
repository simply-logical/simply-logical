induce_spec(Examples,Clauses):-
    process_examples([],[],Examples,Clauses).

% process the examples
process_examples(Clauses,_Done,[],Clauses).
process_examples(Cls1,Done,[Ex|Exs],Clauses):-
    process_example(Cls1,Done,Ex,Cls2),
    process_examples(Cls2,[Ex|Done],Exs,Clauses).

% process one example
process_example(Clauses,_Done,+Example,Clauses):-
    covers_d(Clauses,Example).
process_example(Cls,Done,+Example,Clauses):-
    not(covers_d(Cls,Example)),
    generalise(Cls,Done,Example,Clauses).
process_example(Cls,Done,-Example,Clauses):-
    covers_d(Cls,Example),
    specialise(Cls,Done,Example,Clauses).
process_example(Clauses,_Done,-Example,Clauses):-
    not(covers_d(Clauses,Example)).

/** <examples>
?-  induce_spec([+element(a,[a,b]),
                 -element(x,[a,b]),
                 +element(b,[b]),
                 +element(b,[a,b])
                ],Clauses).
?-  induce_spec([+append([],[b,c],[b,c]),
                 -append([],[a,b],[c,d]),
                 -append([a,b],[c,d],[c,d]),
                 -append([a],[b,c],[d,b,c]),
                 -append([a],[b,c],[a,d,e]),
                 +append([a],[b,c],[a,b,c])
                ],Clauses).
?-  induce_spec([+listnum([],[]),
                 -listnum([one],[one]),
                 -listnum([1,two],[one,two]),
                 +listnum([1],[one]),
                 -listnum([five,two],[5,two]),
                 +listnum([five],[5])
                ],Clauses).
*/
