%% @author Administrator
%% @doc @todo Add description to udp_socket.


-module(udp_socket).

%% ====================================================================
%% API functions
%% ====================================================================
-export([start_server/0]).

start_server()  ->
	spawn(fun() -> server(4000) end).

%%The server
server(Port)  ->
	{ok, Socket} = gen_udp:open(Port, [binary]),
	io:format("Server opened socket:~p~n", [Socket]),
	loop(Socket).

loop(Socket)  ->
	receive
		{udp, Socket, Host, Port, Bin} = Msg ->
			io:format("Server received:~p~n", [Msg]),
			N = binary_to_term(Bin),
	        Fac = fac(N),
            gen_udp:send(Socket, Host, Port, term_to_binary(Fac)),
            loop(Socket)
	end.

fac(0) -> 1;
fac(N) -> N * fac(N-1).




%% ====================================================================
%% Internal functions
%% ====================================================================


