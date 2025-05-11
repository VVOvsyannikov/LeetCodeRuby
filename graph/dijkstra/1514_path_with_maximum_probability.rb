# frozen_string_literal: true

def max_probability(_n, edges, succ_prob, start_node, end_node)
  graph = Hash.new { |h, k| h[k] = [] }

  edges.each_with_index do |(a, b), i|
    graph[a] << [b, succ_prob[i]]
    graph[b] << [a, succ_prob[i]]
  end

  heap = Containers::MaxHeap.new
  heap.push([1, start_node])
  probabilities = {}
  probabilities[start_node] = 0

  until heap.empty?
    pbty, v = heap.pop

    return pbty if v == end_node

    graph[v].each do |n, np|
      next if probabilities[n] && pbty * np <= probabilities[n]

      heap.push([pbty * np, n])
      probabilities[n] = pbty * np
    end
  end

  0
end
