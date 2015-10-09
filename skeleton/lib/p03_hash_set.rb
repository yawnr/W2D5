require_relative 'p02_hashing'

class HashSet
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(key)
    hash_num = key.hash
    bucket = hash_num % num_buckets
    @store[bucket] << key
    @count += 1
    if self.count >= num_buckets
      resize!
    end
  end

  def include?(key)
    hash_num = key.hash
    bucket = hash_num % num_buckets
    @store[bucket].include?(key)
  end

  def remove(key)
    hash_num = key.hash
    bucket = hash_num % num_buckets
    @store[bucket].delete(key)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end

  def resize!
    @new_store = (Array.new(num_buckets * 2) { Array.new })
    @store.flatten.compact.each do |el|
      bucket = el.hash % @new_store.length
      @new_store[bucket] << el
    end
    @store = @new_store
  end
end
