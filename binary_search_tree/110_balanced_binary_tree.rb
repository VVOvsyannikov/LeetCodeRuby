# frozen_string_literal: true

def is_balanced(root)
  return true if root.nil?
  return false if (height(root.left) - height(root.right)).abs > 1

  is_balanced(root.left) && is_balanced(root.right)
end

def height(root)
  return 0 if root.nil?

  [height(root.left), height(root.right)].max + 1
end
