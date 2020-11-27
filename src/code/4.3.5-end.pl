override(Props,[],Props).
override(Specific,[Attr=_Val|General],Props):-
    member(Attr=_V,Specific),       % overriding
    override(Specific,General,Props).
override(Specific,[Attr=Val|General],[Attr=Val|Props]):-
    not(member(Attr=_V,Specific)),  % no overriding
    override(Specific,General,Props).
