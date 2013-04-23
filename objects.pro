:- module(objects, [takable/1, opened/1, open/1]).
:- use_module('locations').



:- dynamic opened/1.

takable(X) :-
  not(untakable(X)),
  (not(Item in wardrobe);
  opened(wardrobe)),
  (not(Item in cooler);
  opened(cooler)),
  is_takable(X).

is_takable(bear) :-
  bikini in bear,
  wine_cooler in bear,
  writef("The bear climbs into your pockets, somehow... it must have a spatial distortion field.").

untakable(captain) :-
  writef("The Captain looks at you sternly and you decide not to try and put him in your pocket.\n").
untakable(guests).
untakable(wardrobe).
untakable(smadf_ship).

open(X) :-
  openable(X),
  assert(opened(X)).