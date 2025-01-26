# frozen_string_literal: true

class MyLinkedList
  class Node
    attr_accessor :value, :next

    def initialize(value = nil, next_element = nil)
      @value = value
      @next = next_element
    end
  end

  def initialize
    @head = nil
    @size = 0
  end

  def get(index)
    return -1 if index >= @size

    counter = 0
    current = @head

    while counter < index
      current = current.next
      counter += 1
    end

    current.value
  end

  def add_at_head(val)
    next_node = @size.zero? ? nil : @head
    @head = Node.new(val, next_node)
    @size += 1
  end

  def add_at_tail(val)
    if @size.zero?
      add_at_head(val)
    else
      current = @head
      current = current.next until current.next.nil?
      current.next = Node.new(val, nil)
      @size += 1
    end
  end

  def add_at_index(index, val)
    return -1 if index > @size

    if index.zero?
      add_at_head(val)
    else
      current = @head
      counter = 1
      while counter < index
        current = current.next
        counter += 1
      end

      current.next = Node.new(val, current.next)
      @size += 1
    end
  end

  def delete_at_index(index)
    return -1 if index >= @size

    if index.zero?
      @head = @head&.next
    else
      current = @head
      counter = 1
      while counter < index
        current = current.next
        counter += 1
      end

      current.next = current&.next&.next
    end

    @size -= 1
  end
end
