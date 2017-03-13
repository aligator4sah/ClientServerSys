%% @author Administrator
%% @doc @todo Add description to timeout.


-module(timeout).

%% ====================================================================
%% API functions
%% ====================================================================
-export([sleep/1,start/2,timer/2,cancel/1]).

sleep(T)  ->
	receive
		after T ->
			true


    end.
%%Implementing a Timer

start(Time, Fun)  -> spawn(fun() -> timer(Time, Fun)end).


cancel(Pid)  -> Pid ! cancel.
	
timer(Time,Fun)   ->
	receive
		cancel ->
			void
       after Time ->
		   Fun()
   end.
%% ====================================================================
%% Internal functions
%% ====================================================================

%%Pid = timeout:start(5000, fun()->io:format("timer event~n")end).
%%timeout:cancel(Pid4).

