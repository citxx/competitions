USING: io kernel math math.parser effects.parser words ;
IN: syntax
IN: sequences


readln
[ dup "H" first = swap dup "Q" first = swap "9" first = or or ]
filter
empty?
    [ "NO" ]
    [ "YES" ]
if
print
