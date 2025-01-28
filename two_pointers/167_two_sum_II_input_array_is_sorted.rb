# frozen_string_literal: true

def two_sum(num, target)
  left = 0
  right = num.size - 1

  while left < right
    sum = num[left] + num[right]
    return [left + 1, right + 1] if sum == target

    if sum < target
      left += 1
    else
      right -= 1
    end
  end
end
