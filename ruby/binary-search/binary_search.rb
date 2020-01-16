=begin
Write your code for the 'Binary Search' exercise in this file. Make the tests in
`binary_search_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/binary-search` directory.
=end

require 'byebug'

class BinarySearch
  attr_reader :search_list, :value

  def initialize(list)
    @search_list = list
    @value = nil

    raise ArgumentError, 'unsorted list given' if unsorted?
  end

  def search_for(value)
    @value = value

    result = binary_search(0, search_list.size - 1)

    raise RuntimeError if result == []

    result
  end

  def middle
    search_list.size / 2
  end

  private

  def binary_search(left_index, right_index)
    return middle if search_list[middle] == value

    left_index = middle if search_list[middle] < value
    right_index = middle if search_list[middle] > value


    @search_list.slice!(left_index..right_index)

    binary_search(left_index, right_index)
  end

  def unsorted?
    search_list != search_list.sort
  end
end
