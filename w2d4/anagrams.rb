# O(n * n!) combinatorial time
# O(n!) combinatorial space

def first_anagram?(str1, str2)
  all_anagrams(str1).include?(str2)
end

def all_anagrams(string)
  return [string] if string.length <= 1
  prev_anagrams = all_anagrams(string[0...-1])
  new_anagrams = []

  prev_anagrams.each do |anagram|
    (0..anagram.length).each do |i|
      new_anagrams << anagram.dup.insert(i, string[-1])
    end
  end

  new_anagrams
end

# O(n^2) quadratic time
# O(n) linear space

def second_anagram?(str1, str2)
  arr1 = str1.split('')
  arr2 = str2.split('')

  arr1.each do |letter|
    target_idx = arr2.find_index(letter)
    return false unless target_idx
    arr2.delete_at(target_idx)
  end

  arr2.empty?
end

# O(n * log n) linearithmic time
# O(n) linear space

def third_anagram?(str1, str2)
  sorted_one = str1.split('').sort.join
  sorted_two = str2.split('').sort.join

  sorted_one == sorted_two
end

# O(n) linear time
# O(1) constant space

def fourth_anagram?(str1, str2)
  letter_sums = Hash.new(0)

  str1.each_char { |letter| letter_sums[letter] += 1 }
  str2.each_char { |letter| letter_sums[letter] -= 1 }

  letter_sums.each_value.all? { |sum| sum == 0 }
end
