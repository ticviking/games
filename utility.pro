:-module(utility, [writelist/1]).

  writelist([Head|Tail]) :-
    writef(Head), writelist(Tail).
  writelist([]).