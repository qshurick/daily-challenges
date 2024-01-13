track_robot(Movements, X, Y) :- track_robot(Movements, north, 0, 0, X, Y).

track_robot([], _, CX, CY, CX, CY) :- !.

track_robot([Step|Movements], north, CX, CY, X, Y) :-
    NewY is CY+Step,
    track_robot(Movements, east, CX, NewY, X, Y),!.

track_robot([Step|Movements], east, CX, CY, X, Y) :-
    NewX is CX+Step,
    track_robot(Movements, south, NewX, CY, X, Y),!.

track_robot([Step|Movements], south, CX, CY, X, Y) :-
    NewY is CY-Step,
    track_robot(Movements, west, CX, NewY, X, Y),!.

track_robot([Step|Movements], west, CX, CY, X, Y) :-
    NewX is CX-Step,
    track_robot(Movements, north, NewX, CY, X, Y).

