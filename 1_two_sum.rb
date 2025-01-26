# frozen_string_literal: true

def two_sum(nums, target)
  memo = Hash.new(0)

  nums.each_with_index do |num, i|
    search_num = target - num

    return [memo[search_num], i] if memo.key?(search_num)

    memo[num] = i unless memo.key?(num)
  end
end
