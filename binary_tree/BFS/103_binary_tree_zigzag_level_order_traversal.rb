# frozen_string_literal: true

def zigzag_level_order(root)
  return [] unless root

  q = [root]
  result = []
  direction = 1
  while q.any?
    level = []

    q.size.times do
      if direction.even?
        node = q.shift

        q << node.right if node.right
        q << node.left if node.left
      else
        node = q.pop

        q.unshift node.left if node.left
        q.unshift node.right if node.right
      end

      level << node.val
    end

    result << level
    direction += 1
  end

  result
end
