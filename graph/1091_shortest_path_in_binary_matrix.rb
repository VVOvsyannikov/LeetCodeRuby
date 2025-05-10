# frozen_string_literal: true

def shortest_path_binary_matrix(grid)
  return -1 if grid[0][0] == 1 || grid[-1][-1] == 1

  n = grid.size

  queue = [[0, 0, 1]]
  grid[0][0] = 1

  while queue.size.positive?
    y, x, depth = queue.pop

    return depth if y.eql?(n - 1) && x.eql?(n - 1)

    neibhors = [[y - 1, x - 1], [y - 1, x], [y - 1, x + 1], [y, x + 1], [y + 1, x + 1], [y + 1, x], [y + 1, x - 1],
                [y, x - 1]]
    neibhors.each do |ny, nx|
      next if ny.negative? || nx.negative? || ny >= n || nx >= n || grid[ny][nx] == 1 || grid[ny][nx] == 1

      queue.unshift([ny, nx, depth + 1])
      grid[ny][nx] = 1
    end
  end

  -1
end
