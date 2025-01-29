# frozen_string_literal: true

def level_order(root)
  return [] unless root

  queue = [root]
  result = []

  while queue.any?
    level = []
    queue.size.times do
      node = queue.shift
      level << node.val
      queue << node.left if node.left
      queue << node.right if node.right
    end
    result << level
  end

  result
end
