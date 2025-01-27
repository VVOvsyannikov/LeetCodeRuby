# frozen_string_literal: true

class MyLinkedList
  class Node
    attr_accessor :key, :val, :next

    def initialize(key = nil, val = nil, next_node = nil)
      @key = key
      @val = val
      @next = next_node
    end
  end

  def initialize
    @head = nil
  end

  def get(key)
    current = @head

    while current
      return current.val if current.key == key

      current = current.next
    end

    -1
  end

  def put(key, val)
    current = @head

    while current
      if current.key == key
        current.val = val
        return
      end
      current = current.next
    end

    @head = Node.new(key, val, @head)
  end

  def remove(key)
    return unless @head

    if @head.key == key
      @head = @head.next
      return
    end

    current = @head

    while current.next
      if current.next.key == key
        current.next = current.next.next
        return
      end
    end

    false
  end
end

class MyHashMap
  def initialize
    @n = 29_311
    @buckets = []
  end

  def buket(key)
    n = hash(key)
    @buckets[n] = MyLinkedList.new if @buckets[n].nil?
    @buckets[n]
  end

  def hash(key)
    key % @n
  end

  def put(key, value)
    buket(key).put(key, value)
  end

  def get(key)
    buket(key).get(key)
  end

  def remove(key)
    buket(key).remove(key)
  end
end
