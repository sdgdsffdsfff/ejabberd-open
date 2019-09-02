%%%----------------------------------------------------------------------
%%%%%% File    : ejabberd_auth_sql.erl
%%%%%% Purpose : auth qtalk key
%%%%%%----------------------------------------------------------------------
%%%

-module(qtalk_auth).

-export([check_user_password/3]).

-include("ejabberd.hrl").
-include("logger.hrl").

check_user_password(Host, User, Password) ->
    case catch rsa:dec(base64:decode(Password)) of
        Json when is_binary(Json) ->
            R = case qtalk_sql:get_password_salt_by_host(Host, User) of
                {selected,_, [[Password1, Salt]]} ->
                    {ok,{obj,L},[]} = rfc4627:decode( Json),
                    Pass = proplists:get_value("p",L),
                    Key = proplists:get_value("mk",L),
                    case Key of
                        undefined -> ok;
                    _->
                        NewKey = qtalk_public:concat(User,<<"@">>,Host),
                        catch set_user_mac_key(Host,NewKey,Key)
                    end,
                    do_check_host_user(Password1,Pass, Salt);
                _ -> false
           end,
           case R of
               false -> ?ERROR_MSG("auth fail for ~p~n", [Json]), false;
               true -> true
           end;
        _ -> do_check_host_user_auth(Host, User, Password)
    end.

do_check_host_user_auth(Host, User, Password) ->
    Json = base64:decode(Password),
    {ok,{obj,L},[]} = rfc4627:decode(Json),
    Pass = proplists:get_value("p",L),
    Key = proplists:get_value("mk",L),

    Url = ejabberd_config:get_option(auth_url,fun(Url)-> binary_to_list(Url) end,"http://127.0.0.1:8081/corp/auth/checktoken.qunar"),
    Header = [],
    Type = "application/json",
    HTTPOptions = [],
    Options = [],
    Body = rfc4627:encode({obj, [{"user", User}, {"host", Host}, {"token", Pass}]}),
    case catch http_client:http_post(Url,Header,Type,Body,HTTPOptions,Options) of
    {ok, {_Status,_Headers, Res}} ->
        case rfc4627:decode(Res) of
            {ok,{obj,Args},_} ->
                case proplists:get_value("ret", Args) of
                    R when R =:= true; R =:= "true" ->
                        case Key of
                            undefined -> ok;
                            _ ->
                                NewKey = qtalk_public:concat(User,<<"@">>,Host),
                                catch set_user_mac_key(Host,NewKey,Key)
                        end,
                        true;
                    _ -> ?ERROR_MSG("auth password fail for ~p~n", [Res]), false
                end;
             _ -> ?ERROR_MSG("auth password fail for ~p~n", [Res]), false
        end;
      R -> ?ERROR_MSG("auth password fail for ~p~n", [R]), false
    end.

do_check_host_user(<<"CRY:", _>>, _, null) -> false;
do_check_host_user(<<"CRY:", Password/binary>>,Pass, Salt) ->
    P1 = do_md5(Pass),
    P2 = do_md5(<<P1/binary, Salt/binary>>),
    do_md5(P2) =:= Password;
do_check_host_user(Password, Password, _) -> true;
do_check_host_user(_, _, _) -> false.


do_md5(S) ->
     p1_sha:to_hexlist(erlang:md5(S)).

set_user_mac_key(Server,User,Key) ->
    UTkey = str:concat(User,<<"_tkey">>),
    case mod_redis:redis_cmd(2,["HKEYS",UTkey]) of
    {ok,L} when is_list(L) ->
        case lists:member(Key,L) of
        true ->
            lists:foreach(fun(K) ->
                    catch mod_redis:hash_del(2,UTkey,K) end,L -- [Key]);
        _ ->
            lists:foreach(fun(K) ->
                    catch mod_redis:hash_del(2,UTkey,K) end,L -- [Key]),
            catch mod_redis:hash_set(2,UTkey,Key,qtalk_public:get_timestamp())
        end;
    _ ->
        catch mod_redis:hash_set(2,UTkey,Key,qtalk_public:get_timestamp())
    end.
