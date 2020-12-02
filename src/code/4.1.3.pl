term_write(Tree):-
    term_write(0,Tree),nl.

% write a Tree at position Pos
term_write(Pos,Tree):-
    term_tree(Tree,Root,Subtrees),   % decompose Tree
    term_write_node(Pos,Pos2,Root),  % write Root
    term_writes(Pos2,Subtrees).      % new position

% write a list of trees at position Pos
term_writes(Pos,[]).
term_writes(Pos,[Tree]):-!,          % no newline here
    term_write(Pos,Tree).
term_writes(Pos,[Tree|Subtrees]):-
    term_write(Pos,Tree),
    nl,tab(Pos),                     % skip to position Pos
    term_writes(Pos,Subtrees).

% write a Node from Begin to End
term_write_node(Begin,End,Node):-
    name(Node,L),length(L,N),          % N is length of Nodename
    End is Begin+10,
    N1 is End-Begin-N,                 % N1 is length of line
    write_line(N1),
    write(Node).

% write a line of given length
write_line(0).
write_line(N):-
    N>0,N1 is N-1,
    write('-'),
    write_line(N1).

/** <examples>
?- term_write(n1(n2(n4,n5(n7),n6),n3(n8,n9(n10)))).
*/
