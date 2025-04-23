# frozen_string_literal: true

def find_circle_num(is_connected)
  graph = Hash.new { |h, k| h[k] = [] }

  is_connected.each_with_index do |row, i|
    row.each_with_index do |col, j|
      graph[i] << j if col == 1
    end
  end

  visited = Set.new
  number = 0

  is_connected.size.times do |i|
    next if visited.include?(i)

    number += 1
    visited.add(i)

    stack = [i]
    while stack.size.positive?
      v = stack.pop

      graph[v].each do |n|
        unless visited.include?(n)
          visited.add(n)
          stack << n
        end
      end
    end
  end

  number
end
