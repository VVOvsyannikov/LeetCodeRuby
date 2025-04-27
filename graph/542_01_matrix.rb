# frozen_string_literal: true

def update_matrix(mat)
  i = mat.size
  j = mat.first.size
  seen = Set.new
  queue = []

  i.times do |y|
    j.times do |x|
      next unless mat[y][x].zero?

      queue.unshift([y, x, 1])
      seen.add([y, x])
    end
  end

  until queue.empty?
    r, c, deep = queue.pop

    neibhors = [[r - 1, c], [r + 1, c], [r, c - 1], [r, c + 1]]
    neibhors.each do |dy, dx|
      next if dy.negative? || dx.negative? || dy >= i || dx >= j || seen.include?([dy, dx])

      queue.unshift([dy, dx, deep + 1])
      seen.add([dy, dx])
      mat[dy][dx] = deep
    end
  end

  mat
end
