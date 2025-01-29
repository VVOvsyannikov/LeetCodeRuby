# frozen_string_literal: true

def largest_values(root)
  return [] unless root

  result = []
  q = [root]

  while q.any?
    current_max = -Float::INFINITY

    q.size.times do
      node = q.shift
      current_max = [current_max, node.val].max

      q << node.left if node.left
      q << node.right if node.right
    end
    result << current_max
  end

  result
end
