# frozen_string_literal: true

def is_valid(s)
  dict = {
    ')' => '(',
    ']' => '[',
    '}' => '{'
  }

  stack = []

  s.each_char do |char|
    if dict[char].nil?
      stack << char
      next
    end

    if stack.last.eql?(dict[char])
      stack.pop
      next
    end

    return false
  end

  stack.empty?
end
