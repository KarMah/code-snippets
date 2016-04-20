require '../linked_lists/node'

def palindrome?(head)
  return false unless head
  return true unless head.next

  fast, slow, stack = head, head, []

  while fast && fast.next
    stack << slow.val
    slow = slow.next
    fast = fast.next && fast.next.next
  end

  # odd number of nodes in the list
  slow = slow.next if fast
  is_palindrome = true

  while slow
    if slow.val != stack.pop
      is_palindrome = false
      break
    end

    slow = slow.next
  end

  is_palindrome
end


characters = %w(a b c a a c b a)

prev = nil
characters.each do |char|
  n = Node.new
  n.val = char
  n.next = prev
  prev = n
end

puts palindrome?(prev)
