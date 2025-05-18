# frozen_string_literal: true

def letter_combinations(digits)
  return [] if digits.empty?

  letters = {
    '2' => %w[a b c],
    '3' => %w[d e f],
    '4' => %w[g h i],
    '5' => %w[j k l],
    '6' => %w[m n o],
    '7' => %w[p q r s],
    '8' => %w[t u v],
    '9' => %w[w x y z]
  }.freeze

  n = digits.size
  result = []

  backtrack = lambda do |acc, start|
    return result << acc if acc.size == n

    letters[digits[start]].each do |char|
      backtrack.call(acc + char, start + 1)
    end
  end

  backtrack.call('', 0)
  result
end
