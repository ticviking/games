:- module(locations, [connected/3,
                                     op(50, xfx, in),
                                     op(60, fx, place),
                                    in/2,
                                    place/1]).

:- dynamic in/2.

place(X in New) :-
  not(X in _ ),
  assert(X in New).

place(X in New):-
  X in Old,
  retract(X in Old),
  assert(X in New).

%initial item placement
:-
  place infinate_wrenches in inventory,
  place captain in bridge.


connected(bridge, south, ballroom).
connected(ballroom, north, bridge).
connected(ballroom, east, galley).
connected(ballroom, south, hall).
connected(ballroom, west, quarters).
connected(quarters, east, ballroom).
connected(galley, west, ballroom).
connected(hall, north, ballroom).
connected(hall, east, head).
connected(hall, south, engineering).
connected(hall, west, cargo_bay).
connected(cargo_bay, east, hall).
connected(engineering, north, hall).
connected(head, west, hall).

%TODO - Space movement(with throw)