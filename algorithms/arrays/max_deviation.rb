def find_max_deviation(string, length)

  max_index, min_index = 0, 0
  for i in (0..length-1)
    max_index = i if string[i].to_i >= string[max_index].to_i
    min_index = i if string[i].to_i <= string[min_index].to_i
  end
  max_deviation = string[max_index].to_i - string[min_index].to_i
  for i in (length..string.length-1)

    if i-length > max_index || i-length > min_index
      max_index, min_index = get_new_indexes(string, i-length, i)
      max_deviation = [max_deviation, string[max_index].to_i - string[min_index].to_i].max
    end

    if string[i].to_i >= string[max_index].to_i
      max_index = i
      max_deviation = [max_deviation, string[max_index].to_i - string[min_index].to_i].max
    elsif string[i].to_i <= string[max_index].to_i
      min_index = i
      max_deviation = [max_deviation, string[max_index].to_i - string[min_index].to_i].max
    end
  end

  max_deviation
end

def get_new_indexes(string, _start, _end)
  max_index, min_index = _start, _start
  for i in (_start+1.._end)
    max_index = i if string[i].to_i >= string[max_index].to_i
    min_index = i if string[i].to_i <= string[min_index].to_i
  end
  return max_index, min_index
end

p find_max_deviation([6, 9, 4, 6, 4, 1], 2)
