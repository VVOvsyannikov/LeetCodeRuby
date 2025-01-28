# frozen_string_literal: true

def find_max_average(nums, k)
  return nums.sum / nums.size.to_f if nums.size <= k

  current_sum = nums[0...k].sum
  result = current_sum
  right = k
  while right < nums.size
    current_sum = current_sum + nums[right] - nums[right - k]
    result = [result, current_sum].max
    right += 1

  end

  result / k.to_f
end

def find_max_average2(nums, k)
  return nums.sum / nums.size.to_f if nums.size <= k

  left = 0
  window_state = 0
  result = -Float::INFINITY

  nums.size.times do |right|
    window_state += nums[right]
    next unless right - left + 1 == k

    result = [result, window_state].max
    window_state -= nums[left]
    left += 1
  end

  result / k.to_f
end
