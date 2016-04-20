def last_number_before_sleep(number)
  return 'INSOMNIA' if number.zero?

  current, seen_digits = number, Array.new(10, false)

  while true
    _current = current
    while true
      seen_digits[_current % 10] ||= true
      _current /= 10
      break if _current == 0
    end

    break if seen_digits.none?{|flag| !flag }
    current += number
  end

  current
end

ARGF.each_with_index do |line, line_number|
  next if line_number == 0
  val = last_number_before_sleep line.chomp.to_i
  $stdout.puts "Case ##{line_number}: #{val}"
end
