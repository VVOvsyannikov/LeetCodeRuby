# frozen_string_literal: true

def swap_pairs(head)
  dummy = ListNode.new(0, head)
  current = dummy

  while current.next&.next
    first = current.next
    second = first.next

    first.next = second.next
    second.next = first
    current.next = second

    current = first
  end

  dummy.next
end
