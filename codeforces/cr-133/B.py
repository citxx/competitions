#!/usr/bin/python

import random


n, m = [int(x) for x in raw_input().split()]

enemies = [tuple(map(int, raw_input().split())) for i in range(m)]


dsu = list(range(n))
cnt = [1] * n
cycle = [False] * n

def get(v):
    if dsu[v] == v:
        return v
    else:
        dsu[v] = get(dsu[v])
        return dsu[v]

def join(u, v):
    u, v = get(u), get(v)
    if u == v:
        cycle[v] = True
    elif random.randrange(2) == 0:
        dsu[u] = v
        cnt[v] += cnt[u]
    else:
        dsu[v] = u
        cnt[u] += cnt[v]


for x, y in enemies:
    join(x - 1, y - 1)

ans = 0
for i in range(n):
    if dsu[i] == i:
        if cnt[i] > 1 and cycle[i]:
            ans += cnt[i] % 2

print ans
