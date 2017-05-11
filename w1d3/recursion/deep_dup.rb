class Array

  def deep_dup
    duped = []

    self.each do |el|
      if el.is_a?(Array)
        duped << el.deep_dup
      else
        duped << el
      end
    end

    duped
  end

end

puts [1, [2], [3, [4]]].deep_dup
