#!/usr/bin/env python3

n = int(input())

last = 1
size = 1
s = 1

while size < n:
	size += 2
	for i in range(4):
		last += size - 1
		s += last

print(s)

