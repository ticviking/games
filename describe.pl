% Storing Text for descriptions

:- module(describe, [describe/1, short_describe/1]).

describe(X) :-
  describe(X, Y, _),
  writef(Y), nl.
describe(X) :-
  writef("I don't know what %t is.", [X]), nl.

short_describe(X) :-
  describe(X,_,Y) ,
  writef(Y), nl.
short_describe(X) :-
  writef("I don't know what %t is.", X), nl.

% Locations Descriptions.
describe(bridge,
  "A bridge long",
  "A bridge short").
describe(quarters,
  "A quarters long",
  "A quarters short").
describe(ballroom,
  "A ballroom long",
  "A ballroom short").
describe(quarters,
  "A quarters long",
  "A quarters short").
describe(galley,
  "A galley long",
  "A galley short").
describe(hall,
  "A hall long",
   "A hall short").
describe(cargo_bay,
  "A cargo_bay long",
  "A cargo_bay short").
describe(engineering,
  "A engineering long",
  "A engineering short").
describe(head,
  "A head long",
  "A head short").
describe(pipes,
  "A pipes long",
  "A pipes short").
describe(space,
  "A space long",
  "A space short").
describe(pill_space,
  "A pill_space long",
  "A pill_space short").
describe(smAdF,
  "A smAdF long",
  "A smAdF short").
describe(junk_heap,
  "A junk_heap long",
  "A junk_heap short").
describe(deep_space,
  "A deep_space long",
  "A deep_space short").
describe(deeper_space,
  "A deeper_space long",
  "A deeper_space short").
describe(deepest_space,
  "A deepest_space long",
  "A deepest_space short").
describe(nothing_space,
  "A nothing_space long",
  "A nothing_space short").
describe(acheivement_space,
  "A acheivement_space long",
  "A acheivement_space short").


%Item descriptions
describe(captain,
  "A captain long",
  "A captain short").
describe(guests,
  "A guests long",
  "A guests short").
describe(wardrobe,
  "A wardrobe long",
  "A wardrobe short").
describe(bikini,
  "A bikini long",
  "A bikini short").
describe(cooler,
  "A cooler long",
  "A cooler short").
describe(polar_bear,
  "A polar_bear long",
  "A polar_bear short").
describe(motorbike,
  "A motorbike long",
  "A motorbike short").
describe(hanger_door,
  "A hanger_door long",
  "A hanger_door short").
describe(shrink_ray,
  "A shrink_ray long",
  "A shrink_ray short").
describe(fuel_storage,
  "A fuel_storage long",
  "A fuel_storage short").
describe(wine_cooler,
  "A wine_cooler long",
  "A wine_cooler short").
describe(toilet,
  "A toilet long",
  "A toilet short").
describe(sewage,
  "A sewage long",
  "A sewage short").
describe(hangover_pill,
  "A hangover_pill long",
  "A hangover_pill short").
describe(smadf_ship,
  "A smadf_ship long",
  "A smadf_ship short").
describe(red_herring,
  "A red_herring long",
  "A red_herring short").
describe(straw_man,
  "A straw_man long",
  "A straw_man short").
describe(nothing,
  "A nothing long",
  "A nothing short").

%items Description.
