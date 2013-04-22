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

:- use_module(library(readln)).
:- use_module(describe).

% Use this dynamic fact to store the player's current location
:- dynamic player_location/1.

% 


% You might connect those areas like this:
connected(north, exampleArea1, exampleArea2).
connected(south, exampleArea2, exampleArea1).

% This rule starts everything off
play :-
    retractall(player_location(_)),
    assertz(player_location(exampleArea1)),
    print_location,
	dispPrompt,
    get_input.

% Prints out the players current location description
print_location :-
    player_location(Current),
    area(Current, _, Description), write(Description), nl.

% Changes the players current location, validity of change is checked earlier
change_area(NewArea) :-
    player_location(Current),
    retract(player_location(Current)),
    assertz(player_location(NewArea)).

% Displays the player prompt so they can enter actions
dispPrompt :- prompt(_, '> ').

% Handling of the action 'go _______', and a good example of how you might implement others
process_input([go, Direction]) :-
    player_location(Current),
    connected(Direction, Current, NewRoom),
    change_area(NewRoom).
process_input([go, _]) :-
    print('You hit an invisible wall and can\'t go that way'), nl, nl.
process_input([exit]) :-

process_input([_]) :-
    print('No idea what you are talking about...try again'), nl, nl.

% Add some help output here to explain how to play your game
process_input([help]) :- print('Add some help output here...'), nl.

%%%% Below is just some basic input handling, you probably don't have to mess with it %%%%

% Get input from the user
get_input :- read_sentence(Input), get_input(Input).
get_input([quit]).
get_input([exit]).
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