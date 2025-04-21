# frozen_string_literal: true

def find_smallest_set_of_vertices(_n, edges)
  from_v = Set.new
  to_v = Set.new

  edges.each do |from, to|
    to_v.add(to)
    from_v.delete(to)
    to_v.include?(from) ? from_v.delete(from) : from_v.add(from)
  end

  from_v.to_a
end
