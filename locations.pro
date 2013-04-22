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
%bridge
  place player in bridge,
    place wrenches in inventory,
  place captain in bridge,
%ballroom
  place guests in ballroom,
%quarters
  place wardrobe in quarters,
    place bikini in wardrobe,
%galley
  place cooler in galley,
  place bear in cooler,
%cargo_bay
  place motorbike in cargo_bay,
  place hanger_door in motorbike,
%hall
  % nothing here
% engineering
  place shrink_ray in engineering,
  place fuel_storage in engineering,
    place wine_cooler in fuel_storage,
% head
  place toilet in head,
% pipes
  place poo in pipes,
%Space locations
  place pill in pill_space,
  place smadf_ship in smadf_space,
  place red_herring in junk_heap,
  place straw_man in junk_heap,
  place nothing in achievement_space.




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