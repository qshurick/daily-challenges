#!/usr/bin/env escript
%% -*- erlang -*-
main(String) ->
    code:add_path("/app"),
    try
        Input = string:join(String, " "),
        Result = math:calculate(Input),
        io:format("Result of [~s] is [~w]~n", [Input, Result])
    catch
        Error:Code ->
            io:format("Failed: [~w] [~w]~n", [Error, Code]),
            usage()
    end;
main(_) ->
    io:format("default~n"),
    usage().

usage() ->
    io:format("usage: calculate one plus two~n"),
    halt(1).
