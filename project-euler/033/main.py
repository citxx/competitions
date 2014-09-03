#!/usr/bin/env python3
# -*- coding: utf-8 -*-

def gcd(a, b):
    while b != 0:
        a, b = b, a % b
    return a

def normalized(a, b):
    g = gcd(a, b)
    return (a // g, b // g)

numerator, denominator = 1, 1
for a in range(10, 100):
    for b in range(a + 1, 100):
        sa, sb = str(a), str(b)
        for c in frozenset(sa + sb):
            if c in sa and c in sb and not (c == '0' and sa[1] == c == sb[1]):
                ia = sa.index(c)
                ib = sb.index(c)
                sa2 = sa[:ia] + sa[ia + 1:]
                sb2 = sb[:ib] + sb[ib + 1:]
                a2 = int(sa2)
                b2 = int(sb2)
                if normalized(a, b) == normalized(a2, b2):
                    print("{}   {}".format(a, a2))
                    print("-- = -")
                    print("{}   {}".format(b, b2))
                    print()
                    numerator *= a
                    denominator *= b

n, d = normalized(numerator, denominator)
print("Denominator:", d)
