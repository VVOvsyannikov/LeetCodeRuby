# frozen_string_literal: true

def reverse_string(s)
  left = 0
  right = s.size - 1

  while left < right
    s[left], s[right] = s[right], s[left]
    left += 1
    right -= 1
  end
end
