def generate_permutations(str)
  memo = ['', [str[0]]]

  (2..str.length).each do |index|
    memo[index] = []
    memo[index-1].each do |permutation|
      (0..permutation.length).each do |insert_at|
        memo[index] << permutation[0, insert_at] + str[index-1] + permutation[insert_at..-1].to_s
      end
    end
  end

  memo[str.length]
end

puts generate_permutations('abcdefg').inspect
