bachelor(X):-not(married(X)),man(X).
man(fred).
man(peter).
married(fred).

/** <examples>
?-bachelor(fred).
?-bachelor(peter).
*/
