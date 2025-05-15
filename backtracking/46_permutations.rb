# frozen_string_literal: true

def permute(nums)
  backtrack([], nums, [])
end

def backtrack(acc, nums, result)
  if acc.size == nums.size
    result << acc.dup
    return nil
  end

  nums.each do |num|
    next if acc.include?(num)

    acc << num
    backtrack(acc, nums, result)
    acc.pop
  end

  result
end
