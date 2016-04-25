def print_ordered_combinations(array, c_length)
  memo = {}

  (0..array.length).each do |arr_length|
    (0..c_length).each do |cc_length|
      if cc_length == 0 || cc_length > arr_length
        memo[get_key(arr_length, cc_length)] = []
        next
      end

      new_values = if memo[get_key(arr_length-1, cc_length-1)].empty?
                     [array[(arr_length-1)..(arr_length-1+cc_length-1)] ]
                   else
                     memo[get_key(arr_length-1, cc_length-1)].map { |val| val.to_a + [array[arr_length-1]] }
                   end

      memo[get_key(arr_length, cc_length)] = memo[get_key(arr_length-1, cc_length)] + new_values
    end
  end

  memo[get_key(array.length, c_length)]
end

def get_key(arr_length, combination_length)
  "#{arr_length}-#{combination_length}"
end
puts print_ordered_combinations([1,2,3,4,5], 2).sort.inspect
