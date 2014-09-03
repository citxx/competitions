#!/usr/bin/env python3
# -*- coding: utf-8 -*-

cycles = []
for k in range(1, 1001):
	pos = {1: 0}
	reminder = 1
	i = 1
	while True:
		reminder = (10 * reminder) % k
		if reminder in pos:
			cycles.append((i - pos[reminder], k))
			break
		else:
			pos[reminder] = i
			i += 1
print(max(cycles))

