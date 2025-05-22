# frozen_string_literal: true

def rob(nums)
  first = 0
  second = 0

  nums.each do |num|
    first, second = second, [first + num, second].max
  end

  second
end

def rob_II(nums)
  return nums.max if nums.size <= 2

  dp = [nums[0], nums[1], nums[0] + nums[2]]

  (3...nums.size).each do |i|
    tmp = dp[0]
    dp[0] = dp[1]
    dp[1] = dp[2]
    dp[2] = [dp[0] + nums[i], tmp + nums[i], dp[1]].max
  end

  dp.max
end
