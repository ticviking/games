:- module(objects, [takable/1, opened/1, open/1, openable/1]).
:- use_module('locations').
:- use_module('describe').


:- dynamic opened/1.

openable(wardrobe).
openable(cooler).
openable(fuel_storage).

takable(X) :-
  not(untakable(X)),
  (not(X in wardrobe);
  opened(wardrobe)),
  (not(X in cooler);
  opened(cooler)),
  is_takable(X).

is_takable(_). %unless it's untakable default to take.

%GAG output in this module should be refactored out.

untakable(captain) :-
  writef("The Captain looks at you sternly and you decide not to try and put him in your pocket.\n").
untakable(guests).
untakable(wardrobe).
untakable(smadf_ship).

open(X) :-
  openable(X),
  assert(opened(X)),
  writef("You open the"), describe_short(X).