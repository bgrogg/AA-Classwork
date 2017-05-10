require 'byebug'

class Array

  # Extend the Array class to include a method named my_each that takes a block, calls the block on every element of the array, and returns the original array.
  def my_each(&prc)
    self.length.times do |i|
      prc.call(self[i])
    end

    self
  end

  # Now extend the Array class to include my_select that takes a block and returns a new array containing only elements that satisfy the block. Use your my_each method!
  def my_select(&prc)
    selected = []

    self.my_each do |num|
      selected << num if prc.call(num)
    end

    selected
  end

  #Write my_reject to take a block and return a new array excluding elements that satisfy the block.
  def my_reject(&prc)
    accepted = []

    self.my_each do |num|
      accepted << num unless prc.call(num)
    end

    accepted
  end

  #Write my_any? to return true if any elements of the array satisfy the block and my_all? to return true only if all elements satisfy the block.
  def my_any?(&prc)
    self.my_each do |num|
      return true if prc.call(num)
    end

    false
  end

  def my_all?(&prc)
    self.my_each do |num|
      return false unless prc.call(num)
    end

    true
  end


  #my_flatten should return all elements of the array into a new, one-dimensional array. Hint: use recursion!
  def my_flatten
    flattened = []

    self.my_each do |el|
      if el.is_a?(Array)
        flattened += el.my_flatten
      else
        flattened << el
      end
    end

    flattened
  end

  #Write my_zip to take any number of arguments. It should return a new array containing self.length elements. Each element of the new array should be an array with a length of the input arguments + 1 and contain the merged elements at that index. If the size of any argument is less than self, nil is returned for that location.
  def my_zip(*arrays)
    zipped = []

    self.length.times do |i|
      subzip = [self[i]]

      arrays.my_each do |arr|
        subzip << arr[i]
      end

      zipped << subzip
    end

    zipped
  end

  #Write a method my_rotate that returns self rotated. By default, the array should rotate by one element. If a negative value is given, the array is rotated in the opposite direction.
  def my_rotate(rotations = 1)
    split_idx = rotations % self.length

    self.drop(split_idx) + self.take(split_idx)
  end

  #Write a method that returns a new array containing all the elements of the original array in reverse order.
  def my_reverse
    reversed = []

    self.my_each do |el|
      reversed.unshift(el)
    end

    reversed
  end


end
