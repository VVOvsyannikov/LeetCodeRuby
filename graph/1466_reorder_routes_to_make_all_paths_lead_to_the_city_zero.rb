# frozen_string_literal: true

def min_reorder(_n, connections)
  directions = Set.new
  graph = Hash.new { |h, k| h[k] = [] }

  connections.each do |f, t|
    graph[f] << t
    graph[t] << f
    directions.add([f, t])
  end

  turns = 0
  seen = Set.new
  seen.add(0)
  stack = [0]

  while stack.size.positive?
    v = stack.pop

    graph[v].each do |n|
      next if seen.include?(n)

      turns += 1 if directions.include?([v, n])

      seen.add(n)
      stack << n
    end
  end

  turns
end
