# frozen_string_literal: true

def sorted_squares(nums)
  n = nums.size
  result = Array.new(n)
  left = 0
  right = n - 1

  n.times do |i|
    left_square = nums[left]**2
    right_square = nums[right]**2

    if right_square > left_square
      result[-i - 1] = right_square
      right -= 1
    else
      result[-i - 1] = left_square
      left += 1
    end
  end

  result
end
