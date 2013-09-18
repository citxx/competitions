USING: io kernel math math.parser effects.parser words ;
IN: syntax

readln string>number

: printbin ( n -- )
    dup 0 =
        [ drop ]
        [ 2 /mod swap printbin number>string write ]
    if
;


dup 0 =
    [ drop "0" print ]
    [ printbin "" print ]
if
