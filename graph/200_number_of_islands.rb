# frozen_string_literal: true

def num_islands(grid)
  counter = 0
  i = grid.size
  j = grid.first.size

  i.times do |y|
    j.times do |x|
      next unless grid[y][x] == '1'

      stack = [[y, x]]
      counter += 1

      while stack.size.positive?
        r, c = stack.pop
        grid[r][c] = '0'

        neibhors = [[r - 1, c], [r + 1, c], [r, c - 1], [r, c + 1]]
        neibhors.each do |dy, dx|
          next if dy.negative? || dx.negative? || dy >= i || dx >= j || grid[dy][dx] == '0'

          stack << [dy, dx]
        end
      end
    end
  end

  counter
end
