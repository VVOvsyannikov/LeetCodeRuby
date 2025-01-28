# frozen_string_literal: true

def delete_middle(head)
  if head.next.nil?
    head = nil
    return head
  end

  fast = head.next.next
  slow = head

  while fast&.next
    fast = fast.next.next
    slow = slow.next
  end

  slow.next = slow.next&.next
  head
end
