# frozen_string_literal: true

def is_palindrome(head)
  prev = nil
  current = head
  fast = head

  while fast&.next
    fast = fast.next.next
    tmp = current.next
    current.next = prev
    prev = current
    current = tmp
  end

  current = current.next if fast

  while prev
    return false unless prev.val == current.val

    current = current.next
    prev = prev.next
  end
  true
end
