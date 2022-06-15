mySort([],[]).
mySort([Head|Tail],WholeSorted):-
    mySort(Tail,Sorted),
    insert(Head,Sorted,WholeSorted).

/** <examples>
?-mySort([3,6,2,8,1],Sorted).
?-mySort([6,5,4,3,2,1],Sorted).
*/
