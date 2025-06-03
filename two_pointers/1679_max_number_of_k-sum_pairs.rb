# frozen_string_literal: true

def max_operations(nums, k)
  nums.sort!

  l = 0
  r = nums.size - 1
  counter = 0

  while l < r
    if nums[r] >= k || nums[r] + nums[l] > k
      r -= 1
    elsif nums[r] + nums[l] < k
      l += 1
    else
      counter += 1
      l += 1
      r -= 1
    end
  end

  counter
end
