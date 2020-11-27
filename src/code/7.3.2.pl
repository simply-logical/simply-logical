sentence(C)   --> determiner(M1,M2,C),
                  noun(M1),verb_phrase(M2).
determiner(X=>B,X=>H,(H:-B))  --> [every].

/** <examples>
?- phrase(sentence(C),S).
*/
