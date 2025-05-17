# frozen_string_literal: true

def subsets(nums)
  recombinate(nums, 0, [], [])
end

def recombinate(nums, start, memo, result)
  return if start > nums.size

  result << memo.dup

  (start...nums.size).each do |i|
    memo << nums[i]
    recombinate(nums, i + 1, memo, result)
    memo.pop
  end

  result
end
