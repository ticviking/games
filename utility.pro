:-module(utility, [writelist/1, print_item_list/1]).
:-use_module(describe).

writelist([Head|Tail]) :-
  writef(Head), writelist(Tail).
writelist([]).

print_item_list(Items) :-
  is_list(Items),
  foreach(member(X, Items), (
    writef("\t"), short_describe(X), nl)).