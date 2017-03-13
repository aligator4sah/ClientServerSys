%% @author Administrator
%% @doc @todo Add description to udp_client.


-module(udp_client).

%% ====================================================================
%% API functions
%% ====================================================================
-export([client/1]).

client(N)  ->
     {ok, Socket} = gen_udp:open(0, [binary]),
     io:format("Client opened socket=~p~n", [Socket]),
	 ok = gen_udp:send(Socket, localhost, 4000, term_to_binary(N)),
     Value = receive 
				 {udp, Socket, _, _, Bin} = Msg ->
					 io:format("Client received:~p~n", [Msg]),
					 binary_to_term(Bin)
    
                     after 2000 ->
						 0
             end,
    gen_udp:close(Socket),
	Value.




%% ====================================================================
%% Internal functions
%% ====================================================================


