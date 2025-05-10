# frozen_string_literal: true

def nearest_exit(maze, entrance)
  height = maze.size
  width = maze.first.size
  row, col = entrance
  queue = [[row, col, 0]]
  maze[row][col] = '+'
  while queue.size.positive?
    y, x, depth = queue.pop
    return depth if (y.zero? || x.zero? || y == height - 1 || x == width - 1) && depth != 0

    neighbors = [[y - 1, x], [y + 1, x], [y, x - 1], [y, x + 1]]
    neighbors.each do |ny, nx|
      next if ny.negative? || nx.negative? || ny >= height || nx >= width || maze[ny][nx] == '+'

      queue.unshift([ny, nx, depth + 1])
      maze[ny][nx] = '+'
    end
  end

  -1
end
