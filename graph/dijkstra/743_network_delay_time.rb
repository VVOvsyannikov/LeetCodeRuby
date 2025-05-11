# frozen_string_literal: true

def network_delay_time(times, n, k)
  graph = Hash.new { |h, k| h[k] = [] }

  times.each do |u, v, w|
    graph[u] << [v, w]
  end

  minheap = Containers::MinHeap.new
  minheap.push([0, k])

  seen = {}
  seen[k] = 0

  until minheap.empty?
    depth, v = minheap.pop

    graph[v].each do |n, time|
      next if seen[n] && seen[n] <= depth + time

      seen[n] = depth + time
      minheap.push([depth + time, n])
    end
  end

  return -1 if seen.size < n

  seen.values.max
end
