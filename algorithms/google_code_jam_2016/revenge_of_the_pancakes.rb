def flip_pancakes!(pancakes, flip_until)
  _start, _end = 0, flip_until
  while _start <= _end
    pancakes[_start], pancakes[_end] = flipped_value(pancakes[_end]), flipped_value(pancakes[_start])
    _start += 1
    _end -= 1
  end
end

def flipped_value(value)
  value == '+' ? '-' : '+'
end

def revenge_of_the_pancakes(pancakes, process_until=pancakes.length-1)
  # get the index after which we can ignore flipping
  while process_until >= 0
    break if pancakes[process_until] == '-'
    process_until -= 1
  end

  return 0 if process_until < 0

  first_blank_side = 0
  while first_blank_side < process_until
    break if pancakes[first_blank_side] == '-'
    first_blank_side += 1
  end

  number_of_flips = 0
  if first_blank_side > 0
    flip_pancakes!(pancakes, first_blank_side - 1)
    number_of_flips += 1
  end
  flip_pancakes!(pancakes, process_until)
  number_of_flips += 1

  revenge_of_the_pancakes(pancakes, process_until) + number_of_flips
end

ARGF.each_with_index do |line, line_number|
  next if line_number == 0
  $stdout.puts "Case ##{line_number}: #{revenge_of_the_pancakes(line)}"
end
