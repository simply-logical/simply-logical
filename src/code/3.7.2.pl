children(Parent,Children):-
    findall(C,parent(Parent,C),Children).
