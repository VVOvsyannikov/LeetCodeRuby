# frozen_string_literal: true

def remove_stars(s)
  stack = []

  s.each_char do |char|
    if char == '*'
      stack.pop
      next
    end

    stack << char
  end

  stack.join
end
