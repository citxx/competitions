inp := File standardInput
s := inp readLine

bestCount := 0
bestStr := ""

for (r, 0, s size,
    for (l, 0, r-1,
        writeln("l = " .. l asString)
#        writeln("r = " .. r asString)
        subS := s slice (l, r)
        len := subS size
        count := 0
        for (k, 0, s size - len + 1,
            if (subS == s slice (k, k+len)) then (
                count = count + 1
            )
        )
        if (count == bestCount and (subS size > bestStr size or (subS size == bestStr size and subS > bestStr))) then (bestStr = subS)
        if (count > bestCount) then (
            bestCount = count
            bestStr = subS
        )
    )
)

writeln(bestStr)
