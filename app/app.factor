USING: kernel io http.client command-line namespaces arrays sequences formatting urls accessors ;
IN: app

SYMBOL: server-url
SYMBOL: player-key

: parse-arguments ( -- )
  command-line get
  server-url player-key 2array
    [ set ] 2each ;

: api-url ( -- url ) 
  server-url get >url
  player-key get
  "playerKey"
    set-query-param ;

: contact-server ( -- body ) api-url http-get swap code>> 200 assert= ;

: main ( -- ) 
  parse-arguments
  server-url get player-key get "ServerUrl: %s; PlayerKey: %s\n" printf
  contact-server drop ;

MAIN: main

