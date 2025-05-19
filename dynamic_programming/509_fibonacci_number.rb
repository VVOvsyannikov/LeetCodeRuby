# frozen_string_literal: true

def fib(n)
  return 0 if n.zero?
  return 1 if n == 1

  first = 0
  second = 1
  (1...n).each do |_i|
    first, second = second, first + second
  end

  second
end
