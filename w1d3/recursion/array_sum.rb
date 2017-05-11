

def iterative_sum(array)
  sum = 0

  array.each do |num|
    sum += num
  end

  sum
end

def recursive_sum(array)
  return 0 if array.empty?

  array[0] + recursive_sum(array.drop(1))
end

puts iterative_sum([1, 2, 3, 4, 5])
puts recursive_sum([1, 2, 3, 4, 5])
