def max_sum_subarray(array)
  i, max_sum, current_sum = 0, 0, 0
  while i < array.length
    if (array[i] + current_sum) > 0
      current_sum += array[i]
    else
      current_sum = 0
    end
    max_sum = [max_sum, current_sum].max

    i += 1
  end
  max_sum
end
p max_sum_subarray [1,2,3,-1,-8, 3, 6]
