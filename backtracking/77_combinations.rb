# frozen_string_literal: true

def combine(n, k)
  combinate(n, k, 1, [], [])
end

def combinate(n, k, start, memo, result)
  if memo.size == k
    result << memo.dup
    return
  end

  (start..n).each do |number|
    memo << number
    combinate(n, k, number + 1, memo, result)
    memo.pop
  end

  result
end
