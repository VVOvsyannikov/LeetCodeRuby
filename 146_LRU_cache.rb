# frozen_string_literal: true

class LRUCache
  class Node
    attr_accessor :key, :value, :prev, :next

    def initialize(key = nil, value = nil, prev_node = nil, next_node = nil)
      @key = key
      @value = value
      @prev  = prev_node
      @next = next_node
    end
  end

  def initialize(capacity)
    @head = Node.new
    @tail = Node.new
    @head.next = @tail
    @tail.prev = @head
    @capacity = capacity
    @map = {}
  end

  def remove(node)
    node.prev.next = node.next
    node.next.prev = node.prev
  end

  def add_to_head(node)
    node.next = @head.next
    node.prev = @head
    @head.next.prev = node
    @head.next = node
  end

  def get(key)
    node = @map[key]
    return -1 if node.nil?

    remove(node)
    add_to_head(node)
    node.value
  end

  def put(key, value)
    node = @map[key]
    if node
      remove(node)
      add_to_head(node)
      node.value = value
      return
    end

    if @map.size >= @capacity
      node = @tail.prev
      remove(node)
      @map.delete(node.key)
    end

    new_node = Node.new(key, value)
    add_to_head(new_node)
    @map[key] = new_node
  end
end
