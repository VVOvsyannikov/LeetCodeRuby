# frozen_string_literal: true

def merge_k_lists(lists)
  root = ListNode.new
  node = root

  heap = MinHeap.new

  lists.each_with_index do |list, i|
    heap.push(list.val, i) if list
  end

  while heap.size.positive?
    i = heap.pop
    node.next = lists[i]
    node = node.next
    lists[i] = lists[i]&.next
    heap.push(lists[i].val, i) if lists[i]
  end

  root.next
end
