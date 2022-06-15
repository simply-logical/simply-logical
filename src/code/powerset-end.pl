%%% For testing
biglist(Low,High,L):-bagof(X,between(Low,High,X),L).
