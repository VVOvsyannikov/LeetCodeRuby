# frozen_string_literal: true

def minimum_semesters(n, relations)
  graph = Hash.new { |h, k| h[k] = [] }
  in_degree = Hash.new(0)

  relations.each do |p, n|
    graph[p] << n
    in_degree[n] += 1
  end

  queue = (1..n).to_a - in_degree.keys
  result = 0

  until queue.empty?
    queue.size.times do
      v = queue.pop
      n -= 1

      graph[v].each do |n|
        in_degree[n] -= 1

        next unless in_degree[n].zero?

        queue.unshift(n)
      end
    end
    result += 1
  end

  n.zero? ? result : -1
end

n = 5
relations = [[1, 5], [2, 5], [3, 5], [3, 4], [4, 5], [1, 2], [2, 3]]
p minimum_semesters(n, relations) # 5

n = 3
relations = [[1, 3], [2, 3]]
p minimum_semesters(n, relations) # 2
