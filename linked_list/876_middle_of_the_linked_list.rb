# frozen_string_literal: true

def middle_node(head)
  fast = head
  slow = head
  while fast&.next
    fast = fast.next.next
    slow = slow.next
  end

  slow
end
