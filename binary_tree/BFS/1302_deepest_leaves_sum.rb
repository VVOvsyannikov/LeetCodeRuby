# frozen_string_literal: true

def deepest_leaves_sum(root)
  q = [root]

  while q.any?
    level_sum = 0

    q.size.times do
      node = q.shift
      level_sum += node.val
      q << node.left if node.left
      q << node.right if node.right
    end

    result = level_sum
  end

  result
end
