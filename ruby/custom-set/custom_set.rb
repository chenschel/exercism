require 'pry'

class CustomSet
  attr_reader :elements

  def initialize(an_array)
    @elements = []
    an_array.each { |elem| add(elem) }
  end

  def union(custom_set)
    CustomSet.new(@elements + custom_set.elements)
  end

  def difference(custom_set)
    return create_difference(custom_set) if !empty? && !custom_set.empty? && !subset?(custom_set)
    self
  end

  def intersection(custom_set)
    return create_intersection(custom_set) if !empty? && !custom_set.empty? && !subset?(custom_set)
    return CustomSet.new([]) if !empty? && custom_set.empty? || !subset?(custom_set)
    
    self
  end

  def create_difference(custom_set)
    combine = @elements + custom_set.elements
    combine.map! { |elem| elem if @elements.include?(elem) && !custom_set.elements.include?(elem) }

    CustomSet.new(combine.compact)
  end

  def create_intersection(custom_set)
    combine = @elements + custom_set.elements
    combine.map! { |elem| elem if @elements.include?(elem) && custom_set.elements.include?(elem) }

    CustomSet.new(combine.compact)
  end

  def add(element)
    @elements.push(element) if !@elements.include?(element)
    self
  end

  def ==(custom_set)
    @elements.sort == custom_set.elements.sort
  end

  def disjoint?(custom_set)
    return true if empty? && custom_set.empty?
    return true if empty? && !custom_set.empty?
    return true if !empty? && custom_set.empty?
    !@elements.any? { |elem| custom_set.elements.include?(elem) }
  end

  def subset?(custom_set)
    return true if @elements == custom_set.elements
    return true if empty? && custom_set.empty?
    return true if empty? && !custom_set.empty?
    return false if !empty? && custom_set.empty?
    !@elements.any? { |elem| !custom_set.elements.include?(elem) }
  end

  def member?(member)
    @elements.include?(member)
  end

  def empty?
    @elements.empty?
  end

  def to_s
    @elements
  end
end
