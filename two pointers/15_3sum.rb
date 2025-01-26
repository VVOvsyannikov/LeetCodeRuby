# frozen_string_literal: true

def three_sum(nums)
  nums = nums.sort
  n = nums.size
  result = []
  memo_left = nil
  memo_right = nil

  n.times do |i|
    target = -nums[i]

    left = i + 1
    right = n - 1

    while left < right
      sum = nums[left] + nums[right]
      if sum == target && !(memo_left == left || memo_right == right)
        result << [-target, nums[left], nums[right]]
        memo_left = left
        memo_right = right
        break
      end

      if sum < target
        left += 1
      else
        right -= 1
      end
    end
  end

  result
end
