#Question 2: Given a string generate all possible lower case & upper case combinations of the string.
# Eg: ab ==> ab, aB, Ab, AB

# a -> a, A
# ab -> a, A -> ab, aB, Ab, AB

def generate_combinations(str)
  return str if str.to_s.empty?

  memo = [[]]

  (1..str.length).each do |index| # n
    prev = memo[index-1]

    if prev.empty?
      current = [str[index-1].downcase, str[index-1].upcase]
    else
      current = prev.map {|s| [s + str[index-1].downcase, s + str[index-1].upcase]  }.flatten
    end

    memo[index] = current
  end

  memo[str.length]
end

puts generate_combinations('abcd').inspect
