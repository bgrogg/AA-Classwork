class Array
  def merge_sort
    return self if count < 2

    middle = count / 2

    left, right = self.take(middle), self.drop(middle)
    sorted_left, sorted_right = left.merge_sort, right.merge_sort

    merge(sorted_left, sorted_right)
  end

  def merge(left, right)
    merged = []
    while left.length > 0 && right.length > 0
      merged << ((left.first < right.first) ? left.shift : right.shift )
    end

    merged + left + right
  end
end

p [192, 28, 43, 29, 1, 2, 200, 4].merge_sort
