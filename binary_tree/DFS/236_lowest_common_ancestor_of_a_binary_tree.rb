# frozen_string_literal: true

def lowest_common_ancestor(root, p, q)
  return nil unless root
  return root if root == p || root == q

  left = lowest_common_ancestor(root.left, p, q)
  right = lowest_common_ancestor(root.right, p, q)

  return root if left && right

  left || right
end
