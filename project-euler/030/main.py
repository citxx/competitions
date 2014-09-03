#!/usr/bin/env python3
# -*- coding: utf-8 -*-

total = 0
for i in range(10, 1000000):
    s = sum(int(x) ** 5 for x in str(i))
    if s == i:
        total += s
        print(i)

print("Sum:", total)
