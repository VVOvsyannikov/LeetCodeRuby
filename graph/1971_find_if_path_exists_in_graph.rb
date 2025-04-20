# frozen_string_literal: true

def valid_path(n, edges, source, destination)
  if edges.nil? || source.nil? || destination.nil? || source >= n || source.negative? || destination >= n || destination.negative?
    return false
  end
  return true if source == destination

  graph = Hash.new { |h, k| h[k] = [] }

  edges.each do |a, b|
    graph[a] << b
    graph[b] << a
  end

  stack = [source]
  visited = Set.new

  while stack.size.positive?
    vertex = stack.pop

    graph[vertex].each do |neighbour|
      return true if neighbour.eql?(destination)

      if neighbour && !visited.include?(neighbour)
        visited.add(neighbour)
        stack << neighbour
      end
    end
  end

  false
end
