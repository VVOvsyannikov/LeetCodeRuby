# frozen_string_literal: true

def remove_duplicates(s)
  result = []

  s.each_char do |char|
    if result.last == char
      result.pop
      next
    end

    result << char
  end

  result.join
end
