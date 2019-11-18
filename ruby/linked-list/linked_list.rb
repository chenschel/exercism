class Node
  attr_accessor :previous_node, :next_node, :value

  def initialize(previous_node: nil, value: nil)
    @previous_node = previous_node
    @value = value
    @next_node = nil
  end
end

class Deque
  attr_accessor :list

  def initialize
    @list = []
  end

  def push(value)
    previous_node = nil

    previous_node = list.last if list.any?

    new_node = Node.new(previous_node: previous_node, value: value)

    previous_node.next_node = new_node if previous_node

    list << new_node
  end

  def pop
    removed_node = list.pop

    if list.any?
      last_node = list.last
      last_node.next_node = nil
    end

    removed_node.value
  end

  def shift
    removed_node = list.shift

    if list.any?
      first_node = list.first
      first_node.previous_node = nil
    end

    removed_node.value
  end

  def unshift(value)
    first_node = nil

    first_node = list.first if list.any?

    new_node = Node.new(previous_node: nil, value: value)
    new_node.next_node = first_node

    first_node.previous_node = new_node if first_node

    list.unshift(new_node)
  end
end
