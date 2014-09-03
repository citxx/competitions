#!/usr/bin/env python3
# -*- coding: utf-8 -*-

MAX = 10 ** 6 + 1


def trunks(s):
    return [s[i:] for i in range(len(s))] + [s[:i + 1] for i in range(len(s))]


# Eratothenes
is_prime = [True] * MAX
is_prime[1] = False
for i in range(2, MAX):
    if is_prime[i]:
        for k in range(i ** 2, MAX, i):
            is_prime[k] = False

# Truncatable primes
s = 0
for i in range(10, MAX):
    if is_prime[i]:
        ps = [is_prime[int(s)] for s in trunks(str(i))]
        if sum(ps) == len(ps):
            print(i)
            s += i

print("Sum:", s)
