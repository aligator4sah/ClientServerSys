%% @author Administrator
%% @doc @todo Add description to seq_socket_server.


-module(seq_socket_server).

%% ====================================================================
%% API functions
%% ====================================================================
-compile(export_all).
-import(lists, [reverse/1]).

start_seq_server()  ->
	{ok, Listen} = gen_tcp:listen(2345,[binary, {packet,4},
                   {reuseaddr, true},
                   {active, true}]),
	{ok, Socket} = gen_tcp:accept(Listen),
	seq_loop(Listen).

seq_loop(Listen)   ->
	 {ok, Socket} = gen_tcp:accept(Listen),
     loop(Socket),
     seq_loop(Listen).

loop(Socket)     ->
     receive
        {tcp, Socket, Bin}    ->
			io:format("Server received binary = ~p~n", [Bin]),
			Str = binary_to_term(Bin),
			io:format("Server (unpacked) ~p~n", [Str]),
		    Reply = string:to_upper(Str),
			io:format("Server replying = ~p~n", [Reply]),
			gen_tcp:send(Socket, term_to_binary(Reply)),
			loop(Socket);
		 {tcp_closed, Socket}   ->
			 io:format("Server socket closed ~n")
     end.



%% ====================================================================
%% Internal functions
%% ====================================================================


