#!/usr/bin/env python3
# -*- coding: utf-8 -*-

def factorial(n):
    result = 1
    for i in range(1, n + 1):
        result *= i
    return result


total = 0
for i in range(10, 7 * factorial(9)):
    s = sum(factorial(int(x)) for x in str(i))
    if s == i:
        total += s
        print(i)

print("Sum:", total)
