#!/usr/bin/env python3
# -*- coding: utf-8 -*-


n = int(input())
k = int(input())

count = [[None] * k for i in range(n)]
count[0] = [1] * k
for i in range(1, n):
	count[i][0] = sum(count[i - 1][1:])
	for d in range(1, k):
		count[i][d] = sum(count[i - 1])

print(sum(count[-1][1:]))

