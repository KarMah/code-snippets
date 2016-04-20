module MyEnumerable

  def map(&block)
    result = []
    self.each do |ele|
      result << block.call(ele)
    end
    result
  end

  def find_all(&block)
    result = []
    each do |ele|
      result << ele if block.call(ele)
    end
    result
  end

  def find(&block)
    each do |item|
       return item if block.call(item)
    end
    return nil
  end


  def reduce(val=nil, &block)
    if block.nil?
      operator = val
      initial_val = nil
      each do |item|
        if initial_val.nil?
          initial_val = item
        else
          initial_val = initial_val.send(operator, item)
        end
      end
      initial_val
    else
      initial_val = val
      each do |item|
        if initial_val.nil?
          initial_val = item
        else
          initial_val = block.call(initial_val, item)
        end
      end

      initial_val
    end

  end

  def first
    each_with_index do |item, index|
      return item if index == 0
    end
  end

  def each_with_index(&block)
    index = 0
    each do |item|
      block.call(item, index)
      index += 1
    end
  end

  def max
    reduce {|prev, ele| ele > prev ? ele : prev}
  end

  def min
    reduce {|prev, ele| ele < prev ? ele : prev}
  end

  alias_method :select, :find_all
end

class MyArray
  include MyEnumerable

  attr_reader :items

  def initialize(*list)
    @list = list.flatten
  end

  def each(&block)
    @list.each(&block)
    self
  end

  def ==(other)
    @items = other.items
  end
end

arr = MyArray.new([1,2,[3,4]])

arr.each do |i|
  puts i
end

p arr.map{|a| a*a }

# a = arr.find(lambda {0}) do |element|
#   element == 4
# end
# p a

a = arr.find() do |element|
  element < 1
end
p a

a = arr.find_all { |element| element > 1 }
p a

a = arr.select { |element| element > 1 }
p a

a = arr.select { |element| element > 1 }
p a

puts '-------'
p arr.reduce(0){|sum, ele| sum + ele}
p arr.reduce(:+)

arr2 = MyArray.new(%w(a b c d))
arr3 = MyArray.new()

p arr2.reduce{|memo, ele| memo.ord + ele.ord}
p arr.reduce{|memo, ele| memo + ele}
p arr3.reduce(:+)

p arr2.first
p arr.first

p arr2.max
p arr.max

p arr2.min
p arr.min
