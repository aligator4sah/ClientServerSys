%% @author Administrator
%% @doc @todo Add description to file_server_concurrency.


-module(file_server_concurrency).

%% ====================================================================
%% API functions
%% ====================================================================
-export([start/1,loop/1]).

start(Dir) -> spawn(file_server_concurrency, loop, [Dir]).

loop(Dir) ->
     receive
         {Client, list_dir} ->
			 Client ! {self(), file:list_dir(Dir)};
             {Client, {get_file, File}} ->
                  Full = filename:join(Dir, File),
                  Client ! {self(), file:read_file(Full)}
     end,
loop(Dir).


%% ====================================================================
%% Internal functions
%% ====================================================================


