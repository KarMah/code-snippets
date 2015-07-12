# Binary, Max Heap
# Only accepts Numbers
# Implementation Details can be found here: http://en.wikipedia.org/wiki/Heap_%28data_structure%29#Implementation
#
require 'forwardable'
class Heap
  extend Forwardable

  attr_accessor :nodes

  delegate size: :@nodes, empty?: :@nodes, clear: :@nodes

  class << self
    def merge(first, second)
      new_heap = Heap.new

      new_heap.tap do
        (first.nodes + second.nodes).each do |value|
          new_heap.push(value)
        end
      end
    end

    def meld(first, second)
      merge(first, second).tap do
        first.clear
        second.clear
      end
    end
  end

  def initialize(_nodes=nil)
    @nodes = []
    case _nodes
      when Array
        create(_nodes)
      when Numeric
        push(_nodes)
      when NilClass
      else
        raise ArgumentError
    end
  end

  def create(values)
    self.tap do
      values.each do |value|
        push(value)
      end
    end
  end

  def replace(value)
    nodes.shift.tap do
      push(value)
    end
  end

  # TODO :: Implement methods max/min dynamically based on the type
  def peek
    nodes.first
  end

  # TODO :: Revisit based on the type of the heap by implementing dynamic Comparable
  def pop
    nodes.first.tap do
      nodes.unshift nodes.pop
      sift_down(0)
    end
  end

  alias :delete :pop

  # TODO :: Revisit based on the type of the heap by implementing dynamic Comparable
  def push(value)
    self.tap do
      nodes.push(value)
      sift_up(nodes.length-1)
    end
  end

  # TODO :: Implement me
  def sift_up(index)
    while true
      return if index<=0
      child, parent = index, parent_position(index)
      # puts "child => #{index}, parent => #{parent}, condition => #{nodes[child] <= nodes[parent]}"
      break if nodes[child] <= nodes[parent]
      temp = nodes[parent]
      nodes[parent] = nodes[child]
      nodes[child] = temp
      index = parent
    end
  end

  def sift_down(index)
    while true
      child = children_positions(index).sort do |i,j|
        nodes[j] <=> nodes[i]
      end.first
      break if !child || !nodes[child] || nodes[index] > nodes[child]

      temp = nodes[index]
      nodes[index] = nodes[child]
      nodes[child] = temp
      index = child
    end
  end

  # TODO :: Implement me
  def heapify
    nodes.last
  end

  private

  def parent_position(child_pos)
    (child_pos-1)/2
  end

  def children_positions(parent_pos)
    [2*parent_pos+1, 2*parent_pos+2].select{|i| (0..nodes.length-1).include?(i)}
  end
end

h = Heap.new([1,2,4,5,8,3,10,41,32,14,17])
h.push(10)
p h
h.push(12)
p h
h.push(8)
p h
h.push(14)
p h
h.pop
p h

p h.peek

# p h.size
#
# h1 = Heap.new([1,2,3])
# h2 = Heap.new([1,3,5])
# p Heap.meld(h1, h2)
# p h1
# p h2
