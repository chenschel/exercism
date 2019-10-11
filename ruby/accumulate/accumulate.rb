class Array
  def accumulate(&block)
    result = []
    enumerator = to_enum

    while true
      result << handle_item(enumerator.next, &block)
    end
  rescue StopIteration
    result
  end

  private

  def handle_item(item, &block)
    case item
    when Integer
      item * item
    when String
      return yield(item) if block_given?

      item
    end
  end
end
