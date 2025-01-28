# frozen_string_literal: true

def remove_duplicates(nums)
  left = 0

  nums.size.times do |i|
    if nums[left] < nums[i]
      nums[left + 1] = nums[i]
      left += 1
    end
  end

  left + 1
end
