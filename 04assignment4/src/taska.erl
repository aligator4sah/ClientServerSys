%% @author Administrator
%% @doc @todo Add description to taska.


-module(taska).

%% ====================================================================
%% API functions
%% ====================================================================
-export([list_comprehensions/0]).

list_comprehensions()   ->
		Odds = [X || X <- [1,2,3,4,5,6,7,8,9,10], X rem 2 =:= 1],
	    {Odds}.

%% ====================================================================
%% Internal functions
%% ====================================================================

