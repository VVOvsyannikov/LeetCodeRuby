# frozen_string_literal: true

def move_zeroes(nums)
  write = 0

  nums.size.times do |read|
    next if nums[read].zero?

    nums[write], nums[read] = nums[read], nums[write]
    write += 1
  end
end
