#!/usr/bin/env python3
# -*- coding: utf-8 -*-

N = 200

summands = [1, 2, 5, 10, 20, 50, 100, 200]

count = [[None for s in summands] for i in range(N + 1)]

count[0][0] = 1
for i in range(1, len(summands)):
    count[0][i] = 0

for i in range(1, N + 1):
    for j in range(len(summands)):
        last = summands[j]
        count[i][j] = 0
        if last <= i:
            for k in range(j + 1):
                count[i][j] += count[i - last][k]

print(sum(count[N]))
