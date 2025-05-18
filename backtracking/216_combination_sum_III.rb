# frozen_string_literal: true

def combination_sum3(k, n)
  result = []

  backtrack = lambda do |acc, start|
    return result << acc.dup if acc.size == k && acc.sum == n

    (start..9).each do |num|
      break if acc.sum >= n

      acc << num
      backtrack.call(acc, num + 1)
      acc.pop
    end
  end

  backtrack.call([], 1)
  result
end
