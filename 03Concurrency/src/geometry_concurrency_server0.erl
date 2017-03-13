%% @author Administrator
%% @doc @todo Add description to geometry_concurrency_server0.


-module(geometry_concurrency_server0).

%% ====================================================================
%% API functions
%% ====================================================================
-export([loop/0]).

loop() ->
	receive
		{rectangle, Width, Ht} ->
			io:format("Area of rectangle is ~p~n",[Width*Ht]),
			loop();
		
		{square, Side} ->
			io:format("Area of square is ~p~n",[Side*Side]),
			loop()

   end.

%% ====================================================================
%% Internal functions
%% ====================================================================

%%Pid = spawn(geometry_concurrency_server0, loop,[]).
%%Pid ! {square,5}.

%%register(area, Pid).
%%area ! {square,5}.
%%unregister(area).
%%registered().