#!/usr/bin/env python

def mul(a, b):
    res = []
    for i in range(len(b)):
        res.append(a*b[i])
    return tuple(res)

def add(a, b):
    res = []
    for i in range(len(a)):
        res.append(a[i]+b[i])
    return tuple(res)

n, j = tuple(map(int, raw_input().split()))

m0 = tuple(map(int, raw_input().split()))
a = []
for k in range(n):
    a.append(tuple(map(int, raw_input().split())))

par = j / (2*n)
j = j % (2*n)
sign = 1
if par % 2 == 1:
    sign = -1

s = 1
sum = (0, 0)
while j != 0:
    sum = add(sum, mul(2*s, a[(j-1)%n]))
    s = -s
    j -= 1
sum = add(sum, mul(s, m0))

print sum[0], sum[1]
