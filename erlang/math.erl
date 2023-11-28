-module(math).
-export([calculate/1]).

append(Last, [Head | Tail]) ->
    [Head | append(Last, Tail)];
append(Last, []) ->
    Last.

to_number(String) ->
    if
        String == "zero" -> 0;
        String == "one" -> 1;
        String == "two" -> 2;
        String == "three" -> 3;
        String == "four" -> 4;
        String == "five" -> 5;
        String == "six" -> 6;
        String == "seven" -> 7;
        String == "eight" -> 8;
        String == "nine" -> 9;
        true ->
            io:format("Failed to convert [~s] to a number", [String]),
            halt()
    end.

calculate(Sentance) ->
    calculate([], none, none, string:lowercase(Sentance)).

calculate(Left, none, none, [Symbol | Tail]) ->
    if 
        Symbol == 32 ->
            calculate(Left, [], none, Tail);
        true ->
            calculate(append([Symbol], Left), none, none, Tail)
    end;

calculate(Left, Operation, none, [Symbol | Tail]) ->
    if 
        Symbol == 32 ->
            calculate(Left, Operation, [], Tail);
        true ->
            calculate(Left, append([Symbol], Operation), none, Tail)
    end;

calculate(Left, Operation, Right, [Symbol | Tail]) ->
    calculate(Left, Operation, append([Symbol], Right), Tail);

calculate(Left, Operation, Right, []) ->
    calculate(Left, Operation, Right).

calculate(Left, plus, Right) ->
    to_number(Left) + to_number(Right);

calculate(Left, minus, Right) ->
    to_number(Left) - to_number(Right);

calculate(Left, Operation, Right) ->
    if
        Operation == "plus" ->
            calculate(Left, plus, Right);
        Operation == "minus" ->
            calculate(Left, minus, Right);
        true ->
            io:format("Failed with Left: [~s] Operation [~s] Right [~s]~n", [Left, Operation, Right])
    end.

