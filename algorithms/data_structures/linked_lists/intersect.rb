require '../linked_lists/node'

def intersect?(l1, l2)
  return false unless l1 && l2

  l1_runner, l2_runner = l1, l2

  while l1_runner && l2_runner
    l1_runner = l1_runner.next
    l2_runner = l2_runner.next
  end

  shorter_list_start, longer_list_current, difference_runner =  if l1_runner
                                                                  [l2, l1_runner, l1]
                                                                else
                                                                  [l1, l2_runner, l2]
                                                                end

  while longer_list_current
    difference_runner = difference_runner.next
    longer_list_current = longer_list_current.next
  end

  while difference_runner && shorter_list_start && difference_runner != shorter_list_start
    difference_runner = difference_runner.next
    shorter_list_start = shorter_list_start.next
  end

  return [true, difference_runner] if difference_runner == shorter_list_start && difference_runner

  return false
end

characters = %w(a b c d e f g h)

head = nil
characters.reverse!.each do |char|
  n = Node.new
  n.val = char
  n.next = head
  head = n
end

characters = %w(a b c d e f g h)
head2 = head
characters.reverse!.each do |char|
  n = Node.new
  n.val = char
  n.next = head2
  head2 = n
end


characters = %w(1 2)
characters.reverse!.each do |char|
  n = Node.new
  n.val = char
  n.next = head
  head = n
end

result = intersect?(head2, head)

puts result.inspect
