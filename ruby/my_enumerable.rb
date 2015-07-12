module MyEnumerable

  def map(&block)
    result = []
    self.each do |ele|
      result << block.call(ele)
    end
    result
  end

  def find(ifnone=nil, &block)
    each do |ele|
      return ele if block.call(ele)
    end
    ifnone && ifnone.call
  end

  def find_all(&block)
    result = []
    each do |ele|
      result << ele if block.call(ele)
    end
    result
  end

  alias_method :select, :find_all

  def reduce(memo=nil, &block)
    unless block_given?
      op = memo
      memo = nil
    end
    each do |ele|
      if memo.nil?
        memo = ele
        next
      end
      if block_given?
        memo = block.call(memo, ele)
        next
      end
      memo = memo.send(op, ele)
    end
    memo
  end

  def first
    each do |ele|
      return ele
    end
  end

  def max
    reduce do |memo, ele|
      memo = memo > ele ? memo : ele
    end
  end

  def min
    reduce do |memo, ele|
      memo = memo < ele ? memo : ele
    end
  end

  def sort_by(&block)

  end
end

class MyEnumerator

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

a = arr.find(lambda {0}) do |element|
  element == 4
end
p a

a = arr.find() do |element|
  element < 1
end
p a

a = arr.find_all { |element| element > 1 }
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
