# frozen_string_literal: true

def insert_into_bst(root, val)
  return TreeNode.new(val) if root.nil?

  if val < root.val
    root.left = insert_into_bst(root.left, val)
  else
    root.right = insert_into_bst(root.right, val)
  end

  root
end
