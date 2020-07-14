USING: kernel io http.client command-line namespaces arrays sequences formatting urls accessors http.client.post-data.private ;
IN: app

SYMBOL: server-url
SYMBOL: player-key

: parse-arguments ( -- )
  command-line get
  server-url player-key 2array
    [ set ] 2each ;

: api-url ( -- url ) 
  server-url get >url ;

: request-body ( -- post-data )
  player-key get >post-data ;

: contact-server ( -- body ) request-body api-url http-post swap code>> 200 assert= ;

: main ( -- ) 
  parse-arguments
  server-url get player-key get "ServerUrl: %s; PlayerKey: %s\n" printf
  contact-server "Server response: %s\n" printf ;

MAIN: main

