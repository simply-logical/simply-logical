% breadth-first version of prove_r/1 + answer substitution
prove_bf(Goal):-
    prove_bf_a([a(Goal,Goal)],Goal).

prove_bf_a([a(true,Goal)|_Agenda],Goal).
prove_bf_a([a((A,B),G)|Agenda],Goal):-!,
    findall(a(D,G),
            (cl(A,C),conj_append(C,B,D)),
            Children),
    append(Agenda,Children,NewAgenda),  % breadth-first
    prove_bf_a(NewAgenda,Goal).
prove_bf_a([a(A,G)|Agenda],Goal):-
    findall(a(B,G),cl(A,B),Children),
    append(Agenda,Children,NewAgenda),  % breadth-first
    prove_bf_a(NewAgenda,Goal).

/** <examples>
?- prove_bf(brother(peter,paul)).
?- prove_bf(brother(peter,Y)).
*/
