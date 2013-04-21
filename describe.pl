% Storing Text for descriptions

:- module(describe, [describe/1]).

describe(X) :-
  describe(X, Y),
  writef(Y).

% The Head
describe(head, "The bathroom aboard a starship.").