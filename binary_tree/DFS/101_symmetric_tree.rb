# frozen_string_literal: true

def is_symmetric(root)
  return true if root.nil?

  stack = [root.left, root.right]

  while stack.any?
    right = stack.pop
    left = stack.pop

    next if right.nil? && left.nil?
    return false if right.nil? || left.nil? || right.val != left.val

    stack << right.right
    stack << left.left
    stack << right.left
    stack << left.right
  end

  true
end
