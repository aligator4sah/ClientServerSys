%% @author Administrator
%% @doc @todo Add description to geometry_concurrency_server1.


-module(geometry_concurrency_server1).

%% ====================================================================
%% API functions
%% ====================================================================
-export([loop/0, rpc/2]).

rpc(Pid, Request) ->
	Pid ! {self(),Request},
    receive 
        Response ->
             Response
    end.

loop()  ->
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

%% to run this code
%% Pid = spawn(geometry_concurrency_server1, loop,[]).
%%geometry_concurrency_server1:rpc(Pid, {rectangle,6,8}).
