%% @author Administrator
%% @doc @todo Add description to mylists.


-module(mylists).
-vsn(1234).
-author ({sabrina, han}).
-purpose("example of attributes").

%% ====================================================================
%% API functions
%% ====================================================================
%%-export([]).
-compile(export_all).
%%all functions are public

sum([H|T])    -> H + sum(T);
sum([])       -> 0.

%%Quick Sort Algorithm
qsort([])         -> [];
qsort([Pivot|T])  ->
	qsort([X || X<-T, X<Pivot])
    ++ [Pivot] ++
		qsort([X || X<-T, X>=Pivot]).

%%Pythagorean Triplets
pythag(N)   -> 
      [{A,B,C} ||
	   A <- lists:seq(1, N),
	   B <- lists:seq(1, N),
	   C <- lists:seq(1, N),
       A+B+C =< N,
	   A*A+B*B =:= C*C
	  ].


%%Anagrams
perms([])    -> [[]];
perms(L)     -> [[H|T] || H<- L, T<- perms(L--[H])].


%% Guards
max(X, Y) when X > Y   -> X;
max(X, Y)              -> Y.


%%Accumulators
odds_and_evens1(L)   ->
    Odds  = [X || X<-L, (X rem 2) =:= 1],
	Evens = [X || X<-L, (X rem 2) =:= 0],
	{Odds, Evens}.

odds_and_evens2(L)    ->
     odds_and_evens_acc(L, [], []).
 
     odds_and_evens_acc([H|T], Odds, Evens)   ->
	       case (H rem 2) of 
              1 -> odds_and_evens_acc(T, [H|Odds], Evens);
			  0 -> odds_and_evens_acc(T, Odds, [H|Evens])
		   end;
    odds_and_evens_acc([], Odds, Evens)     ->
	    %%{Odds, Evens}.
        {lists:reverse(Odds), lists:reverse(Evens)}.

%%Part of Error Handling
sqrt(X)  when X<0   ->
				   error({squareRootNegativaArgument, X});
sqrt(X)     -> math:sqrt(X).

%% ====================================================================
%% Internal functions
%% ====================================================================


