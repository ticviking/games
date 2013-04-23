This was as assignment for CS 4700 - Programming Languages

Basic game description
==============

Escape from SmAdF, is a silly adventure game about a booze powered ship that has been stopped by MADD, and must get going again. You are 
Tom Tightpants, and are assigned to rescue the day, and get those moms off your back!

Map of your game world including locations of objects
---

                              bridge
                                  |
    quarters -- ballroom -- galley
                              |
    cargo bay -- hall-- head
                            |
                  engineering

Addionally there are space areas, who's map is a puzzle.

Listing of actions which can be performed and expected syntax
--
actions are in general in the format 'command target.' with the punctuation required for parsing.

help. is the most useful command and gives detailed usage for each other command

SPOILERS
===

Listing of the quests/puzzles in your game and the steps to complete them
--
get outside [bugged still] - go to engineering, take shrink ray, go to head, use shrink ray, flush toilet, go west from pipes to space.
naviage space[completely unimplemented] - throw one of your infinate wrenches[TODO description] the opposate way of where you wish to go, pick up pill, return to ship, go to engineering, drop pill.
distract madd[partially implementd] - open cooler, find bikini in wardrobe in quarters, give bikini to bear, find wine cooler in fuel storage, give wine cooler to bear, take bear to cargo, open hanger door.