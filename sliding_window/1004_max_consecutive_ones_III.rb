# frozen_string_literal: true

def longest_ones(nums, k)
  left = 0
  window_state = 0
  result = 0

  nums.size.times do |right|
    window_state += 1 if nums[right].zero?

    while window_state > k
      window_state -= 1 if nums[left].zero?
      left += 1
    end

    result = [result, right - left + 1].max
  end

  result
end
