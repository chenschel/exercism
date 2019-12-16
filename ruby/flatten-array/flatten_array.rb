class FlattenArray
  class << self
    def flatten(arr)
      result_arr = []

      arr.each do |elem|
        if elem.is_a? Array
          result_arr += flatten(elem)
        else
          result_arr << elem
        end
      end

      result_arr.compact
    end

    def flatten2(arr)
      arr.join(',')
         .split(',')
         .each_with_object([]) { |elem, acc| acc << elem.to_i unless elem == '' }
    end
  end
end
