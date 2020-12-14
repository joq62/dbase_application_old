%%% -------------------------------------------------------------------
%%% @author  : Joq Erlang
%%% @doc: : 
%%%  c
%%% Created : 10 dec 2012
%%% -------------------------------------------------------------------
-module(systool_script). 



-export([start/0
	]).


% --------------------------------------------------------------------
%% Function:start/0 
%% Description: Initiate the eunit tests, set upp needed processes etc
%% Returns: non
%% --------------------------------------------------------------------
start()->
    systools:make_script("dbase",[local]).
