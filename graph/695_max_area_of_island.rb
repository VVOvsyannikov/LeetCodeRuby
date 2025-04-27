# frozen_string_literal: true

def max_area_of_island(grid)
  i = grid.size
  j = grid.first.size
  result = 0

  i.times do |y|
    j.times do |x|
      next if grid[y][x].zero?

      result = [dfs(grid, y, x), result].max
    end
  end

  result
end

def dfs(grid, y, x)
  return 0 if y.negative? || x.negative? || y >= grid.size || x >= grid.first.size || grid[y][x].zero?

  result = 1
  grid[y][x] = 0
  result += dfs(grid, y - 1, x)
  result += dfs(grid, y + 1, x)
  result += dfs(grid, y, x - 1)
  result += dfs(grid, y, x + 1)
  result
end
