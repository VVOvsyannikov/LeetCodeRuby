# frozen_string_literal: true

RED = 0
BLUE = 1

def shortest_alternating_paths(n, red_edges, blue_edges)
  graph = Hash.new { |h, k| h[k] = Hash.new { |nh, nk| nh[nk] = [] } }

  red_edges.each do |a, b|
    graph[RED][a] << b
  end

  blue_edges.each do |a, b|
    graph[BLUE][a] << b
  end

  queue = [[0, RED, 0], [0, BLUE, 0]]
  result = Array.new(n) { Float::INFINITY }
  result[0] = 0
  seen = Set.new
  seen.add([0, RED])
  seen.add([0, BLUE])

  while queue.size.positive?
    v, color, depth = queue.pop
    result[v] = [result[v], depth].min

    graph[color][v].each do |n|
      unless seen.include?([n, 1 - color])
        seen.add([n, 1 - color])
        queue.unshift([n, 1 - color, depth + 1])
      end
    end
  end

  result.map { |d| d == Float::INFINITY ? -1 : d }
end
