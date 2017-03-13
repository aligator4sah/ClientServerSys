%% @author Administrator
%% @doc @todo Add description to shop.


-module(shop).

%% ====================================================================
%% API functions
%% ====================================================================
-export([cost/1]).

cost(oranges)   -> 5;
cost(newspaper) -> 8;
cost(apple)     -> 2;
cost(pears)     -> 9;
cost(milk)      -> 7;
cost(X)         -> item_not_in_list.


%% ====================================================================
%% Internal functions
%% ====================================================================


