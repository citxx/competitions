USING: io kernel math math.parser effects.parser words ;
IN: syntax

: print_factor ( k n -- )
    over over =
        [ drop number>string print ]

        [
            over over swap /mod
                0 =
                    [
                        swap drop
                        swap dup number>string write "*" write
                        swap print_factor
                    ]
                    [ drop swap 1 + swap print_factor ]
                if
        ]
    if
;

readln string>number
2 swap print_factor
