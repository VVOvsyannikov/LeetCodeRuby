# frozen_string_literal: true

def simplify_path(path)
  stack = []

  path.split('/').each do |word|
    next if ['', '.'].include?(word)

    if word == '..'
      stack.pop
      next
    end

    stack << word
  end

  '/' + stack.join('/')
end
