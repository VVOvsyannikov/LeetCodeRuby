# frozen_string_literal: true

# Definition for a Node.
# class Node
#     attr_accessor :val, :neighbors
#     def initialize(val = 0, neighbors = nil)
#		  @val = val
#		  neighbors = [] if neighbors.nil?
#         @neighbors = neighbors
#     end
# end

# @param {Node} node
# @return {Node}
def cloneGraph(node)
  return node unless node

  visited = {}
  visited[node] = Node.new(node.val, [])
  stack = [node]

  while stack.size.positive?
    current = stack.pop

    current.neighbors.each do |neighbor|
      unless visited[neighbor]
        visited[neighbor] = Node.new(neighbor.val, [])
        stack << neighbor
      end

      visited[current].neighbors << visited[neighbor]
    end
  end

  visited[node]
end
