#!/usr/bin/env python3

N = 4000000
is_prime = [True] * N
is_prime[1] = False
for i in range(2, N):
	if is_prime[i]:
		for k in range(i * i, N, i):
			is_prime[k] = False
is_prime.extend(False for i in range(N))

ans = []
for a in range(-1000, 1001):
	for b in range(-1000, 1001):
		pn = 0
		while True:
			val = pn ** 2 + a * pn + b
			if val > 0 and is_prime[val]:
				pn += 1
			else:
				ans.append((pn, a, b, a * b))
				break

print(max(ans))

