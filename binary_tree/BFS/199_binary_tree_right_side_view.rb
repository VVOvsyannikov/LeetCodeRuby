# frozen_string_literal: true

def right_side_view(root)
  return [] unless root

  q = [root]
  result = []

  while q.any?
    level = []

    q.size.times do
      node = q.shift
      level << node.val

      q << node.left if node.left
      q << node.right if node.right
    end

    result << level.last
  end

  result
end
