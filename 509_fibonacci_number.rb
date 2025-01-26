# frozen_string_literal: true

def fib(n)
  return 0 if n.zero?

  first = 0
  second = 1

  (1..n).each do |_i|
    first, second = second, first + second
  end

  first
end
