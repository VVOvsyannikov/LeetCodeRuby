# frozen_string_literal: true

def merge_two_lists(list1, list2)
  dummy = ListNode.new
  first = list1
  second = list2
  current = dummy

  while first && second
    if first.val <= second.val
      current.next = first
      first = first.next
    else
      current.next = second
      second = second.next
    end
    current = current.next
  end

  current.next = first || second

  dummy.next
end
