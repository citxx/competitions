USING: io kernel math math.parser effects.parser words arrays math.order ;
IN: syntax
IN: sequences
IN: arrays
IN: assocs

: five ( acc n -- count )
    dup 0 =
        [ drop drop 0 ]
        [ 5 /mod
            0 = not
                [ drop ]
                [ swap 1 + swap five ]
            if
        ]
    if ;

: factorial_factors ( acc n -- factors )
    dup 0 =
        [ drop ]
        [
            swap over 0 swap five + swap 1 - factorial_factors
        ]
    if ;

readln string>number
0 swap factorial_factors
number>string print
