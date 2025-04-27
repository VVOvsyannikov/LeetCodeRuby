# frozen_string_literal: true

def reachable_nodes(_n, edges, restricted)
  graph = Hash.new { |h, k| h[k] = [] }

  edges.each do |from, to|
    graph[from] << to
    graph[to] << from
  end

  seen = Set.new
  restricted.each { |r| seen.add(r) }

  dfs(graph, 0, seen)
end

def dfs(graph, v, seen)
  return 0 if seen.include?(v)

  result = 1
  seen.add(v)
  graph[v].each do |n|
    result += dfs(graph, n, seen)
  end

  result
end
