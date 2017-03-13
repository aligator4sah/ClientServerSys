%% @author Administrator
%% @doc @todo Add description to simple_socket_server.


-module(simple_socket_server).

%% ====================================================================
%% API functions
%% ====================================================================
-compile(export_all).
-import(lists, [reverse/1]).

start_nano_server()  ->
	{ok, Listen} = gen_tcp:listen(2345,[binary, {packet,4},
                   {reuseaddr, true},
                   {active, true}]),
    {ok, Socket} = gen_tcp:accept(Listen),
    loop(Socket).

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

%%Error Testing
error_test() -> 
     spawn(fun() -> error_test_server() end),
	 sleep(2000),
	 {ok, Socket} = gen_tcp:connect("localhost", 
									4321, 
									[binary,{packet, 2}]),
	 io:format("Connected to:~p~n", [Socket]),
	 gen_tcp:send(Socket, <<"123">>),
	 receive
		 Any->
			 io:format("Any=~p~n", [Any])
     end.

error_test_server() ->
	{ok, Listen} = gen_tcp:listen(4321,[binary, {packet,2}]),
	{ok, Socket} = gen_tcp:accept(Listen),
    error_test_server_loop(Socket).

error_test_server_loop(Socket) ->
	receive
		{tcp, Socket, Data}  ->
			io:format("received:~p~n", [Data]),
			_ = atom_to_list(Data),
	error_test_server_loop(Socket)
    end.

sleep(T) ->
   receive
	   after T ->
		   ture
   end.

%% ====================================================================
%% Internal functions
%% ====================================================================


