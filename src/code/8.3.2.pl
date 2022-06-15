cl(flies1(X),(not(abnormal(X)),bird(X))).
cl(flies(X),(bird(X),not(abnormal(X)))).
cl(abnormal(X),penguin(X)).
cl(abnormal(X),dead(X)).
cl(bird(X),penguin(X)).
cl(bird(X),sparrow(X)).

/** <examples>
?- abduce(flies(tweety),Explanation).
?- abduce(flies1(tweety),Explanation).
*/
