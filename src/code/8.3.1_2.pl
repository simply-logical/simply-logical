abducible(A):-A \= not(B),not cl(A,B).

/** <examples>
?- abduce(flies(tweety),Explanation).
?- abduce(not(abnormal(tweety)),[penguin(tweety)],[penguin(tweety)]).
?- abduce(not(abnormal(tweety)),[],[]).
?- abduce(flies1(tweety),Explanation).
*/
