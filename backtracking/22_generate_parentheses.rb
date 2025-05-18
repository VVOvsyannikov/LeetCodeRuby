# frozen_string_literal: true

def generate_parenthesis(n)
  generate(n, 0, 0, '', [])
end

def generate(n, opened, closed, memo, result)
  if memo.size == n * 2
    result << memo.dup
    return
  end

  generate(n, opened + 1, closed, "#{memo}(", result) if opened < n
  generate(n, opened, closed + 1, "#{memo})", result) if closed < opened

  result
end
