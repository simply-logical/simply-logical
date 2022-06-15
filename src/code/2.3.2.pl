listlength([],0).
listlength([_X|Y],s(L)):-listlength(Y,L).

/** <examples>
?-listlength([0,0,0],N).
?-listlength(L,s(s(0))).
?-listlength(L,N).
*/
