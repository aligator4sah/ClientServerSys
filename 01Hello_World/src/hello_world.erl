%% @author Administrator
%% @doc @todo Add description to hello_world.


-module(hello_world).

%% ====================================================================
%% API functions
%% ====================================================================
-export([firsthello/0,start/0]).

start() ->
	firsthello(),
	io:format("Hello World~n").

firsthello() ->
    io:fwrite("hello,world\n").

%io:fwrite("hello, world\n").
%% ====================================================================
%% Internal functions
%% ====================================================================


