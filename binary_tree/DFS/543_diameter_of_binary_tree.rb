# frozen_string_literal: true

def diameter_of_binary_tree(root)
  result = [0]
  dfs(root, result)
  result.first
end

def dfs(root, result)
  return 0 unless root

  left, = dfs(root.left, result)
  right,  = dfs(root.right, result)

  result[0] = [result.first, [left + right].max].max

  [left, right].max + 1
end
