# frozen_string_literal: true

# Iterative
def has_path_sum(root, target_sum)
  return false if root.nil?

  stack = [[root, root.val]]

  while stack.any?
    node, sum = *stack.pop

    return true if node.left.nil? && node.right.nil? && sum == target_sum

    stack << [node.left, sum + node.left.val] if node&.left
    stack << [node.right, sum + node.right.val] if node&.right
  end

  false
end

# Recursive
def has_path_sum(root, target_sum)
  return false if root.nil?

  target_sum -= root.val

  return true if root.left.nil? && root.right.nil? && target_sum.zero?

  has_path_sum(root.left, target_sum) || has_path_sum(root.right, target_sum)
end
