# frozen_string_literal: true

def kids_with_candies(candies, extra_candies)
  max = 0
  candies.each { |n| max = [max, n].max }

  result = Array.new(candies.size)

  candies.each_with_index do |n, i|
    result[i] = n + extra_candies >= max
  end

  result
end
