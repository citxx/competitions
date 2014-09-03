local powers = {}
for a = 2, 100 do
  for b = 2, 100 do
    powers[math.pow(a, b)] = {}
  end
end

local numbers = {}
local n = 0
for k, v in pairs(powers) do
  n = n + 1
  numbers[n] = k
end

table.sort(numbers)

for i = 1, #numbers do
  print(numbers[i])
end
