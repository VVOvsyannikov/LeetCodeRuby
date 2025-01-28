# frozen_string_literal: true

def search_bst(root, val)
  return nil if root.nil?
  return root if root.val == val

  root.val > val ? search_bst(root.left, val) : search_bst(root.right, val)
end
