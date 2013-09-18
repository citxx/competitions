inp := File standardInput
sn := inp readLine
n := sn asNumber

div := 0
nDiv := 0

# writeln(n)
sn foreach (sdig,
    dig := sdig asCharacter asNumber
    # writeln(dig)
    if (n % dig == 0) then (
        div = div + 1
    ) else (
        nDiv = nDiv + 1
    )
)
# writeln(div)
# writeln(nDiv)

if (nDiv == 0) then (
    writeln("happier")
) else (
    if (div == 0) then (
        writeln("upset")
    ) else (
        writeln("happy")
    )
)
