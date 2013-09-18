a := 1
b := 1

inp := File standardInput
n := inp readLine asNumber

for (i, 1, n,
    c := b
    b = a+b
    a = c
)

writeln(a)
