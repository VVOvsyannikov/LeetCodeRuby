# frozen_string_literal: true

# Recursive
def invert_tree(root)
  return nil unless root

  root.left, root.right = root.right, root.left
  invert_tree(root.left)
  invert_tree(root.right)

  root
end
