#!/usr/bin/env python3
# -*- coding: utf-8 -*-

num_to_char = ["oqz", "ij", "abc", "def", "gh", "kl", "mn", "prs", "tuv", "wxy"]
char_to_num = {char: str(num) for num in range(len(num_to_char)) for char in num_to_char[num]}

#print(*list(char_to_num.items()), sep="\n")

while True:
    phone_number = input().strip()
    if phone_number == "-1":
        break

    dict_size = int(input())
    dictionary = {
        word:  ''.join([char_to_num[c] for c in word])
        for i in range(dict_size)
        for word in [input().strip()]
    }

    #print(dictionary)

    n = len(phone_number) + 1
    previous, words, count = [None] * n, [None] * n, [None] * n
    count[0] = 0
    for i in range(1, n):
        for word, digits in dictionary.items():
            if (digits == phone_number[i - len(digits):i] and
                count[i - len(digits)] is not None and
                (not count[i] or count[i - len(digits)] + 1 < count[i])
            ):
                count[i] = count[i - len(digits)] + 1
                previous[i] = i - len(digits)
                words[i] = word
    #print(*zip(range(n), count, previous, words), sep="\n")

    if count[-1] is None:
        print("No solution.")
    else:
        answer = []
        x = -1
        while words[x] is not None:
            answer.append(words[x])
            x = previous[x]
        print(*reversed(answer))

