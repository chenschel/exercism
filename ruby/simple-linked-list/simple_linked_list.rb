require 'pry'

class SimpleLinkedList
  def initialize(elements = [])
    @elements = elements.map { |element| Element.new(element) }
  end

  def reverse!
    @elements.reverse!
    self
  end

  def to_a
    @elements.map { |element| element.datum }.reverse
  end

  def push(element)
    @elements.push(element)
    self
  end

  def pop
    @elements.pop
  end
end

class Element
  attr_reader :datum
  attr_accessor :next

  def initialize(number)
    @datum = number
    @next = nil
  end
end