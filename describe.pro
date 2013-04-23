% Storing Text for descriptions
:- module(describe, [describe/1, short_describe/1]).
:- use_module(utility).

% describe a multi line item. Workaround for max string lengths by keeping strings less than 80.
describe(X) :-
  describe(X,Y, _),
  is_list(Y),
  writelist(Y), nl.
%single line item
describe(X) :-
  describe(X, Y, _),
  writef(Y), nl.

describe(X) :-
  writef("I don't know what %t is.", [X]), nl.

short_describe(X) :-
  describe(X,_,Y) ,
  writef(Y).
short_describe(X) :-
  writef("%t is unknown. It", [X]).

describe(help, [
  'You are very hungover, and don\'t remember how to do much. You do remember\n',
  'how to do these things though:\n=====\n',
  'help - help yourself out by remembering how to do things.\n',
  'go [north|south|east|west] - attempt to move in a direction.\n',
  'take, pick up, loot [item] - try to take an item and put it in your inventory.\n',
  'drop, litter - leave an item somewhere.\n',
  'inventory, pockets - see what you\'re carrying around with you.\n',
  'look, inspect [item]- take a closer look at something.\n',
  'give [item] [charity case] - had something to someone, or thing, or not thing\n\tas the case may be.\n',
  'talk [thing] - talk to something, if it likes you it may even talk back at you.\n',
  'open [thing] - try to open something, like another beer, or a fridge to get another beer.\n',
  'use [thing] - try to use something.\n',
  'flush [toilet] - you don\'t know of anything else that you flush.\n',
  'throw [object] at [target] - toss object at target.\n'
  ],
  "You can't help yourself that way").

describe(intro, [
  'You awaken to a crushing headache.\n\n',
  'As you pry your eyes open you see the CAPTAIN running about and pushing buttons\n',
  'in a distinctly sciency manner. \"Crewman Tom Tightpants! Have you woken up?\"\n\n',
  'You take several long moments to realize that yes. That is in fact who you are...\n',
  'probably.\n\n He presses a series of buttons, and howls. \"It’s Madd! Madd I say!\"\n The',
  'words \"Dangerously Sober\" flash across a number of gratuitisly shiny panels cause\n',
  'this is the future if you couldn’t guess.\n',
  '\"Whose crazy and or angry sir?\" \n',
  '\"No! Mothers Against Drunk Driving! They found us!\"\n',
  '\"But we’re driving a cutting edge spaceship that run entirely\n',
  'on alcohol!\" You say as way of exposition.\n',
  '\"That’s probably why they’re after us. Their Sobriety Beam killed our engine\n',
  'and if we don’t cure the ships hangover, we’re dead in the water."\n',
  '\"Well... I guess I’m on the case!\"\n'],
"There is no short way to introduce this adventure!").

% Locations Descriptions.
describe(bridge,
  'A bridge long',
  'A bridge short').
describe(quarters,
  'A quarters long',
  'A quarters short').
describe(ballroom,
  'A ballroom long',
  'A ballroom short').
describe(quarters,
  'A quarters long',
  'A quarters short').
describe(galley,
  'A galley long',
  'A galley short').
describe(hall,
  'A hall long',
   'A hall short').
describe(cargo_bay,
  'A cargo_bay long',
  'A cargo_bay short').
describe(engineering,
  'A engineering long',
  'A engineering short').
describe(head,
  'A head long',
  'A head short').
describe(pipes,
  'A pipes long',
  'A pipes short').
describe(near_space,
  'A space long',
  'A space short').
describe(pill_space,
  'A pill_space long',
  'A pill_space short').
describe(smAdF_space,
  'A smAdF long',
  'A smAdF short').
describe(junk_heap,
  'A junk_heap long',
  'A junk_heap short').
describe(deep_space,
  'A deep_space long',
  'A deep_space short').
describe(deeper_space,
  'A deeper_space long',
  'A deeper_space short').
describe(deepest_space,
  'A deepest_space long',
  'A deepest_space short').
describe(nothing_space,
  'A nothing_space long',
  'A nothing_space short').
describe(acheivement_space,
  'A acheivement_space long',
  'A acheivement_space short').


%Item descriptions
describe(captain,
['A man ever so slightly older than should be piloting a craft powered by\n',
 'parties. His haunted eyes carry the full weight of a thousand hangovers.\n',
 'But aside from that, the sort of generic explorer of space to be expected in\n',
'scenarios such as this. \n'
],
  'The captain').
describe(guests,
  'A guests long',
  'A guests short').
describe(wardrobe,
  'A wardrobe long',
  'A wardrobe short').
describe(bikini,
  'A bikini long',
  'A bikini short').
describe(cooler,
  'A cooler long',
  'A cooler short').
describe(bear,
  'A polar bear long',
  'A polar bear short').
describe(motorbike,
  'A motorbike long',
  'A motorbike short').
describe(hanger_door,
  'A hanger_door long',
  'A hanger_door short').
describe(shrink_ray,
  'A shrink_ray long',
  'A shrink_ray short').
describe(fuel_storage,
  'A fuel_storage long',
  'A fuel_storage short').
describe(wine_cooler,
  'A wine_cooler long',
  'A wine_cooler short').
describe(toilet,
  'A toilet long',
  'A toilet short').
describe(sewage,
  'A sewage long',
  'A sewage short').
describe(hangover_pill,
  'A hangover_pill long',
  'A hangover_pill short').
describe(smadf_ship,
  'A smadf_ship long',
  'A smadf_ship short').
describe(red_herring,
  'A red_herring long',
  'A red_herring short').
describe(straw_man,
  'A straw_man long',
  'A straw_man short').
describe(nothing,
  'A nothing long',
  'A nothing short').

%items Description.