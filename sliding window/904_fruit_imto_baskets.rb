# frozen_string_literal: true

def total_fruit(fruits)
  left = 0
  window_state = Hash.new(0)
  result = 0

  fruits.size.times do |right|
    window_state[fruits[right]] += 1

    while window_state.size > 2
      window_state[fruits[left]] -= 1
      window_state.delete(fruits[left]) if window_state[fruits[left]].zero?
      left += 1
    end

    result = [result, right - left + 1].max
  end

  result
end
