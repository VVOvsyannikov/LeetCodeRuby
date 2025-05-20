# frozen_string_literal: true

def climb_stairs(n)
  return 1 if n == 1
  return 2 if n == 2

  first = 1
  second = 2

  (2...n).each do
    first, second = second, first + second
  end

  second
end
