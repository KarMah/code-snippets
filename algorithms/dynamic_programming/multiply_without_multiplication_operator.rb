def multiply(num1, num2, memo={})
  smaller, larger = num1 > num2 ? [num2, num1] : [num1, num2]
  memo[0], memo[1] = 0, larger
  return memo[smaller] if memo[smaller]

  num_times, result = 1, memo[1]
  while (num_times += num_times) <= smaller
    result += result
    memo[num_times] = result
  end
  num_times /= 2
  memo[smaller - num_times] = multiply(smaller - num_times, larger, memo)

  memo[num_times] + memo[smaller - num_times]
end


puts multiply(32, 41)
