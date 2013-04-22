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
    print('You hit an invisible wall and can\'t go that way'), nl, nl.

process_input([exit]) .
process_input([quit]).

% Add some help output here to explain how to play your game
process_input([help]) :- print('Add some help output here...'), nl.

% Unknown Input
process_input([_]) :-
    print('No idea what you are talking about...try again'), nl, nl.

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
