class Fixnum
  # Fixnum#hash already implemented for you
end

class Array
  def hash
    hashed_arr = []
    self.each do |element|
      hashed_arr << element.hash.to_s[0..5].to_i if element.is_a?(Integer)
      hashed_arr << element.hash if element.is_a?(String)
    end
    hashed_arr.join.to_i
  end
end

class String
  def hash
  end
end

class Hash
  def hash
  end
end
