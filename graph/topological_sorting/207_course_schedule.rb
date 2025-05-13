# frozen_string_literal: true

def can_finish(num_courses, prerequisites)
  graph = Hash.new { |h, k| h[k] = [] }
  in_degree = Hash.new(0)

  prerequisites.each do |a, b|
    in_degree[b] += 1
    (in_degree[a]).zero? unless in_degree[a]
    graph[a] << b
  end

  return false if in_degree.size == num_courses

  courses = (0...num_courses).to_a
  queue = courses - in_degree.keys
  result = queue.size

  until queue.empty?
    anc = queue.pop

    graph[anc].each do |desc|
      in_degree[desc] -= 1

      next unless in_degree[desc].zero?

      result += 1
      queue.unshift(desc)
    end
  end

  result >= num_courses
end
