

class Link
  attr_accessor :key, :val, :next

  def initialize(key = nil, val = nil, nxt = nil)
    @key, @val, @next = key, val, nxt
  end

  def to_s
    "#{@key}, #{@val}"
  end
end

class LinkedList

  include Enumerable

  attr_reader :head

  def initialize
    @head = Link.new
  end

  def [](i)
    each_with_index { |link, j| return link if i == j }
    nil
  end

  def first
    return head unless head.nil?
    nil
  end

  def last
    return head if head.next.nil?
    link = head
    until link.next.nil?
      link = link.next
    end
    link
  end

  def empty?
    head.nil?
  end

  def get(key)
    return nil if empty?
    link = head
    until link.next.nil?
      return link.val if link.key == key
      link = link.next
    end
    return link.val if link.key == key
    nil
  end

  def include?(key)
    return false if empty?
    link = head
    until link.next.nil?
      return true if link.key == key
      link = link.next
    end
    return true if link.key == key
    false
  end

  def insert(key, val)
    new_link = Link.new(key, val)
    @head = new_link if head.nil?
    if head.next.nil?
      head.next = new_link
    else
      link = head.next
      until link.next.nil?
        link = link.next
      end
      link.next = new_link
    end
  end

  def remove(key)
    return nil if empty?
    prev = head

    until prev.next.key == key
      prev = prev.next
    end
    
    prev.next == prev.next.next
  end

  def each
    link = head.next
      until link.next.nil?
        yield link
        link = link.next
      end
  end


  # uncomment when you have `each` working and `Enumerable` included
  def to_s
    inject([]) { |acc, link| acc << "[#{link.key}, #{link.val}]" }.join(", ")
  end
end
