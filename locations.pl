:- module(locations, [connected/3]).



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

%TODO - how does the toilet connect head to pipes

%TODO - Space movement(with throw)