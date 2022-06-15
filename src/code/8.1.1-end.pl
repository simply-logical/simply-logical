default((flies(X):-bird(X))).
rule((not flies(X):-penguin(X))).
rule((bird(X):-penguin(X))).
rule((penguin(tweety):-true)).
rule((bird(opus):-true)).
