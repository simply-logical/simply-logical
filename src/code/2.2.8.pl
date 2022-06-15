likes(peter,S):-student_of(S,peter).
likes(peter,Y):-likes(peter,X),likes(X,Y).
likes(maria,paul).
student_of(S,T):-follows(S,C),teaches(T,C).
teaches(peter,ai_techniques).
follows(maria,ai_techniques).
