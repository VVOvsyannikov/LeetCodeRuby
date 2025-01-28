# frozen_string_literal: true

def min_sub_array_len(target, nums)
  left = 0
  window_sum = 0
  result = Float::INFINITY

  nums.size.times do |right|
    window_sum += nums[right]

    while window_sum >= target
      result = [result, right - left + 1].min
      window_sum -= nums[left]
      left += 1
    end
  end
  result.is_a?(Float) ? 0 : result
end
