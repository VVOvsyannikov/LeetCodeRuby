# frozen_string_literal: true

# Recursive
def max_depth(root)
  return 0 unless root

  [max_depth(root.left), max_depth(root.right)].max + 1
end

# Iterative
def max_depth(root)
  return 0 if root.nil?

  stack = [[root, 1]]
  result = 0

  while stack.any?
    node, depth = *stack.pop
    stack << [node.right, depth + 1] if node.right
    stack << [node.left, depth + 1] if node.left

    result = [result, depth].max
  end

  result
end
