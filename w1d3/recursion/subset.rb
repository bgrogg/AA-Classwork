class Array
  def subsets
    return [[]] if empty?

    subs = take(count - 1).subsets
    subs.concat(subs.map { |sub| sub + [last] })
  end
end


p [1,2,3].subsets
