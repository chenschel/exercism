require 'byebug'

class ETL
  class << self
    def transform(old)
      old.each_with_object({}) do |item, hash|
        hash.merge!(transform_helper(item))
      end
    end

    private

    def transform_helper(item)
      value, letters = item
      letters.each_with_object({}) do |letter, hash|
        hash[letter.downcase] = value
      end
    end
  end
end
