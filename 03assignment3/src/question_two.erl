%% @author Sabrina
%% @email sah178@pitt.edu


-module(question_two).

%% ====================================================================
%% API functions
%% ====================================================================
-export([convert_r/2]).

convert(M, inch) ->    
	M / 2.54; 

convert(N, centimeter) ->    
	N * 2.54.

convert_r(X,Input) ->
	if
		Input == inch ->
			convert(X,inch);
		Input == centimeter ->
			convert(X,centimeter);
		true ->
			io:format("Sorry we are not able to help with the conversion ~n")
	end.


%% ====================================================================
%% Internal functions
%% ====================================================================


