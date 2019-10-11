require 'byebug'

class Array
  private

  def helper(enumerator, mode:, &block)
    checker = true
    value = enumerator.next
    checker = block.call(value) if block_given?

    return value if mode == :keep && checker

    value if mode == :discard && !checker
  end

  public

  def keep(&block)
    result = []
    enumerator = to_enum

    loop do
      result << helper(enumerator, mode: :keep, &block)
    end

    result.compact
  end

  def discard(&block)
    result = []
    enumerator = to_enum

    loop do
      result << helper(enumerator, mode: :discard, &block)
    end

    result.compact
  end
end
