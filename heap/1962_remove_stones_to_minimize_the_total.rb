# frozen_string_literal: true

def min_stone_sum(piles, k)
  # heap = MyMaxHeap.new
  # piles.each do |pile|
  #   heap.push(pile)
  # end

  # k.times do
  #   num = heap.pop
  #   heap.push(num - num / 2)
  # end

  # heap.elements[1..].sum

  piles.sort!
  halves = []
  sum = piles.sum

  k.times do
    n = if halves.any?
          if piles.any? && piles.last > halves.first
            piles.pop
          else
            halves.shift
          end
        elsif piles.any?
          piles.pop
        end
    half = n / 2
    sum -= half
    halves << n - half
  end

  sum
end
