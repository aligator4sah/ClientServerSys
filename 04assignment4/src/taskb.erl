%% @author Administrator
%% @doc @todo Add description to taskb.


-module(taskb).

%% ====================================================================
%% API functions
%% ====================================================================
-export([guards/1]).

guards(Age)  when Age >=21 -> true;
guards(Age)  when Age < 0  -> error({outOfBoundsArgument, Age});
guards(Age)                -> false.

%% ====================================================================
%% Internal functions
%% ====================================================================


