# frozen_string_literal: true

def generate_parenthesis(n)
  generate = lambda do |opened, closed, memo|
    return [memo] if memo.size == n * 2

    res = []
    res += generate.call(opened + 1, closed, "#{memo}(") if opened < n
    res += generate.call(opened, closed + 1, "#{memo})") if closed < opened
    res
  end

  generate.call(0, 0, '')
end
