# frozen_string_literal: true

def is_valid_bst(root)
  stack = [[root, -Float::INFINITY, Float::INFINITY]]

  while stack.any?
    node, min, max = *stack.pop

    return false if node.val <= min || node.val >= max

    stack << [node.left, min, node.val] if node.left
    stack << [node.right, node.val, max] if node.right
  end

  true
end
