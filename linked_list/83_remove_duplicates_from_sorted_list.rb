# frozen_string_literal: true

def delete_duplicates(head)
  return nil unless head
  return head unless head.next

  current = head

  while current
    current.next = current.next.next while current&.next && current.val == current.next.val
    current = current.next
  end

  head
end
