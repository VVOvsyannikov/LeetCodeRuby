# frozen_string_literal: true

def max_area_of_island(grid)
  i = grid.size
  j = grid.first.size
  result = 0

  i.times do |y|
    j.times do |x|
      next if grid[y][x].zero?

      counter = 1
      stack = [[y, x]]
      grid[y][x] = 0

      until stack.empty?
        r, c = stack.pop
        n = [[r + 1, c], [r - 1, c], [r, c + 1], [r, c - 1]]
        n.each do |dy, dx|
          next if dy.negative? || dx.negative? || dy >= i || dx >= j || grid[dy][dx].zero?

          stack << [dy, dx]
          grid[dy][dx] = 0
          counter += 1
        end
      end

      result = [result, counter].max
    end
  end

  result
end
