inp := File standardInput

lNM := inp readLine split (" ") select (size > 0) map (asNumber)
n := lNM at (0)
m := lNM at (1)

t := inp readLine split (" ") select (size > 0) map (asNumber)
s := inp readLine split (" ") select (size > 0) map (asNumber)

t atPut (0, 0)
s atPut (0, 0)

t append (n+1)
s append (m+1)

t = t sort
s = s sort

countT := 0
countS := 0

for (i, 1, t size -1,
    if (t at (i) - t at (i-1) > 1) then (countT = countT + 1)
)
for (i, 1, s size -1,
    if (s at (i) - s at (i-1) > 1) then (countS = countS + 1)
)

writeln (countT*countS)
