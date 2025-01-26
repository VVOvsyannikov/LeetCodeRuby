# frozen_string_literal: true

def max_area(height)
  left = 0
  right = height.size - 1
  volume = 0

  while left < right
    volume = [volume, [height[left], height[right]].min * (right - left)].max

    height[left] < height[right] ? left += 1 : right -= 1
  end

  volume
end
