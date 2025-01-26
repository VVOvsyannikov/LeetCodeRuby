# frozen_string_literal: true

def is_palindrome(s)
  left = 0
  right = s.size - 1

  while left < right
    # Move left pointer until valid character found
    left = find_next_valid_char(s, left, right, :forward)

    # Move right pointer until valid character found
    right = find_next_valid_char(s, left, right, :backward)

    return true if left > right
    return false if s[left]&.downcase != s[right]&.downcase

    left += 1
    right -= 1
  end

  true
end

private

def find_next_valid_char(str, left, right, direction)
  pointer = direction == :forward ? left : right

  while left <= right
    char = str[pointer].downcase
    return pointer if char.between?('a', 'z') || char.between?('0', '9')

    pointer = direction == :forward ? pointer + 1 : pointer - 1
  end

  pointer
end
