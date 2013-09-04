#!/usr/bin/env python3
# -*- coding: utf-8 -*-


n = int(input())
f = [int(input()) for i in range(n)]

best_x, best_k = 0, f[1] - f[0]
for x in range(1, len(f) - 1):
	k = f[x + 1] - f[x]
	if abs(k) > abs(best_k):
		best_x, best_k = x, k

print(best_x + 1, best_x + 2)

