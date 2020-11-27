bachelor(X):-man(X),not(married(X)).
man(fred).
man(peter).
married(fred).

/** <examples>
?-bachelor(X).
*/
