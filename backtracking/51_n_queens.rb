# frozen_string_literal: true

def solve_n_queens(n)
  result = []
  board = Array.new(n) { '.' * n }

  backtrack = lambda do |row, diags, t_diags, columns|
    return result << board.map(&:dup).dup if row == n

    n.times do |col|
      next if diags.include?(col + row) || t_diags.include?(col - row) || columns.include?(col)

      board[row][col] = 'Q'
      columns << col
      diags << col + row
      t_diags << col - row
      backtrack.call(row + 1, diags, t_diags, columns)
      diags.pop
      t_diags.pop
      columns.pop
      board[row][col] = '.'
    end
  end

  backtrack.call(0, [], [], [])
  result
end
