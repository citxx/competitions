inp := File standardInput
sn := inp readLine

prev := ""
if (sn at (0) asCharacter == "-") then (
    prev = "-"
    sn = sn slice (1)
)

i := 0
while (sn at (i) != nil and sn at (i) asCharacter == "0", i = i+1)
sn = sn slice (i, sn size)
sn = sn reverse
i = 0
while (sn at (i) != nil and sn at (i)    asCharacter == "0", i = i+1)
sn = sn slice (i, sn size)
if (sn == "") then (
    sn = "0"
    prev = ""
)

writeln (prev .. sn)
