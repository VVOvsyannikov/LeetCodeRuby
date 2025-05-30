# frozen_string_literal: true

def min_path_sum(grid)
  rows = grid.size
  cols = grid.first.size

  dp = Array.new(cols, Float::INFINITY)

  rows.times do |y|
    dp[0] = y.zero? ? grid[y][0] : dp[0] + grid[y][0]
    prev = dp[0]
    (1...cols).each do |x|
      dp[x] = [dp[x] + grid[y][x], prev + grid[y][x]].min
      prev = dp[x]
    end
  end

  dp[cols - 1]
end
