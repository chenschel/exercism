class Isogram
  class << self
    def isogram?(input)
      input.downcase
           .scan(/[[:alpha:]]/)
           .group_by(&:itself)
           .map { |_, value| value.count == 1 }
           .all?
    end
  end
end
