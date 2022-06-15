not(Goal):- Goal,!,fail.
not(_Goal).

/** <examples>
?-not(true).
?-not(false).
*/
