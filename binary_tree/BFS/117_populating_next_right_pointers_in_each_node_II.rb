# frozen_string_literal: true

# Iterative BFS
def connect(root)
  return root unless root

  q = [root]

  while q.any?
    level_size = q.size

    level_size.times do |i|
      node = q.shift
      node.next = i < level_size - 1 ? q.first : nil

      q << node.left if node.left
      q << node.right if node.right
    end
  end

  root
end
