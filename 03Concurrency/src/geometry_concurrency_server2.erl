%% @author Administrator
%% @doc @todo Add description to geometry_concurrency_server2.


-module(geometry_concurrency_server2).

%% ====================================================================
%% API functions
%% ====================================================================
-export([loop/0, rpc/2]).

rpc(Pid, Request)  ->
	Pid ! {self(), Request},
	receive
		{Pid, Response} ->
			Response
	end.

loop() ->
     receive
		 {From, {rectangle, Width, Ht}} ->
			 From ! {self(), Width*Ht},
			 loop();
		 {From, {circle,R}}  ->
			 From! {self(), 3.14159*R*R},
			 loop();
		 {From, {sqaure,S}}  ->
			 From ! {self(), S*S},
			 loop();
		 {From, Other}     ->
			 From ! {self(), {error,Other}},
			 loop()
     end.

%% ====================================================================
%% Internal functions
%% ====================================================================

%%Pid = spawn(geometry_concurrency_server2,loop,[]).
%%geometry_concurrency_server2:rpc(Pid, {circle,5}).
