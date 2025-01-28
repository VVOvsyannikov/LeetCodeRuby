# frozen_string_literal: true

def hasCycle(head)
  dummy = ListNode.new
  current = head

  while current&.next
    tmp = current.next
    current.next = dummy
    current = tmp
  end

  current == dummy
end
