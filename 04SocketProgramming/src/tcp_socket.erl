%% @author Administrator
%% @doc @todo Add description to tcp_socket.
%%

%%Using TCP
%%Write a simple TCP program that fetches data from server.

%%Let's start by writing a little function called nano_get_url1/0
%%that uses a TCP socket to fetch an HTML page form
%%http://www.google.com

-module(tcp_socket).

%% ====================================================================
%% API functions
%% ====================================================================

-compile(export_all).
-import(lists, [reverse/1]).

nano_get_url() ->
	nano_get_url("www.google.com").

nano_get_url(Host)    ->
	{ok, Socket} = gen_tcp:connect(Host,80,[binary, {packet,0}]),
	ok = gen_tcp:send(Socket, "GET/HTTP/1.0\r\n\r\n"),
    receive_data(Socket,[]).

receive_data(Socket,SoFar)   ->
	receive
		{tcp, Socket, Bin}  ->
			receive_data(Socket, [Bin|SoFar]);
	    {tcp_closed, Socket} ->
		  list_to_binary(reverse(SoFar))
    end.

%% 1.we open a TCP socket to port 80 of http://www.google.com
%%by calling gen_tcp:connect. The argument binary in the connect call tells the 
%% system to open the socket in "binary" mode deliver all data
%% to the application as binaries. {packet, 0} means
%% the TCP data is delivered directly to the application
%% in an unmodified form.

%% 2.We call gen_tcp;send and send the message GET/HTTP/1.0\r\n\r\n
%% to the socket. Then we wait for a reply. The reply doesn't come all 
%% in one but comes fragmented, a bit at a time.

%% 3.We receive a {tcp, Socket, Bin} message. The third argument in this tuple 
%% is a binary. This is because we opened the socket in binary mode.
%% This message is one of the data fragments sent to us from the
%% Web server, We add it to the list of fragment we have received so far
%% and wait for the next fragment.

%% 4.We received a {tcp_closed, Socket} message. This happens when the server has
%% finished sending us data. 

%%5.When all the fragments have come, we've stored them in the wrong order,
%% so we reverse the order and concatenate all the fragments.

%% ====================================================================
%% Internal functions
%% ====================================================================

%%B = tcp_socket:nano_get_url().
%%io:format("~p~n",[B]).
%%string:tokens(binary_to_list(B), "\r\n").

