USING: io kernel math math.parser effects.parser words arrays math.order ;
IN: syntax
IN: sequences
IN: arrays
IN: assocs

: inter ( odd str -- inter_str )
    dup empty?
        [  ]
    if ;

readln
0 swap inter
print
