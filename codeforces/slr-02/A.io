inp := File standardInput
n := inp readLine asNumber

prime := list ()

for (i, 2, n,
    b := 1
    prime foreach(p,
        if (i % p == 0, b = 0)
    )
    if (b == 1, prime append (i))
)

prime = prime append (1) sort
sz := prime size

ans := method (sum, ind,
    result := list()
    if (ind == -1) then (result = nil) else (
        if (sum == prime at (ind)) then (result = list(sum)) else (
            if (prime at (ind) > sum) then (result = ans (sum, ind - 1)) else (
                var := ans (sum - prime at (ind), ind - 1)
                if (var != nil) then (result = var append (prime at (ind))) else (result = ans (sum, ind - 1))
            )
        )
    )
    result
)

l := ans (n, sz - 1)

if (l == nil) then (writeln("0")) else (
    writeln (l reverse map (asString) join ("+") .. "=" .. n asString)
)
