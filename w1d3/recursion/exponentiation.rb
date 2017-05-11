def exp1(base, power)
  return 1 if power == 0

  base * exp1(base, power - 1)
end

def exp2(base, power)
  return 1 if power == 0
  return base if power == 1

  if power.even?
    exp2(base, power / 2) * base
  else
    base * (exp2(base, (power - 1) / 2) * base)
  end
end

puts exp1(2, 3)
puts exp2(2, 3)
