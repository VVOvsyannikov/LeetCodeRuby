# frozen_string_literal: true

def unique_paths(m, n)
  cache = {}

  inner = lambda do |x, y|
    return cache[[x, y]] if cache[[x, y]]
    return 1 if x.zero? && y.zero?
    return 0 if x.negative? || y.negative?

    cache[[x, y]] = inner.call(x - 1, y) + inner.call(x, y - 1)
  end

  inner.call(n - 1, m - 1)
end

def unique_paths_II(m, n)
  dp = Array.new(m) { Array.new(n, 1) }

  (1...m).each do |y|
    (1...n).each do |x|
      dp[y][x] = dp[y][x - 1] + dp[y - 1][x]
    end
  end

  dp[m - 1][n - 1]
end
