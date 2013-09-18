inp := File standardInput
n := inp readLine asNumber

odd := 0
even := 0

for (i, 1, n,
    if (n % i == 0) then (
        if (i % 2 == 1) then (odd = odd + 1) else (even = even + 1)
    )
)

if (odd == even) then (writeln("yes")) else (writeln("no"))
