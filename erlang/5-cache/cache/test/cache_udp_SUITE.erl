%%%-------------------------------------------------------------------
%%% @doc
%%% @end
%%%-------------------------------------------------------------------
-module(cache_udp_SUITE).
-export([all/0, suite/0]).
-export([init_per_suite/1, end_per_suite/1]).
-export([init_per_testcase/2, end_per_testcase/2]).
-export([udp/1]).
-include_lib("common_test/include/ct.hrl").

%%--------------------------------------------------------------------
%% @doc
%% @end
%%--------------------------------------------------------------------
all() ->
    [udp].

%%--------------------------------------------------------------------
%% @doc
%% @end
%%--------------------------------------------------------------------
suite() ->
    [].

%%--------------------------------------------------------------------
%% @doc
%% @end
%%--------------------------------------------------------------------
init_per_suite(Config) ->
    Config.

%%--------------------------------------------------------------------
%% @doc
%% @end
%%--------------------------------------------------------------------
end_per_suite(_Config) ->
    ok.

%%--------------------------------------------------------------------
%% @doc
%% @end
%%--------------------------------------------------------------------
init_per_testcase(_, Config) ->
    Config.

%%--------------------------------------------------------------------
%% @doc
%% @end
%%--------------------------------------------------------------------
end_per_testcase(_, Config) ->
    ok.

%%--------------------------------------------------------------------
%% @doc
%% @end
%%--------------------------------------------------------------------
udp(Config) ->
    ok = cache_udp_client:add(localhost, 31415, <<"key">>, <<"value">>),
    {ok, <<"value">>} = cache_udp_client:get(localhost, 31415, <<"key">>),
    {ok, <<"key">>} = cache_udp_client:get_keys(localhost, 31415),
    {ok, <<"value">>} = cache_udp_client:get_values(localhost, 31415),
    ok = cache_udp_client:delete(localhost, 31415, <<"key">>),
    {error, timeout} = cache_udp_client:get(localhost, 31415, <<"key">>).

