% natural language shell
nl_shell(Rulebase):-
    get_input(Input),
    handle_input(Input,Rulebase).

% handle input from user
handle_input(stop,_Rulebase):-!.
handle_input(show,Rulebase):-!,
    show_rules(Rulebase),
    nl_shell(Rulebase).
handle_input(Sentence,Rulebase):-
    phrase(sentence(Rule),Sentence),!,  % new rule
    nl_shell([Rule|Rulebase]).
handle_input(Question,Rulebase):-
    phrase(question(Query),Question),  % question
    prove_rb(Query,Rulebase),!,        % it can be solved
    transform(Query,Clauses),          % transform to
    phrase(sentence(Clauses),Answer),  % answer
    show_answer(Answer),
    nl_shell(Rulebase).
handle_input(_Question,Rulebase):-  % illegal sentence or
    show_answer('No'),              % no answer found
    nl_shell(Rulebase).

% show current rulebase
show_rules([]).
show_rules([Rule|Rules]):-
    phrase(sentence(Rule),Sentence),
    show_answer(Sentence),
    show_rules(Rules).

% meta-interpreter
prove_rb(true,_Rulebase):-!.
prove_rb((A,B),Rulebase):-!,
    prove_rb(A,Rulebase),
    prove_rb(B,Rulebase).
prove_rb(A,Rulebase):-
    find_clause((A:-B),Rulebase),
    prove_rb(B,Rulebase).

% find applicable clause in rulebase
find_clause(Clause,[Rule|_Rules]):-
    copy_element(Clause,Rule).  % don't instantiate Rule
find_clause(Clause,[_Rule|Rules]):-
    find_clause(Clause,Rules).

%%% copy_element/2: see Appendix A.2
% vvv online code addition
copy_element(X,Ys):-
    element(X1,Ys),
    copy_term(X1,X).
% element(X,Ys) <- X is an element of the list Ys
element(X,[X|_Ys]).
element(X,[_Y|Ys]):-
    element(X,Ys).
% ^^^ online code addition

% transform query to answer
transform((A,B),[(A:-true)|Rest]):-!,
    transform(B,Rest).
transform(A,[(A:-true)]).

% get input from user
get_input(Input):-
    write('? '),read(Input).

% show answer to user
show_answer(Answer):-
    write('! '),write(Answer),nl.

/** <examples>
?- nl_shell(Rulebase).
*/
