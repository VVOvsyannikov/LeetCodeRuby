# frozen_string_literal: true

class MyMaxHeap
  attr_reader :elements

  def initialize
    @elements = [nil]
  end

  def push(element)
    elements << element
    bubble_up(elements.size - 1)
  end

  def pop
    exchange(1, elements.size - 1)
    max = elements.pop
    bubble_down(1)
    max
  end

  private

  def bubble_up(current)
    return if current <= 1

    parent = current / 2
    return if elements[parent] >= elements[current]

    exchange(parent, current)
    bubble_up(parent)
  end

  def bubble_down(index)
    child = index * 2

    return if child >= elements.size

    child += 1 if elements[child + 1] && elements[child + 1] > elements[child]

    return if elements[index] > elements[child]

    exchange(index, child)
    bubble_down(child)
  end

  def exchange(source, target)
    elements[source], elements[target] = elements[target], elements[source]
  end
end
