%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% game.pl
%
% Use this as the starting point for your game.  This starter code includes
% the following:
%  - Two example areas
%  - An example of how you might connect those areas
%  - Handling of the actions 'go _______.', 'help.', and 'quit.'
%  - Basic input processing which strips punctuation and puts the words into a list
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% allow use of .pro
user:prolog_file_type(pro, prolog).
:- use_module(library(readln)).
:- use_module(describe).
:- use_module(locations).
:- use_module(objects).
:- use_module(utility).

% Players current location
player_location(Location) :-
  player in Location.

%dynamic facts for the win condition
:- dynamic smadf_distracted/0.
:- dynamic ship_started/0.

% This rule starts everything off
play :-
    retractall(smadf_distracted),
    retractall(ship_started),
    describe(intro),
    print_location,
    dispPrompt,
    repeat, %until both get_input and win are true, try them both.
    get_input, win.

win :-
  smadf_distracted,
  ship_started. % if the ship has been started you've solved both get outside and throw stuff outside.
  %TODO - print a win message if and only if win is already true.

% Prints out the players current location description
print_location :-
    player_location(Current),
    nl, writef("You are in: "),
    short_describe(Current),
    %TODO - List the objects that are there.
    nl.

% Changes the players current location, validity of change is checked earlier
change_area(NewArea) :-
    place player in NewArea.

% Displays the player prompt so they can enter actions
dispPrompt :- prompt(_, '> ').

% Handling of the action 'go _______', and a good example of how you might implement others
process_input([go, Direction]) :-
    player_location(Current),
    connected(Current, Direction, NewRoom),
    change_area(NewRoom).
process_input([north]):- process_input([go, north]).
process_input([south]):- process_input([go, south]).
process_input([east]):- process_input([go, east]).
process_input([west]):- process_input([go, west]).
process_input([go, _]) :-
    not(player in space),
    print('You can\'t go that way'), nl, nl.
process_input([go, _]) :-
  player in space,
  print('How, you don\'t have anything to push off of!').

process_input([exit]) .
process_input([quit]).

process_input([inventory]) :-
  bagof(Item, Item in inventory, Items),
  writef("Searching through your pockets you find:\n"),
  print_item_list(Items).

process_input([look]) :-
  player in Current,
  describe(Current), nl,
  writef("There are the following things here:\n"),
  bagof(Item, Item in Current,  Items),
  print_item_list(Items).
process_input([look, polar]) :-
  do_look(bear).
process_input([look, shrink]) :-
  do_look(shrink_ray).
  process_input([look, ray]) :-
  do_look(shrink_ray).
process_input([look, Item]) :-
  do_look(Item).

do_look(Item) :-
  player in Current, 
  (Item in Current; Item in inventory),
  describe Item.

% Add some help output here to explain how to play your game
process_input([help]) :-
  describe(help), nl.

process_input([pick, up, Item]):- process_input([take, Item]).
process_input([loot, Item]):- process_input([take, Item]).

% take item generic
process_input([take, Item]) :-
  player_location(Current),
  (Item in Current; %this is here and not in takable so as to avoid circular modules
    (Item in Z, Z in Current)),
  takable(Item),
  place Item in inventory,
  writef("You take "), short_describe(Item), writef(" and place it in your inventory.\n").
process_input([take, Item]) :- %Item is not there.
  player in Current,
  not(Item in Current),
  short_describe(Item), writef(" is not here.\n").

process_input([drop, Item]) :-
  Item in inventory,
  player in Current,
  place Item in Current.
process_input([drop, _]) :-
  writef("You don't have that.\n").

% Unknown Input
process_input([_]) :-
    writef("Just thinking about it makes your head hurt, maybe you should try something else"), nl, nl.

%%%% Below is just some basic input handling, you probably don't have to mess with it %%%%

% Get input from the user
get_input :- read_sentence(Input), get_input(Input).
get_input([quit]):- halt.
get_input([exit]):- halt.
get_input(Input) :-
    process_input(Input), print_location,
    read_sentence(Input1), get_input(Input1).

% Reads a sentence from the prompt
read_sentence(Input) :-
    readln(Input1, _, ".!?", "_0123456789", lowercase),
    strip_punctuation(Input1, Input).

% Strips punctuation out of the user input
strip_punctuation([], []).
strip_punctuation([Word|Tail], [Word|Result]) :-
    \+(member(Word, ['.', ',', '?', '!'])),
    strip_punctuation(Tail, Result).
strip_punctuation([_|Tail], Result) :-
    strip_punctuation(Tail, Result).
