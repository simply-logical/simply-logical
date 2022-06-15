likes(peter,S):-student_of(S,peter).
student_of(S,T):-follows(S,C),teaches(T,C).
teaches(peter,ai_techniques).
follows(maria,ai_techniques).

/** <examples>
?-likes(peter,N).
?-student_of(N,peter).
?-follows(N,C),teaches(peter,C).
?-teaches(peter,ai_techniques).
*/
