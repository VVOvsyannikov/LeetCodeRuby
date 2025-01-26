# frozen_string_literal: true

def plus_one(digits)
  size = digits.first == 9 && digits.last == 9 ? digits.size + 1 : digits.size
  result = Array.new(size, 0)
  memo = 1

  (0...digits.size).reverse_each do |i|
    current_number = digits[i] + memo

    if current_number > 9
      result[i] = 0
      memo = 1
    else
      result[i] = current_number
      memo = 0
    end
  end

  result[0] = memo if memo == 1
  result
end
