# frozen_string_literal: true

def find_order(num_courses, prerequisites)
  graph = Hash.new { |h, k| h[k] = [] }
  courses = Hash.new(0)

  prerequisites.each do |to, from|
    graph[from] << to
    courses[to] += 1
  end

  queue = (0...num_courses).to_a - courses.keys
  result = []

  until queue.empty?
    v = queue.pop
    result << v

    graph[v].each do |n|
      courses[n] -= 1

      next unless courses[n].zero?

      queue.unshift(n)
    end
  end

  result.size == num_courses ? result : []
end
