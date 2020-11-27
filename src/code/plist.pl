plist([]).
plist([H|T]):-p(H),plist(T).

p(1).
p(2).

/** <examples>
?-plist(L).
*/
