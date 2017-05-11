def bsearch(array, target)
  return nil if array.empty?

  probe_idx = array.length / 2
  probe = array[probe_idx]

  if target == probe
    return probe_idx
  elsif target < probe
    left = array[0...probe_idx]
    return bsearch(left, target)
  else
    right = array[(probe_idx + 1)..-1]
    subproblem = bsearch(right, target)
    return subproblem.nil? ? nil : subproblem + (probe_idx + 1)
  end
end





puts bsearch([1, 2, 3], 1) == 0
puts bsearch([2, 3, 4, 5], 3) == 1
puts bsearch([2, 4, 6, 8, 10], 6) == 2
puts bsearch([1, 3, 4, 5, 9], 5) == 3
puts bsearch([1, 2, 3, 4, 5, 6], 6) == 5
puts bsearch([1, 2, 3, 4, 5, 6], 0) == nil
puts bsearch([1, 2, 3, 4, 5, 7], 6) == nil
