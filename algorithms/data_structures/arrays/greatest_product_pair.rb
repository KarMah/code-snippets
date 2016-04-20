def greatest_product_pair(array)
  min1, min2 = [array.first, array[1]].sort
  max1, max2 = [min1, min2].reverse

  array.each do |ele|
    min1, min2 = [min1, min2, ele].sort.take(2)
    max1, max2 = [max1, max2, ele].sort.reverse.take(2)
  end

  [max1 * max2, min1 * min2].max
end

p greatest_product_pair [-5, 1, 7, -6, 4]
