class Fixnum
  # Fixnum#hash already implemented for you
end

class Array

  def hash
    self.each_with_index.inject(0) do |hash, (el, i)|
      hash ^ (el.hash + i.hash)
    end
  end
end

class String
  def hash
    self.split("").map(&:ord).hash
  end
end

class Hash
  def hash
    hash_arr = self.to_a
    hash_arr.sort!
    hash_arr.hash    
  end
end
