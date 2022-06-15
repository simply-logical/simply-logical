%%% Good generator, but not tail-recursive
powerset([],[[]]).
powerset([H|T],PowerSet):-
    powerset(T,PowerSetOfT),              % generator (GOOD)
    extend_pset(H,PowerSetOfT,PowerSet).  % not tail-recursive

extend_pset(_,[],[]).
extend_pset(H,[List|MoreLists],[List,[H|List]|More]):-
    extend_pset(H,MoreLists,More).

%%% Bad generator, tail-recursive
powerset1([],[[]]).
powerset1([H|T],PowerSet):-
    extend_pset(H,PowerSetOfT,PowerSet),  % generator (BAD)
    powerset1(T,PowerSetOfT).             % tail-recursive

%%% Good generator, tail-recursive
powerset2([],PowerSet,PowerSet).
powerset2([H|T],Acc,PowerSet):-
    extend_pset(H,Acc,Acc1),              % generator (GOOD)
    powerset2(T,Acc1,PowerSet).           % tail-recursive

powerset2(Set,PowerSet):-powerset2(Set,[[]],PowerSet).

/** <examples>
?-powerset([a,b,c,d,e],PS).
?-powerset1([a,b,c,d,e],PS).
?-powerset2([a,b,c,d,e],PS).
?-biglist(1,20,S),powerset(S,PS).
?-biglist(1,20,S),powerset1(S,PS).
?-biglist(1,20,S),powerset2(S,PS).
*/
