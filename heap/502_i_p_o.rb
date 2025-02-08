# frozen_string_literal: true

class MyMaxHeap
  def initialize
    @heap = []
  end

  def empty?
    @heap.empty?
  end

  def push(num)
    idx = @heap.bsearch_index { |n| n > num }
    if idx
      @heap.insert idx, num
    else
      @heap.push num
    end
  end

  def pop
    @heap.pop
  end
end

def find_maximized_capital(k, w, profits, capital)
  p_c_heap = MyMaxHeap.new
  capital_profits = capital.zip(profits).sort_by { |capital, _profits| capital }
  checked = 0

  k.times do
    while checked < capital_profits.size && capital_profits[checked].first <= w
      p_c_heap.push(capital_profits[checked].last)
      checked += 1
    end

    break if p_c_heap.empty?

    w += p_c_heap.pop || 0
  end
  w
end
