%% @author Administrator
%% @doc @todo Add description to geometry_test.


-module(geometry_test).

%% ====================================================================
%% API functions
%% ====================================================================
-export([area/1,test/0]).

test() ->
	12 = area({rectangle, 3, 4}),
    144 = area({square, 12}),
	test_worked.

area({rectangle, Width, Height}) -> Width * Height;
area({square, Side})             -> Side * Side;
area({circle, Radius})           -> 3.14159 * Radius * Radius;
area({triangle, Base, Height})   -> 1/2 * Base * Height.

%% ====================================================================
%% Internal functions
%% ====================================================================


