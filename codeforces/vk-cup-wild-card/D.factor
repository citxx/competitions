USING: io kernel math math.parser effects.parser words ;
IN: syntax
IN: sequences


readln
[ dup "0" first < swap "9" first > or ]
filter
print
