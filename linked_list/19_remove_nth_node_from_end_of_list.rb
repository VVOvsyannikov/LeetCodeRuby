# frozen_string_literal: true

def remove_nth_from_end(head, n)
  return nil unless head.next

  fast = head
  slow = head

  while n.positive? && fast&.next
    n -= 1
    fast = fast.next
  end

  if n.positive?
    head = head.next
    return head
  end

  while fast&.next
    fast = fast.next
    slow = slow.next
  end

  slow.next = slow.next&.next
  head
end

def remove_nth_from_end2(head, n)
  dummy = ListNode.new(0, head)

  fast = dummy
  slow = dummy

  while n >= 0
    n -= 1
    fast = fast.next
  end

  while fast
    fast = fast.next
    slow = slow.next
  end

  slow.next = slow.next&.next
  dummy.next
end
