# O(n^2) quadratic time
# O(1) constant space

def bad_two_sum?(array, target)
  array.length.times do |i|
    (array.length - i - 1).times do |j|
      return true if array[i] + array[j + i + 1] == target
    end
  end

  false
end

arr = [0, 1, 5, 7]

p bad_two_sum?(arr, 6) == true
p bad_two_sum?(arr, 10) == false


# O(n log n) linearithmic times
# O(n) linear space

def okay_two_sum?(array, target)
  array = array.sort

  array.each_with_index do |el, i|
    match_idx = array.bsearch_index { |el2| (target - el) <=> el2 }
    return true if match_idx && match_idx != i
  end
  false
end

p okay_two_sum?(arr, 6) == true
p okay_two_sum?(arr, 10) == false

# O(n) linear time
# O(n) linear space

def two_sum?(array, target)
  complements = {}

  array.each do |el|
    return true if complements[target - el]
    complements[el] = true
  end

  false
end
