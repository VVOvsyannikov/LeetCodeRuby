# frozen_string_literal: true

def query_results(_limit, queries)
  colors = Hash.new(0)
  balls = {}

  queries.inject([]) do |result, (ball, color)|
    current_color = balls[ball]
    colors[current_color] -= 1
    colors.delete(current_color) if colors[current_color] <= 0

    balls[ball] = color
    colors[color] += 1

    result << colors.size
  end
end
