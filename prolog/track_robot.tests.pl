:- begin_tests(track_robot).
:- include(track_robot).

test(track_robot_with_positive_steps) :-
    track_robot([20,30,10,40],X,Y),
    assertion(X == -10),
    assertion(Y == 10).

test(track_robot_with_negative_steps) :-
    track_robot([-10,20,10],X,Y),
    assertion(X == 20),
    assertion(Y == -20).

test(track_robot_with_no_steps) :-
    track_robot([],X,Y),
    assertion(X == 0),
    assertion(Y == 0).

:- end_tests(track_robot).

