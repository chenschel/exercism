class SecretHandshake
  attr_reader :code

  private

  def initialize(code)
    @code = code
  end

  def valid_code?
    code.is_a?(Integer) && 1 <= code && code <= 31
  end

  public

  def commands
    return [] unless valid_code?

    available_operations = ['wink', 'double blink', 'close your eyes', 'jump', 'reverse'].reverse

    code.to_s(2).chars.reverse.each_with_object([]) do |bit, operations|
      operation = available_operations.pop
      if bit == '1' && operation == 'reverse'
        operations.reverse!
      elsif bit == '1'
        operations.push(operation) if bit == '1'
      end
    end.compact
  end
end
