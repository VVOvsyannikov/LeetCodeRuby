# frozen_string_literal: true

def reverse_list(head)
  prev = nil
  current = head

  while current
    tmp = current.next
    current.next = prev
    prev = current
    current = tmp
  end

  prev
end
