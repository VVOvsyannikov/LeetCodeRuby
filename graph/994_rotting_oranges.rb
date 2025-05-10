# frozen_string_literal: true

def oranges_rotting(grid)
  i = grid.size
  j = grid.first.size
  queue = []
  fresh_count = 0
  minutes = 0

  i.times do |y|
    j.times do |x|
      fresh_count += 1 if grid[y][x] == 1

      queue.unshift([y, x, minutes]) if grid[y][x] == 2
    end
  end

  return 0 if fresh_count.zero?
  return -1 if queue.empty?

  until queue.empty?
    r, c, minutes = queue.pop

    neibhors = [[r - 1, c], [r + 1, c], [r, c - 1], [r, c + 1]]
    neibhors.each do |dy, dx|
      next if dy.negative? || dx.negative? || dy >= i || dx >= j || grid[dy][dx] == 2 || (grid[dy][dx]).zero?

      queue.unshift([dy, dx, minutes + 1])
      grid[dy][dx] = 2
      fresh_count -= 1
    end
  end

  return -1 unless fresh_count <= 0

  minutes
end
