# frozen_string_literal: true

def num_islands(grid)
  counter = 0

  grid.each_with_index do |row, y|
    row.each_with_index do |val, x|
      next unless val == '1'

      stack = [[y, x]]
      counter += 1

      while stack.size.positive?
        v = stack.pop
        grid[v.first][v.last] = '0'

        neibhors = [[v.first - 1, v.last], [v.first + 1, v.last], [v.first, v.last - 1], [v.first, v.last + 1]]
        neibhors.each do |n_y, n_x|
          next if n_y.negative? || n_x.negative? || n_y >= grid.size || n_x >= row.size || grid[n_y][n_x] == '0'

          stack << [n_y, n_x]
        end
      end
    end
  end

  counter
end
