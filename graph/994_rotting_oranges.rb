# frozen_string_literal: true

def oranges_rotting(grid)
  i = grid.size
  j = grid.first.size
  queue = []
  rotten = Set.new
  fresh = Set.new

  i.times do |y|
    j.times do |x|
      fresh.add([y, x]) if grid[y][x] == 1

      if grid[y][x] == 2
        queue.unshift([y, x, 0])
        rotten.add([y, x])
      end
    end
  end

  return 0 if fresh.empty?
  return -1 if queue.empty?

  result = 0

  until queue.empty?
    r, c, time = queue.pop
    result = [result, time].max

    neibhors = [[r - 1, c], [r + 1, c], [r, c - 1], [r, c + 1]]
    neibhors.each do |dy, dx|
      next if dy.negative? || dx.negative? || dy >= i || dx >= j || rotten.include?([dy, dx]) || grid[dy][dx].zero?

      queue.unshift([dy, dx, time + 1])
      rotten.add([dy, dx])
      fresh.delete([dy, dx])
    end
  end
  return -1 unless fresh.empty?

  result
end
