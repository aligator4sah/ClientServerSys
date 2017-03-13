%% @author Administrator
%% @doc @todo Add description to geometry_concurrency_server_f.


-module(geometry_concurrency_server_f).

%% ====================================================================
%% API functions
%% ====================================================================
-export([start/0,area/2,loop/0, rpc/2]).

start()  -> spawn(geometry_concurrency_server_f, loop,[]).

area(Pid, What)  ->
	rpc(Pid, What).
	
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

%%Pid = geometry_concurrency_server_f:start().
%%geometry_concurrency_server_f:area(Pid,{circle,4}).


